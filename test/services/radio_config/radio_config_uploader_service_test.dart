import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multimesh/protobufs/generated/meshtastic/admin.pb.dart';
import 'package:multimesh/protobufs/generated/meshtastic/config.pb.dart';
import 'package:multimesh/protobufs/generated/meshtastic/portnums.pb.dart';
import 'package:multimesh/providers/queued_radio_writer.dart';
import 'package:multimesh/providers/radio_config/radio_config_uploader_service.dart';
import 'package:multimesh/services/queued_radio_writer.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../common.dart';
import 'radio_config_uploader_service_test.mocks.dart';

@GenerateMocks([QueuedRadioWriter])
void main() {
  late ProviderContainer container;
  late MockQueuedRadioWriter writer;

  setUp(() {
    writer = MockQueuedRadioWriter();
    container = createContainer(
      overrides: [queuedRadioWriterProvider.overrideWith((_) => writer)],
    );
  });

  test('set lora config', () {
    when(
      writer.sendMeshPacket(
        to: 123,
        portNum: PortNum.ADMIN_APP,
        payload: anyNamed('payload'),
      ),
    ).thenReturn(9999);
    final loraConfig = Config_LoRaConfig(channelNum: 31415);

    container
        .read(radioConfigUploaderServiceProvider)
        .setLoraConfig(nodeNum: 123, loraConfig: loraConfig);

    final captured = verify(
      writer.sendMeshPacket(
        to: 123,
        portNum: PortNum.ADMIN_APP,
        payload: captureAnyNamed('payload'),
      ),
    ).captured.first as Uint8List;
    final capturedLoraConfig = AdminMessage.fromBuffer(captured).setConfig.lora;
    expect(capturedLoraConfig.channelNum, loraConfig.channelNum);
  });
}
