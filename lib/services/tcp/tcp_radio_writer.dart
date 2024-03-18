import 'dart:io';

import '../interfaces/radio_writer.dart';

class TcpRadioWriter implements RadioWriter {
  TcpRadioWriter({required Socket socket}) : _socket = socket;
  final Socket _socket;
  @override
  Future<void> write(List<int> value) async {
    final packetLen = value.length;
    final header = [0x94, 0xc3, packetLen >> 8, packetLen & 0xff];
    _socket.add(header);
    _socket.add(value);
  }
}
