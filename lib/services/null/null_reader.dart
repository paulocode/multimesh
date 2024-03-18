import 'dart:async';

import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../interfaces/radio_reader.dart';

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
