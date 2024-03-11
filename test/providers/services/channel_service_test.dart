import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/protobufs/generated/meshtastic/channel.pb.dart';
import 'package:meshx/protobufs/generated/meshtastic/mesh.pb.dart';
import 'package:meshx/providers/ble/radio_reader.dart';
import 'package:meshx/providers/services/channel_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../common.dart';
import '../../mock_stream.dart';
import 'channel_service_test.mocks.dart';

@GenerateMocks([
  RadioReader,
])
void main() {
  late ProviderContainer container;
  late MockRadioReader radioReader;
  late MockStream<FromRadio> stream;

  setUp(() {
    radioReader = MockRadioReader();
    stream = MockStream();
    when(radioReader.onPacketReceived()).thenAnswer((_) => stream);
    container = createContainer(
      overrides: [radioReaderProvider.overrideWith((ref) => radioReader)],
    );
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
}
