import 'dart:async';

import 'package:logger/logger.dart';

import '../../models/radio_connector_state.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../interfaces/radio_reader.dart';

class BleRadioReader implements RadioReader, ForceReadableRadioReader {
  BleRadioReader({
    required RadioConnectorState radioConnectorState,
    required void Function(void Function() cb) onDispose,
  }) : _radioConnectorState = radioConnectorState {
    if (_radioConnectorState is! BleConnected) {
      return;
    }

    final fromNum = _radioConnectorState.bleCharacteristics.fromNum;
    final subscription = fromNum.onValueReceived.listen((event) async {
      await _readUntilEmpty();
    });

    onDispose(subscription.cancel);
    onDispose(_packetStreamController.close);
    fromNum.setNotifyValue(true);
  }

  var _isRunningReadLoop = false;
  final RadioConnectorState _radioConnectorState;
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
        read = await _radioConnectorState.bleCharacteristics.fromRadio.read();
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
