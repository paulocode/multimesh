// coverage:ignore-file
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/ble/ble_characteristics_finder.dart';

part 'ble_characteristics_finder.g.dart';

@Riverpod(keepAlive: true)
BleCharacteristicsFinder bleCharacteristicsFinder(
  BleCharacteristicsFinderRef ref,
) {
  return BleCharacteristicsFinder();
}
