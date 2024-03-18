import 'package:logger/logger.dart';

import '../../protobufs/generated/meshtastic/admin.pb.dart';
import '../../protobufs/generated/meshtastic/config.pb.dart';
import '../../protobufs/generated/meshtastic/portnums.pb.dart';
import '../queued_radio_writer.dart';

class RadioConfigUploaderService {
  RadioConfigUploaderService({
    required QueuedRadioWriter radioWriter,
  }) : _radioWriter = radioWriter;

  final QueuedRadioWriter _radioWriter;
  final _logger = Logger();

  Future<void> setRegion({
    required int nodeNum,
    required Config_LoRaConfig_RegionCode region,
  }) async {
    final adminMessage = AdminMessage(
      setConfig: Config(
        lora: Config_LoRaConfig(
          region: region,
          usePreset: true,
          hopLimit: 3,
          txEnabled: true,
          txPower: 30,
          sx126xRxBoostedGain: true,
        ),
      ),
    );

    _logger.i('Setting region...\n$adminMessage');

    _radioWriter.sendMeshPacket(
      to: nodeNum,
      portNum: PortNum.ADMIN_APP,
      payload: adminMessage.writeToBuffer(),
    );
  }
}
