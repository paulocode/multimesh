import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../interfaces/radio_writer.dart';

class BleRadioWriter implements RadioWriter {
  BleRadioWriter({required BluetoothCharacteristic to}) : _to = to;

  final BluetoothCharacteristic _to;

  @override
  Future<void> write(List<int> value) async {
    await _to.write(value);
  }
}
