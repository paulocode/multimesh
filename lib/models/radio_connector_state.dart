import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'ble_characteristics.dart';
import 'mesh_radio.dart';

sealed class RadioConnectorState {}

@immutable
abstract class WithRadio<T extends MeshRadio> extends RadioConnectorState {
  WithRadio({required this.radio});

  final T radio;
  String get radioId => radio.remoteId;
}

@immutable
class Disconnected extends RadioConnectorState {
  Disconnected({this.errorMsg});

  final String? errorMsg;
}

@immutable
class Connecting<T extends MeshRadio> extends WithRadio<T> {
  Connecting({required super.radio});
}

@immutable
sealed class Connected<T extends MeshRadio> extends WithRadio<T> {
  Connected({
    this.isNewRadio = false,
    required super.radio,
  });

  final bool isNewRadio;

  Connected copyWith({bool? isNewRadio, T? radio}) {
    switch (this) {
      case BleConnected():
        final _this = this as BleConnected;
        return BleConnected(
          bleCharacteristics: _this.bleCharacteristics,
          isNewRadio: isNewRadio ?? _this.isNewRadio,
          radio: radio == null ? _this.radio : radio as BleMeshRadio,
        );
      case TcpConnected():
        final _this = this as TcpConnected;
        return TcpConnected(
          socket: _this.socket,
          recvStream: _this.recvStream,
          isNewRadio: isNewRadio ?? _this.isNewRadio,
          radio: radio == null ? _this.radio : radio as TcpMeshRadio,
        );
    }
  }
}

@immutable
class BleConnected extends Connected<BleMeshRadio> {
  BleConnected({
    required this.bleCharacteristics,
    super.isNewRadio = false,
    required super.radio,
  });

  final BleCharacteristics bleCharacteristics;
  BluetoothDevice get device => radio.device;

  @override
  String toString() {
    return 'BleConnected{${device.advName} $radioId}';
  }
}

@immutable
class TcpConnected extends Connected<TcpMeshRadio> {
  TcpConnected({
    required this.socket,
    required this.recvStream,
    super.isNewRadio = false,
    required super.radio,
  });

  // because socket is not a broadcast stream, create recvStream
  // that is broadcast. do not listen to socket directly. you can use
  // socket for close() and add().
  final Socket socket;
  final Stream<List<int>> recvStream;

  @override
  String toString() {
    return 'TcpConnected{$radioId}';
  }
}

@immutable
class ConnectionError<T extends MeshRadio> extends WithRadio<T> {
  ConnectionError({String? msg, required super.radio})
      : msg = msg ?? 'Unknown error';

  final String msg;
}
