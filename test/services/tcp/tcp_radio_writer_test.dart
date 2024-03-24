import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/constants/meshtastic_constants.dart';
import 'package:meshx/models/mesh_radio.dart';
import 'package:meshx/models/radio_connector_state.dart';
import 'package:meshx/services/tcp/tcp_radio_writer.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tcp_radio_writer_test.mocks.dart';

@GenerateMocks([Socket])
void main() {
  late MockSocket socket; // ignore: close_sinks
  late TcpRadioWriter tcpRadioWriter;

  setUp(() {
    socket = MockSocket();
    tcpRadioWriter = TcpRadioWriter(
      TcpConnected(
        socket: socket,
        recvStream: socket,
        radio: TcpMeshRadio(address: 'address'),
      ),
    );
  });

  test('write', () async {
    await tcpRadioWriter.write([1, 7, 2, 9]);
    verify(
      socket.add([
        MESHTASTIC_STREAM_START1,
        MESHTASTIC_STREAM_START2,
        0, // first byte of length
        4, // second byte of length
        1, // payload
        7,
        2,
        9,
      ]),
    );
  });
}
