import 'dart:io';

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
sealed class Connected extends WithRadioId {
  Connected({
    this.isNewRadio = false,
    required super.radioId,
  });

  final bool isNewRadio;

  Connected copyWith({bool? isNewRadio, String? radioId}) {
    final _this = this;
    switch (_this) {
      case BleConnected():
        return BleConnected(
          bleCharacteristics: _this.bleCharacteristics,
          device: _this.device,
          isNewRadio: isNewRadio ?? _this.isNewRadio,
          radioId: radioId ?? _this.radioId,
        );
      case TcpConnected():
        return TcpConnected(
          socket: _this.socket,
          isNewRadio: isNewRadio ?? _this.isNewRadio,
          radioId: radioId ?? _this.radioId,
        );
    }
  }
}

@immutable
class BleConnected extends Connected {
  BleConnected({
    required this.bleCharacteristics,
    required this.device,
    super.isNewRadio = false,
    required super.radioId,
  });

  final BleCharacteristics bleCharacteristics;
  final BluetoothDevice device;
}

@immutable
class TcpConnected extends Connected {
  TcpConnected({
    required this.socket,
    super.isNewRadio = false,
    required super.radioId,
  });

  final Socket socket;
}

@immutable
class ConnectionError extends WithRadioId {
  ConnectionError({String? msg, required super.radioId})
      : msg = msg ?? 'Unknown error';

  final String msg;
}
