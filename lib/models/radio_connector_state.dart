import 'package:flutter/cupertino.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'ble_characteristics.dart';

sealed class RadioConnectorState {}

@immutable
abstract class WithRadioId extends RadioConnectorState {
  WithRadioId({required this.radioId});

  final String radioId;
}

@immutable
class Disconnected extends RadioConnectorState {
  Disconnected({this.errorMsg});

  final String? errorMsg;
}

@immutable
class Connecting extends WithRadioId {
  Connecting({required super.radioId});
}

@immutable
class Connected extends WithRadioId {
  Connected({
    required this.bleCharacteristics,
    required this.device,
    required this.isNewRadio,
    required super.radioId,
  });

  final BleCharacteristics bleCharacteristics;
  final BluetoothDevice device;
  final bool isNewRadio;
}

@immutable
class ConnectionError extends WithRadioId {
  ConnectionError({String? msg, required super.radioId})
      : msg = msg ?? 'Unknown error';

  final String msg;
}
