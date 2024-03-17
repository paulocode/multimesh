import 'dart:io';

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/mesh_radio.dart';
import '../../models/radio_scan_state.dart';

part 'tcp_radio_scanner.g.dart';

@Riverpod(keepAlive: true)
class TcpRadioScanner extends _$TcpRadioScanner {
  final _logger = Logger();

  @override
  RadioScanState build() {
    return const RadioScanState();
  }

  Future<void> scan() async {
    state = state.copyWith(scanning: true);
    for (var i = 0; i < 10; i++) {
      final host = i == 0 ? 'meshtastic.local' : 'meshtastic-$i.local';
      Socket? socket;
      try {
        socket = await Socket.connect(
          host,
          4403,
          timeout: const Duration(seconds: 5),
        );
        _addIfNew(host);
      } catch (e) {
        _logger.e(e.toString());
        // there is likely no next device
        break;
      } finally {
        await socket?.close();
      }
    }
    state = state.copyWith(scanning: false);
  }

  void _addIfNew(String host) {
    if (state.meshRadios.where((element) => element.name == host).isEmpty) {
      state = state.copyWith(
        meshRadios: [TcpMeshRadio(address: host), ...state.meshRadios],
      );
    }
  }
}
