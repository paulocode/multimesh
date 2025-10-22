import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BleCharacteristics {
  BleCharacteristics({
    required this.toRadio,
    required this.fromRadio,
    required this.fromNum,
  });

  final QualifiedCharacteristic toRadio;
  final QualifiedCharacteristic fromRadio;
  final QualifiedCharacteristic fromNum;
}
