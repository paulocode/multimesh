import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

import '../../exceptions/mesh_radio_exception.dart';
import '../../models/radio_connector_state.dart';
import '../interfaces/radio_writer.dart';

class BleRadioWriter implements RadioWriter {
  BleRadioWriter(BleConnected connectorState, this._ble)
      : _to = connectorState.bleCharacteristics.toRadio;

  final FlutterReactiveBle _ble;
  final QualifiedCharacteristic _to;

  @override
  Future<void> write(List<int> value) async {
    try {
      await _ble.writeCharacteristicWithResponse(_to, value: value);
    } catch (e) {
      throw MeshRadioException(msg: e.toString());
    }
  }
}
