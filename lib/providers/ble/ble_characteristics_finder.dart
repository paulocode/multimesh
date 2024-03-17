import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/ble_constants.dart';
import '../../exceptions/mesh_radio_exception.dart';
import '../../models/ble_characteristics.dart';

part 'ble_characteristics_finder.g.dart';

@Riverpod(keepAlive: true)
BleCharacteristicsFinder bleCharacteristicsFinder(
  BleCharacteristicsFinderRef ref,
) {
  return BleCharacteristicsFinder();
}

class BleCharacteristicsFinder {
  Future<BleCharacteristics> findCharacteristics(BluetoothDevice device) async {
    final services = await device.discoverServices();
    final service = services.firstWhere(
      (element) => element.uuid.str == MESHTASTIC_BLE_SERVICE,
      orElse: () =>
          throw const MeshRadioException(msg: 'Not a Meshtastic device'),
    );

    final toRadio = service.characteristics.firstWhere(
      (element) => element.uuid.str == MESHTASTIC_TORADIO_CHARACTERISTIC,
    );
    final fromRadio = service.characteristics.firstWhere(
      (element) => element.uuid.str == MESHTASTIC_FROMRADIO_CHARACTERISTIC,
    );
    final fromNum = service.characteristics.firstWhere(
      (element) => element.uuid.str == MESHTASTIC_FROMNUM_CHARACTERISTIC,
    );

    return BleCharacteristics(
      toRadio: toRadio,
      fromRadio: fromRadio,
      fromNum: fromNum,
    );
  }
}
