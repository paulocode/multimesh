import 'dart:async';
import 'dart:io';

import 'package:logger/logger.dart';

import '../../constants/meshtastic_constants.dart';
import '../../models/radio_connector_state.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../interfaces/radio_reader.dart';

class TcpRadioReader implements RadioReader {
  TcpRadioReader({
    required RadioConnectorState radioConnectorState,
    required void Function(void Function() cb) onDispose,
  }) {
    if (radioConnectorState is! TcpConnected) {
      return;
    }
    _socket = radioConnectorState.socket;
    onDispose(_socket.close);
    onDispose(_packetStreamController.close);
    _readListener();
  }

  late final Socket _socket;
  final _packetStreamController = StreamController<FromRadio>.broadcast();
  final _logger = Logger();

  @override
  Stream<FromRadio> onPacketReceived() => _packetStreamController.stream;

  Future<void> _readListener() async {
    var pointer = 0;
    var msb = 0;
    var lsb = 0;
    var packetBytes = <int>[];
    var packetLen = 0;

    void resetSync() {
      msb = 0;
      lsb = 0;
      pointer = 0;
      packetLen = 0;
      packetBytes = <int>[];
    }

    final accumulator = <int>[];
    _socket.listen((event) {
      accumulator.addAll(event);
      while (accumulator.isNotEmpty) {
        final byte = accumulator.removeAt(0);
        switch (pointer) {
          case 0:
            if (byte != MESHTASTIC_STREAM_START1) {
              resetSync();
              continue;
            }
          case 1:
            if (byte != MESHTASTIC_STREAM_START2) {
              resetSync();
              continue;
            }
          case 2:
            msb = byte & 0xff;
          case 3:
            lsb = byte & 0xff;
            packetLen = (msb << 8) | lsb;
            if (packetLen > MESHTASTIC_MAX_PACKET_LEN) {
              _logger.w('improper packetLen $packetLen');
              resetSync();
              continue;
            } else if (packetLen == 0) {
              emitPacket(packetBytes);
              resetSync();
              continue;
            }
          case _:
            packetBytes.add(byte);
            if (packetBytes.length == packetLen) {
              emitPacket(packetBytes);
              resetSync();
              continue;
            }
        }
        pointer++;
      }
    });
  }

  void emitPacket(List<int> packetBytes) {
    final fromRadioPacket = FromRadio.fromBuffer(packetBytes);
    _logger.i(fromRadioPacket);
    _packetStreamController.add(fromRadioPacket);
  }
}
