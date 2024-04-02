import 'package:logger/logger.dart';

import '../../protobufs/generated/meshtastic/admin.pb.dart';
import '../../protobufs/generated/meshtastic/config.pb.dart';
import '../../protobufs/generated/meshtastic/portnums.pb.dart';
import '../ack_waiting_radio_writer.dart';

class RadioConfigUploaderService {
  RadioConfigUploaderService({
    required AckWaitingRadioWriter radioWriter,
    required int myNodeNum,
  })  : _radioWriter = radioWriter,
        _myNodeNum = myNodeNum;

  final AckWaitingRadioWriter _radioWriter;
  final int _myNodeNum;
  final _logger = Logger();

  Future<void> uploadLoraConfig({
    required Config_LoRaConfig loraConfig,
  }) async {
    final adminMessage = AdminMessage(
      setConfig: Config(
        lora: loraConfig,
      ),
    );

    _logger.i('Setting loraConfig:\n$loraConfig');

    await _radioWriter.sendMeshPacket(
      to: _myNodeNum,
      portNum: PortNum.ADMIN_APP,
      payload: adminMessage.writeToBuffer(),
    );
  }
}
