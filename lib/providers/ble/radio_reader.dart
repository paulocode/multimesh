import 'dart:async';

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/radio_connector_state.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import 'radio_connector.dart';

part 'radio_reader.g.dart';

@Riverpod(keepAlive: true)
RadioReader radioReader(RadioReaderRef ref) {
  return RadioReader(
    radioConnectorState: ref.watch(radioConnectorProvider),
    onDispose: ref.onDispose,
  );
}

class RadioReader {
  RadioReader({
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
    fromNum.setNotifyValue(true);
  }

  final RadioConnectorState _radioConnectorState;
  final _logger = Logger();
  final _packetStreamController = StreamController<FromRadio>.broadcast();

  Stream<FromRadio> onPacketReceived() => _packetStreamController.stream;

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
