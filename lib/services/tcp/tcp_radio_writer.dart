import 'dart:io';

import '../../constants/meshtastic_constants.dart';
import '../interfaces/radio_writer.dart';

class TcpRadioWriter implements RadioWriter {
  TcpRadioWriter({required IOSink socket}) : _socket = socket;
  final IOSink _socket;
  @override
  Future<void> write(List<int> value) async {
    final packetLen = value.length;
    final header = [
      MESHTASTIC_STREAM_START1,
      MESHTASTIC_STREAM_START2,
      packetLen >> 8,
      packetLen & 0xff,
    ];
    _socket.add(header);
    _socket.add(value);
  }
}
