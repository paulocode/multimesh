import 'dart:async';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart' hide Logger;
import 'package:logger/logger.dart';

import '../../models/radio_connector_state.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../interfaces/radio_reader.dart';

class BleRadioReader implements RadioReader, ForceReadableRadioReader {
  BleRadioReader({
    required RadioConnectorState radioConnectorState,
    required void Function(void Function() cb) onDispose,
    required FlutterReactiveBle ble,
  })  : _radioConnectorState = radioConnectorState,
        _ble = ble {
    if (_radioConnectorState is! BleConnected) {
      return;
    }

    final fromNum = _radioConnectorState.bleCharacteristics.fromNum;
    final subscription = _ble.subscribeToCharacteristic(fromNum).listen((event) async {
      await _readUntilEmpty();
    });

    onDispose(subscription.cancel);
    onDispose(_packetStreamController.close);
  }

  var _isRunningReadLoop = false;
  final RadioConnectorState _radioConnectorState;
  final FlutterReactiveBle _ble;
  final _logger = Logger();
  final _packetStreamController = StreamController<FromRadio>.broadcast();

  @override
  Stream<FromRadio> onPacketReceived() => _packetStreamController.stream;

  @override
  void forceRead() {
    _readUntilEmpty();
  }

  Future<void> _readUntilEmpty() async {
    if (_radioConnectorState is! BleConnected) {
      return;
    }
    if (_isRunningReadLoop) {
      return;
    }
    _isRunningReadLoop = true;
    try {
      var read = <int>[];
      do {
        read = await _ble.readCharacteristic(
          _radioConnectorState.bleCharacteristics.fromRadio,
        );
        final fromRadioPacket = FromRadio.fromBuffer(read);
        _logger.i(fromRadioPacket);
        if (read.isNotEmpty) {
          _packetStreamController.add(fromRadioPacket);
        }
      } while (read.isNotEmpty);
    } finally {
      _isRunningReadLoop = false;
    }
  }
}
