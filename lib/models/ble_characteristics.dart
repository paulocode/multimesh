import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BleCharacteristics {
  BleCharacteristics({
    required this.toRadio,
    required this.fromRadio,
    required this.fromNum,
  });

  final BluetoothCharacteristic toRadio;
  final BluetoothCharacteristic fromRadio;
  final BluetoothCharacteristic fromNum;
}
