import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multimesh/models/radio_configuration.dart';
import 'package:multimesh/protobufs/generated/meshtastic/admin.pb.dart';
import 'package:multimesh/protobufs/generated/meshtastic/config.pb.dart';
import 'package:multimesh/protobufs/generated/meshtastic/mesh.pb.dart';
import 'package:multimesh/protobufs/generated/meshtastic/portnums.pb.dart';
import 'package:multimesh/providers/ack_waiting_radio_writer.dart';
import 'package:multimesh/providers/radio_config/radio_config_service.dart';
import 'package:multimesh/providers/radio_config/radio_config_uploader_service.dart';
import 'package:multimesh/services/queued_radio_writer.dart';

import '../../common.dart';
import 'radio_config_uploader_service_test.mocks.dart';

@GenerateMocks([AckWaitingRadioWriter])
void main() {
  late ProviderContainer container;
  late MockAckWaitingRadioWriter writer;

  setUp(() {
    writer = MockAckWaitingRadioWriter();
    container = createContainer(
      overrides: [
        ackWaitingRadioWriterProvider.overrideWith((_) => writer),
        radioConfigServiceProvider.overrideWith(MockRadioConfigService.new),
      ],
    );
    container.read(radioConfigServiceProvider.notifier).state =
        RadioConfiguration(
      loraConfig: Config_LoRaConfig(),
      myNodeInfo: NodeInfo(),
    ).copyWith(myNodeNum: 123);
  });

  test('set lora config', () {
    when(
      writer.sendMeshPacket(
        to: 123,
        portNum: PortNum.ADMIN_APP,
        payload: anyNamed('payload'),
      ),
    ).thenAnswer((_) async {});
    final loraConfig = Config_LoRaConfig(channelNum: 31415);

    container
        .read(radioConfigUploaderServiceProvider)
        .uploadLoraConfig(loraConfig: loraConfig);

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
