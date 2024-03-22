import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/constants/meshtastic_constants.dart';
import 'package:meshx/services/tcp/tcp_radio_writer.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tcp_radio_writer_test.mocks.dart';

@GenerateMocks([IOSink])
void main() {
  late MockIOSink ioSink; // ignore: close_sinks
  late TcpRadioWriter tcpRadioWriter;

  setUp(() {
    tcpRadioWriter = TcpRadioWriter(socket: ioSink = MockIOSink());
  });

  test('write', () async {
    await tcpRadioWriter.write([1, 7, 2, 9]);
    verify(
      ioSink.add([
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
