import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/meshtastic_constants.dart';
import '../../models/mesh_radio.dart';
import '../../models/radio_connector_state.dart';
import '../../services/interfaces/radio_connector.dart';
import '../wrap/socket.dart';

part 'tcp_radio_connector.g.dart';

@Riverpod(keepAlive: true)
class TcpRadioConnector extends _$TcpRadioConnector
    implements RadioConnector<TcpMeshRadio> {
  final _logger = Logger();
  StreamSubscription<Uint8List>? _socketListener;

  @override
  RadioConnectorState build() {
    return Disconnected();
  }

  @override
  Future<void> connect(TcpMeshRadio radio) async {
    if (state is Connected || state is Connecting) {
      _logger.w('Attempted to connect with existing connection');
      return;
    }
    _logger.i('TCP connecting to ${radio.remoteId}');
    await _socketListener?.cancel();
    state = Connecting(radioId: radio.address);
    Socket? socket;
    try {
      socket = await ref.read(socketProvider).connect(
            radio.address,
            MESHTASTIC_TCP_PORT,
            timeout: const Duration(seconds: 10),
          );
      _wakeUpRadio(socket);
      _logger.i('Connected to ${radio.address}:$MESHTASTIC_TCP_PORT');
      final socketStream = socket.asBroadcastStream();
      state = TcpConnected(
        socket: socket,
        recvStream: socketStream,
        radioId: radio.address,
      );
      _listenToSocketErrors(socketStream);
    } on SocketException catch (e) {
      _logger.e(e);
      state = ConnectionError(radioId: radio.address, msg: e.message);
    } catch (e) {
      _logger.e(e);
      state = ConnectionError(radioId: radio.address);
    } finally {
      ref.onDispose(() => socket?.close());
    }
  }

  void _wakeUpRadio(Socket socket) {
    socket.add(
      [
        MESHTASTIC_STREAM_START1,
        MESHTASTIC_STREAM_START1,
        MESHTASTIC_STREAM_START1,
        MESHTASTIC_STREAM_START1,
      ],
    );
  }

  @override
  Future<void> disconnect({String? errorMsg}) async {
    if (state is TcpConnected) {
      await _socketListener?.cancel();
      try {
        await (state as TcpConnected).socket.close();
      } catch (e) {
        _logger.e(e.toString());
      }
      state = Disconnected(errorMsg: errorMsg);
    }
  }

  void _listenToSocketErrors(Stream<Uint8List> socket) {
    _socketListener = socket.listen(
      (_) {},
      onError: (_) => disconnect(),
      onDone: disconnect,
    );
    ref.onDispose(() {
      _socketListener?.cancel();
    });
  }
}

class MockTcpRadioConnector extends _$TcpRadioConnector
    with Mock
    implements TcpRadioConnector {}
