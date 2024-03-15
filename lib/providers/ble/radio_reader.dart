import 'dart:async';

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/radio_connector_state.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import 'radio_connector.dart';

part 'radio_reader.g.dart';

@Riverpod(keepAlive: true)
RadioReader radioReader(RadioReaderRef ref) {
  final sub = ref.listen(radioConnectorProvider, (_, next) {
    if (next is Connected) {
      ref.invalidateSelf();
    }
  });
  ref.onDispose(sub.close);
  return BleRadioReader(
    radioConnectorState: sub.read(),
    onDispose: ref.onDispose,
  );
}

abstract class RadioReader {
  Stream<FromRadio> onPacketReceived();
  void forceRead();
}

class BleRadioReader implements RadioReader {
  BleRadioReader({
    required RadioConnectorState radioConnectorState,
    required void Function(void Function() cb) onDispose,
  }) : _radioConnectorState = radioConnectorState {
    if (_radioConnectorState is! Connected) {
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
    if (_radioConnectorState is! Connected) {
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
