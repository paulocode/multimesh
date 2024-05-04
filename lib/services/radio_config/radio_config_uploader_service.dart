import 'package:logger/logger.dart';

import '../../protobufs/generated/meshtastic/admin.pb.dart';
import '../../protobufs/generated/meshtastic/config.pb.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../../protobufs/generated/meshtastic/module_config.pb.dart';
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

  Future<void> uploadUser({
    required User user,
  }) async {
    _logger.i('Setting user: $user');
    final adminMessage = AdminMessage(
      setOwner: user,
    );
    await _radioWriter.sendMeshPacket(
      to: _myNodeNum,
      portNum: PortNum.ADMIN_APP,
      payload: adminMessage.writeToBuffer(),
    );
  }

  Future<void> uploadBluetoothConfig({
    required Config_BluetoothConfig bluetoothConfig,
  }) async {
    _logger.i('Setting bt config: \n$bluetoothConfig');
    final adminMessage = AdminMessage(
      setConfig: Config(
        bluetooth: bluetoothConfig,
      ),
    );
    await _radioWriter.sendMeshPacket(
      to: _myNodeNum,
      portNum: PortNum.ADMIN_APP,
      payload: adminMessage.writeToBuffer(),
    );
  }

  Future<void> sendShutdown() async {
    final adminMessage = AdminMessage(shutdownSeconds: 5);
    await _radioWriter.sendMeshPacket(
      to: _myNodeNum,
      portNum: PortNum.ADMIN_APP,
      payload: adminMessage.writeToBuffer(),
    );
  }

  Future<void> sendReboot() async {
    final adminMessage = AdminMessage(rebootSeconds: 5);
    await _radioWriter.sendMeshPacket(
      to: _myNodeNum,
      portNum: PortNum.ADMIN_APP,
      payload: adminMessage.writeToBuffer(),
    );
  }

  Future<void> uploadTelemetryConfig({
    required ModuleConfig_TelemetryConfig telemetryConfig,
  }) async {
    _logger.i('Setting telemetry config: \n$telemetryConfig');
    final adminMessage = AdminMessage(
      setModuleConfig: ModuleConfig(
        telemetry: telemetryConfig,
      ),
    );
    await _radioWriter.sendMeshPacket(
      to: _myNodeNum,
      portNum: PortNum.ADMIN_APP,
      payload: adminMessage.writeToBuffer(),
    );
  }
}
