import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/models/radio_connector_state.dart';
import 'package:meshx/services/tcp/tcp_radio_reader.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mock_stream.dart';
import 'tcp_radio_reader_test.mocks.dart';

@GenerateMocks([Socket])
void main() {
  late TcpRadioReader tcpRadioReader; // ignore: unused_local_variable
  late MockSocket socket; // ignore: close_sinks
  late MockStream<Uint8List> stream; // ignore: close_sinks

  setUp(() {
    socket = MockSocket();
    stream = MockStream();
    when(socket.listen(any)).thenAnswer((realInvocation) {
      final listener =
          realInvocation.positionalArguments[0] as void Function(Uint8List);
      return stream.listen(listener);
    });
    tcpRadioReader = TcpRadioReader(
      radioConnectorState: TcpConnected(radioId: '', socket: socket),
      onDispose: (_) => {},
    );
  });

  test('init', () {});
}
