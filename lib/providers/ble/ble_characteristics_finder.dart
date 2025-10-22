// coverage:ignore-file
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/ble/ble_characteristics_finder.dart';

part 'ble_characteristics_finder.g.dart';

@Riverpod(keepAlive: true)
BleCharacteristicsFinder bleCharacteristicsFinder(Ref ref) {
  return BleCharacteristicsFinder(FlutterReactiveBle());
}
