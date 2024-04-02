import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multimesh/protobufs/generated/meshtastic/mesh.pb.dart';
import 'package:multimesh/protobufs/generated/meshtastic/portnums.pb.dart';
import 'package:multimesh/services/interfaces/radio_reader.dart';
import 'package:multimesh/services/interfaces/radio_writer.dart';
import 'package:multimesh/services/queued_radio_writer.dart';

import '../mock_stream.dart';
import 'queued_radio_writer_test.mocks.dart';

@GenerateMocks([
  BluetoothCharacteristic,
  BluetoothDevice,
  RadioReader,
  RadioWriter,
])
void main() {
  late MockRadioWriter radioWriter;
  late AckWaitingRadioWriter queuedRadioWriter;
  late MockRadioReader radioReader;
  late MockStream<FromRadio> packetStream;

  setUp(() {
    radioWriter = MockRadioWriter();
    radioReader = MockRadioReader();
    packetStream = MockStream();

    when(radioReader.onPacketReceived()).thenAnswer((_) => packetStream);

    queuedRadioWriter = AckWaitingRadioWriter(
      sendTimeout: const Duration(seconds: 1),
      hopLimitProvider: () => 7,
      radioWriter: radioWriter,
      radioReader: radioReader,
    );
  });

  test('send wantConfig', () {
    queuedRadioWriter.sendWantConfig(wantConfigId: 123);

    final captured =
        verify(radioWriter.write(captureAny)).captured.first as List<int>;
    final capturedPacket = ToRadio.fromBuffer(captured);
    expect(capturedPacket.wantConfigId, equals(123));
  });

  test('send packet', () async {
    unawaited(
      queuedRadioWriter.sendMeshPacket(
        to: 123,
        channel: 456,
        portNum: PortNum.ADMIN_APP,
        payload: Uint8List.fromList([1, 2, 3]),
        id: 31415,
      ),
    );

    await packetStream.emit(
      FromRadio(
        queueStatus: QueueStatus(
          meshPacketId: 31415,
        ),
      ),
    );

    final captured =
        verify(radioWriter.write(captureAny)).captured.first as List<int>;
    final capturedPacket = ToRadio.fromBuffer(captured).packet;
    expect(capturedPacket.to, equals(123));
    expect(capturedPacket.id, equals(31415));
    expect(capturedPacket.channel, equals(456));
    expect(capturedPacket.hopLimit, equals(7));
    expect(capturedPacket.wantAck, isFalse);
    expect(capturedPacket.priority, MeshPacket_Priority.RELIABLE);
    expect(capturedPacket.decoded.portnum, PortNum.ADMIN_APP);
    expect(capturedPacket.decoded.payload, equals([1, 2, 3]));
  });
}
