import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multimesh/protobufs/generated/meshtastic/mesh.pb.dart';
import 'package:multimesh/protobufs/generated/meshtastic/portnums.pb.dart';
import 'package:multimesh/services/interfaces/radio_reader.dart';
import 'package:multimesh/services/interfaces/radio_writer.dart';
import 'package:multimesh/services/queued_radio_writer.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

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
  late QueuedRadioWriter queuedRadioWriter;
  late MockRadioReader radioReader;
  late MockStream<FromRadio> packetStream;

  setUp(() {
    radioWriter = MockRadioWriter();
    radioReader = MockRadioReader();
    packetStream = MockStream();

    when(radioReader.onPacketReceived()).thenAnswer((_) => packetStream);

    queuedRadioWriter =
        QueuedRadioWriter(sendTimeout: const Duration(seconds: 1))
          ..setRadioWriter(radioWriter)
          ..setRadioReader(radioReader);
  });

  test('send wantConfig', () {
    queuedRadioWriter.sendWantConfig(wantConfigId: 123);

    final captured =
        verify(radioWriter.write(captureAny)).captured.first as List<int>;
    final capturedPacket = ToRadio.fromBuffer(captured);
    expect(capturedPacket.wantConfigId, equals(123));
  });

  test('send packet', () async {
    final id = queuedRadioWriter.sendMeshPacket(
      to: 123,
      channel: 456,
      portNum: PortNum.ADMIN_APP,
      payload: Uint8List.fromList([1, 2, 3]),
    );

    final captured =
        verify(radioWriter.write(captureAny)).captured.first as List<int>;
    final capturedPacket = ToRadio.fromBuffer(captured).packet;
    expect(capturedPacket.to, equals(123));
    expect(capturedPacket.id, equals(id));
    expect(capturedPacket.channel, equals(456));
    expect(capturedPacket.hopLimit, equals(3));
    expect(capturedPacket.wantAck, isFalse);
    expect(capturedPacket.priority, MeshPacket_Priority.RELIABLE);
    expect(capturedPacket.decoded.portnum, PortNum.ADMIN_APP);
    expect(capturedPacket.decoded.payload, equals([1, 2, 3]));
  });

  test('send 2 packets without ack from first', () async {
    queuedRadioWriter.sendMeshPacket(
      to: 123,
      channel: 456,
      portNum: PortNum.ADMIN_APP,
      payload: Uint8List.fromList([1, 2, 3]),
    );
    queuedRadioWriter.sendMeshPacket(
      to: 789,
      channel: 321,
      portNum: PortNum.ADMIN_APP,
      payload: Uint8List.fromList([1, 2, 3]),
    );

    final captures = verify(radioWriter.write(captureAny)).captured;
    expect(captures.length, equals(1));
  });

  test('send 2 packets with ack from first', () async {
    final id = queuedRadioWriter.sendMeshPacket(
      to: 123,
      channel: 456,
      portNum: PortNum.ADMIN_APP,
      payload: Uint8List.fromList([1, 2, 3]),
    );
    queuedRadioWriter.sendMeshPacket(
      to: 789,
      channel: 321,
      portNum: PortNum.ADMIN_APP,
      payload: Uint8List.fromList([1, 2, 3]),
    );
    await packetStream.emit(
      FromRadio(
        queueStatus: QueueStatus(
          meshPacketId: id,
        ),
      ),
    );

    final captures = verify(radioWriter.write(captureAny)).captured;
    final firstPacket = ToRadio.fromBuffer(captures[0] as List<int>).packet;
    final secondPacket = ToRadio.fromBuffer(captures[1] as List<int>).packet;
    expect(captures.length, equals(2));
    expect(firstPacket.to, equals(123));
    expect(secondPacket.to, equals(789));
  });

  test('send 3 packets with ack from first', () async {
    final id = queuedRadioWriter.sendMeshPacket(
      to: 123,
      channel: 456,
      portNum: PortNum.ADMIN_APP,
      payload: Uint8List.fromList([1, 2, 3]),
    );
    queuedRadioWriter.sendMeshPacket(
      to: 789,
      channel: 456,
      portNum: PortNum.ADMIN_APP,
      payload: Uint8List.fromList([1, 2, 3]),
    );
    queuedRadioWriter.sendMeshPacket(
      to: 111,
      channel: 456,
      portNum: PortNum.ADMIN_APP,
      payload: Uint8List.fromList([1, 2, 3]),
    );
    await packetStream.emit(
      FromRadio(
        queueStatus: QueueStatus(
          meshPacketId: id,
        ),
      ),
    );

    final captures = verify(radioWriter.write(captureAny)).captured;
    expect(captures.length, equals(2));
  });

  test('send 2nd packet after timeout', () async {
    queuedRadioWriter.sendMeshPacket(
      to: 123,
      channel: 456,
      portNum: PortNum.ADMIN_APP,
      payload: Uint8List.fromList([1, 2, 3]),
    );
    queuedRadioWriter.sendMeshPacket(
      to: 789,
      channel: 321,
      portNum: PortNum.ADMIN_APP,
      payload: Uint8List.fromList([1, 2, 3]),
    );
    await Future<void>.delayed(const Duration(seconds: 5));

    final captures = verify(radioWriter.write(captureAny)).captured;
    expect(captures.length, equals(2));
  });
}
