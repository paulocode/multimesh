import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'ble_characteristics.dart';

sealed class RadioConnectorState {}

abstract class WithRadioId extends RadioConnectorState {
  WithRadioId({required this.radioId});

  final String radioId;
}

class Disconnected extends RadioConnectorState {}

class Connecting extends WithRadioId {
  Connecting({required super.radioId});
}

class Connected extends WithRadioId {
  Connected({
    required this.bleCharacteristics,
    required this.device,
    required super.radioId,
  });

  final BleCharacteristics bleCharacteristics;
  final BluetoothDevice device;
}

class ConnectionError extends WithRadioId {
  ConnectionError({required this.msg, required super.radioId});

  final String msg;
}
