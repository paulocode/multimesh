import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/constants/meshtastic_constants.dart';
import 'package:meshx/protobufs/generated/meshtastic/admin.pb.dart';
import 'package:meshx/protobufs/generated/meshtastic/channel.pb.dart';
import 'package:meshx/protobufs/generated/meshtastic/config.pb.dart';
import 'package:meshx/protobufs/generated/meshtastic/mesh.pb.dart';
import 'package:meshx/protobufs/generated/meshtastic/portnums.pb.dart';
import 'package:meshx/providers/ble/radio_reader.dart';
import 'package:meshx/providers/radio_writer/queued_radio_writer.dart';
import 'package:meshx/providers/services/channel_service.dart';
import 'package:meshx/providers/services/radio_config_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../common.dart';
import '../../mock_stream.dart';
import 'channel_service_test.mocks.dart';

@GenerateMocks([
  RadioReader,
  QueuedRadioWriter,
  RadioConfigService,
])
void main() {
  late ProviderContainer container;
  late MockRadioReader radioReader;
  late MockQueuedRadioWriter radioWriter;
  late MockStream<FromRadio> stream;

  setUp(() {
    radioReader = MockRadioReader();
    radioWriter = MockQueuedRadioWriter();
    stream = MockStream();
    when(radioReader.onPacketReceived()).thenAnswer((_) => stream);
    when(
      radioWriter.sendMeshPacket(
        to: anyNamed('to'),
        portNum: anyNamed('portNum'),
        payload: anyNamed('payload'),
      ),
    ).thenReturn(1);
    container = createContainer(
      overrides: [
        radioReaderProvider.overrideWith((ref) => radioReader),
        queuedRadioWriterProvider.overrideWith((ref) => radioWriter),
      ],
    );
    container.read(radioConfigServiceProvider.notifier).setMyNodeNum(555);
    // eagerly initialize to start accepting packets
    container.read(channelServiceProvider);
  });

  test('channels initially all unused', () async {
    final channels = container.read(channelServiceProvider);

    container.listen(channelServiceProvider, (previous, next) {});

    expect(channels.every((element) => !element.used), isTrue);
  });

  test('add channel from radio', () async {
    await stream.emit(
      FromRadio(channel: Channel(index: 0, role: Channel_Role.PRIMARY)),
    );
    final channels = container.read(channelServiceProvider);
    expect(channels[0].name, equals('LONG_FAST'));
  });

  test('add multiple channels from radio', () async {
    await stream.emit(
      FromRadio(channel: Channel(index: 0, role: Channel_Role.PRIMARY)),
    );
    await stream.emit(
      FromRadio(
        channel: Channel(
          index: 1,
          role: Channel_Role.SECONDARY,
          settings: ChannelSettings(name: 'second'),
        ),
      ),
    );

    final channels = container.read(channelServiceProvider);
    expect(channels[0].name, equals('LONG_FAST'));
    expect(channels[1].name, equals('second'));
  });

  test('dont add negative index', () async {
    await stream.emit(
      FromRadio(channel: Channel(index: -1, role: Channel_Role.PRIMARY)),
    );

    final channels = container.read(channelServiceProvider);
    expect(channels.every((element) => !element.used), isTrue);
  });

  test('valid QR', () async {
    final isValid = container
        .read(channelServiceProvider.notifier)
        .validateQr('https://meshtastic.org/e/#kasldjaslkdjaslkdjaslkdjaslkd');
    expect(isValid, isTrue);
  });

  test('invalid QR', () async {
    final isValid = container
        .read(channelServiceProvider.notifier)
        .validateQr('example.com');
    expect(isValid, isFalse);
  });

  test('process QR', () async {
    await container.read(channelServiceProvider.notifier).processQr(
          'https://meshtastic.org/e/#CisSIIrA4R6zaST5Rl9xgSQV-pI7iuykDaeGdDOzkw6Z1-TeGgdwcml2YXRlCgMSAQESDggBOAFAA0gBUB5YFGgB',
        );

    final verification = verify(
      radioWriter.sendMeshPacket(
        to: 555,
        portNum: PortNum.ADMIN_APP,
        payload: captureAnyNamed('payload'),
      ),
    );

    final setChannel0 =
        AdminMessage.fromBuffer(verification.captured[0] as List<int>)
            .setChannel;
    expect(setChannel0.index, equals(0));
    expect(setChannel0.role, equals(Channel_Role.PRIMARY));
    expect(
      base64.encode(setChannel0.settings.psk),
      equals('isDhHrNpJPlGX3GBJBX6kjuK7KQNp4Z0M7OTDpnX5N4='),
    );
    expect(setChannel0.settings.name, equals('private'));

    final setChannel1 =
        AdminMessage.fromBuffer(verification.captured[1] as List<int>)
            .setChannel;
    expect(setChannel1.index, equals(1));
    expect(setChannel1.role, equals(Channel_Role.SECONDARY));
    expect(setChannel1.settings.psk, equals([1]));
    expect(setChannel1.settings.name, equals(''));

    for (var i = 2; i < MESHTASTIC_MAX_CHANNELS; i++) {
      final setChanneln =
          AdminMessage.fromBuffer(verification.captured[i] as List<int>)
              .setChannel;
      expect(setChanneln.index, equals(i));
      expect(setChanneln.role, equals(Channel_Role.DISABLED));
    }

    final lora =
        AdminMessage.fromBuffer(verification.captured.last as List<int>)
            .setConfig
            .lora;
    expect(lora.usePreset, isTrue);
    expect(lora.region, equals(Config_LoRaConfig_RegionCode.US));
    expect(lora.hopLimit, equals(3));
    expect(lora.txEnabled, isTrue);
    expect(lora.txPower, equals(30));
    expect(lora.channelNum, equals(20));
    expect(lora.sx126xRxBoostedGain, isTrue);
  });

  test('base64 length not div by 4', () async {
    await container.read(channelServiceProvider.notifier).processQr(
          'https://meshtastic.org/e/#CisSILT_OsqtbsG65wfxsvI9XehRaM9nfA1nYydXhyD-TZonGgdwcml2YXRlCggSAQElAQAAABIOCAE4AUADSAFQG1gUaAE',
        );

    verify(
      radioWriter.sendMeshPacket(
        to: anyNamed('to'),
        portNum: anyNamed('portNum'),
        payload: captureAnyNamed('payload'),
      ),
    );
  });
}
