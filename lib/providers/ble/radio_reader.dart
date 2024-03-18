import 'dart:async';

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/radio_connector_state.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../services/radio_connector_service.dart';

part 'radio_reader.g.dart';

@Riverpod(keepAlive: true)
RadioReader radioReader(RadioReaderRef ref) {
  final sub = ref.listen(radioConnectorServiceProvider, (_, next) {
    if (next is Connected) {
      ref.invalidateSelf();
    }
  });
  ref.onDispose(sub.close);

  final connectorState = sub.read();
  switch (connectorState) {
    case BleConnected():
      return BleRadioReader(
        radioConnectorState: sub.read(),
        onDispose: ref.onDispose,
      );
    case TcpConnected():
      return NullReader(onDispose: ref.onDispose);
    case _:
      return NullReader(onDispose: ref.onDispose);
  }
}

// TODO create dart file for this class
abstract class RadioReader {
  Stream<FromRadio> onPacketReceived();
  void forceRead();
}

class NullReader implements RadioReader {
  NullReader({
    required void Function(void Function() cb) onDispose,
  }) {
    onDispose(_streamController.close);
  }

  // ignore: close_sinks
  final _streamController = StreamController<FromRadio>.broadcast();

  @override
  void forceRead() {}

  @override
  Stream<FromRadio> onPacketReceived() => _streamController.stream;
}

class BleRadioReader implements RadioReader {
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
    var read = <int>[];
    do {
      read = await _radioConnectorState.bleCharacteristics.fromRadio.read();
      final fromRadioPacket = FromRadio.fromBuffer(read);
      _logger.i(fromRadioPacket);
      if (read.isNotEmpty) {
        _packetStreamController.add(fromRadioPacket);
      }
    } while (read.isNotEmpty);
  }
}
