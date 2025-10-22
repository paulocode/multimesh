import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

import '../../constants/ble_constants.dart';
import '../../exceptions/mesh_radio_exception.dart';
import '../../models/ble_characteristics.dart';

class BleCharacteristicsFinder {
  BleCharacteristicsFinder(this._ble);

  final FlutterReactiveBle _ble;

  Future<BleCharacteristics> findCharacteristics(String deviceId) async {
    final services = await _ble.discoverServices(deviceId);
    final service = services.firstWhere(
      (element) => element.serviceId.toString().toLowerCase() ==
          MESHTASTIC_BLE_SERVICE.toLowerCase(),
      orElse: () =>
          throw const MeshRadioException(msg: 'Not a Meshtastic device'),
    );

    final toRadioId = service.characteristics.firstWhere(
      (element) => element.characteristicId.toString().toLowerCase() ==
          MESHTASTIC_TORADIO_CHARACTERISTIC.toLowerCase(),
    );
    final fromRadioId = service.characteristics.firstWhere(
      (element) => element.characteristicId.toString().toLowerCase() ==
          MESHTASTIC_FROMRADIO_CHARACTERISTIC.toLowerCase(),
    );
    final fromNumId = service.characteristics.firstWhere(
      (element) => element.characteristicId.toString().toLowerCase() ==
          MESHTASTIC_FROMNUM_CHARACTERISTIC.toLowerCase(),
    );

    return BleCharacteristics(
      toRadio: QualifiedCharacteristic(
        serviceId: service.serviceId,
        characteristicId: toRadioId.characteristicId,
        deviceId: deviceId,
      ),
      fromRadio: QualifiedCharacteristic(
        serviceId: service.serviceId,
        characteristicId: fromRadioId.characteristicId,
        deviceId: deviceId,
      ),
      fromNum: QualifiedCharacteristic(
        serviceId: service.serviceId,
        characteristicId: fromNumId.characteristicId,
        deviceId: deviceId,
      ),
    );
  }
}
