import 'dart:io';

import '../../constants/meshtastic_constants.dart';
import '../interfaces/radio_writer.dart';

class TcpRadioWriter implements RadioWriter {
  TcpRadioWriter({required IOSink socket}) : _socket = socket;
  final IOSink _socket;
  @override
  Future<void> write(List<int> payload) async {
    final payloadLen = payload.length;
    final packet = [
      MESHTASTIC_STREAM_START1,
      MESHTASTIC_STREAM_START2,
      payloadLen >> 8,
      payloadLen & 0xff,
      ...payload,
    ];
    _socket.add(packet);
  }
}
