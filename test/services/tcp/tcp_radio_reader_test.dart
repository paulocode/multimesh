import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:multimesh/constants/meshtastic_constants.dart';
import 'package:multimesh/models/mesh_radio.dart';
import 'package:multimesh/models/radio_connector_state.dart';
import 'package:multimesh/protobufs/generated/meshtastic/mesh.pb.dart';
import 'package:multimesh/services/tcp/tcp_radio_reader.dart';
import 'package:mockito/annotations.dart';

import '../../mock_stream.dart';
import 'tcp_radio_reader_test.mocks.dart';

@GenerateMocks([Socket])
void main() {
  late TcpRadioReader tcpRadioReader; // ignore: unused_local_variable
  late MockSocket socket; // ignore: close_sinks
  late MockStream<List<int>> recvStream; // ignore: close_sinks

  setUp(() {
    socket = MockSocket();
    recvStream = MockStream();

    tcpRadioReader = TcpRadioReader(
      radioConnectorState: TcpConnected(
        radio: TcpMeshRadio(address: 'address'),
        recvStream: recvStream,
        socket: socket,
      ),
      onDispose: (_) => {},
    );
  });

  test('empty packet', () async {
    final completer = Completer<FromRadio>();
    tcpRadioReader.onPacketReceived().listen(completer.complete);

    await recvStream
        .emit([MESHTASTIC_STREAM_START1, MESHTASTIC_STREAM_START2, 0x00, 0x00]);

    expect((await completer.future).writeToBuffer().length, equals(0));
  });

  test('receive packet', () async {
    final packet =
        FromRadio(myInfo: MyNodeInfo(myNodeNum: 123, rebootCount: 234))
            .writeToBuffer();
    final msb = packet.length >> 8;
    final lsb = packet.length & 0xFF;
    final completer = Completer<FromRadio>();
    tcpRadioReader.onPacketReceived().listen(completer.complete);

    await recvStream.emit([
      MESHTASTIC_STREAM_START1,
      MESHTASTIC_STREAM_START2,
      msb,
      lsb,
      ...packet,
    ]);

    final recreatedPacket = await completer.future;
    expect(recreatedPacket.myInfo.myNodeNum, equals(123));
    expect(recreatedPacket.myInfo.rebootCount, equals(234));
  });

  test('1/2 packet', () async {
    final packet =
        FromRadio(myInfo: MyNodeInfo(myNodeNum: 123, rebootCount: 234))
            .writeToBuffer();
    final msb = packet.length >> 8;
    final lsb = packet.length & 0xFF;
    final completer = Completer<FromRadio>();
    tcpRadioReader.onPacketReceived().listen(completer.complete);

    await recvStream.emit([
      MESHTASTIC_STREAM_START1,
      MESHTASTIC_STREAM_START2,
      msb,
      lsb,
      ...packet.sublist(0, packet.length ~/ 2),
    ]);

    expect(
      () async {
        await completer.future.timeout(const Duration(seconds: 1));
      },
      throwsA(isA<TimeoutException>()),
    );
  });

  test('1/2 packet but completes', () async {
    final packet =
        FromRadio(myInfo: MyNodeInfo(myNodeNum: 123, rebootCount: 234))
            .writeToBuffer();
    final msb = packet.length >> 8;
    final lsb = packet.length & 0xFF;
    final completer = Completer<FromRadio>();
    tcpRadioReader.onPacketReceived().listen(completer.complete);

    await recvStream.emit([
      MESHTASTIC_STREAM_START1,
      MESHTASTIC_STREAM_START2,
      msb,
      lsb,
      ...packet.sublist(0, packet.length ~/ 2),
    ]);

    await recvStream.emit(packet.sublist(packet.length ~/ 2));

    final recreatedPacket = await completer.future;
    expect(recreatedPacket.myInfo.myNodeNum, equals(123));
  });

  test('2x packet in 1 emit', () async {
    final packet =
        FromRadio(myInfo: MyNodeInfo(myNodeNum: 123, rebootCount: 234))
            .writeToBuffer();
    final msb = packet.length >> 8;
    final lsb = packet.length & 0xFF;
    final completers = [
      Completer<FromRadio>(),
      Completer<FromRadio>(),
    ];
    var count = 0;
    tcpRadioReader.onPacketReceived().listen((event) {
      completers[count++].complete(event);
    });

    await recvStream.emit([
      MESHTASTIC_STREAM_START1,
      MESHTASTIC_STREAM_START2,
      msb,
      lsb,
      ...packet,
      MESHTASTIC_STREAM_START1,
      MESHTASTIC_STREAM_START2,
      msb,
      lsb,
      ...packet,
    ]);

    final recreatedPacket1 =
        await completers[0].future.timeout(const Duration(seconds: 1));
    final recreatedPacket2 =
        await completers[1].future.timeout(const Duration(seconds: 1));
    expect(recreatedPacket1.myInfo.myNodeNum, equals(123));
    expect(recreatedPacket2.myInfo.rebootCount, equals(234));
  });

  test('reset sync', () async {
    final packet =
        FromRadio(myInfo: MyNodeInfo(myNodeNum: 123, rebootCount: 234))
            .writeToBuffer();
    final msb = packet.length >> 8;
    final lsb = packet.length & 0xFF;
    final completer = Completer<FromRadio>();
    tcpRadioReader.onPacketReceived().listen(completer.complete);

    await recvStream.emit([
      0xff,
      0xff,
      MESHTASTIC_STREAM_START1,
      MESHTASTIC_STREAM_START2,
      msb,
      lsb,
      ...packet,
    ]);

    final recreatedPacket = await completer.future;
    expect(recreatedPacket.myInfo.myNodeNum, equals(123));
  });

  test('reset sync but STREAM_START2', () async {
    final packet =
        FromRadio(myInfo: MyNodeInfo(myNodeNum: 123, rebootCount: 234))
            .writeToBuffer();
    final msb = packet.length >> 8;
    final lsb = packet.length & 0xFF;
    final completer = Completer<FromRadio>();
    tcpRadioReader.onPacketReceived().listen(completer.complete);

    await recvStream.emit([
      MESHTASTIC_STREAM_START1,
      0xff,
      MESHTASTIC_STREAM_START1,
      MESHTASTIC_STREAM_START2,
      msb,
      lsb,
      ...packet,
    ]);

    final recreatedPacket = await completer.future;
    expect(recreatedPacket.myInfo.myNodeNum, equals(123));
  });

  test('invalid size', () async {
    final packet =
        FromRadio(myInfo: MyNodeInfo(myNodeNum: 123, rebootCount: 234))
            .writeToBuffer();
    final msb = packet.length >> 8;
    final lsb = packet.length & 0xFF;
    final completer = Completer<FromRadio>();
    tcpRadioReader.onPacketReceived().listen(completer.complete);

    await recvStream.emit([
      MESHTASTIC_STREAM_START1,
      MESHTASTIC_STREAM_START2,
      0x33,
      0x33,
      MESHTASTIC_STREAM_START1,
      MESHTASTIC_STREAM_START2,
      msb,
      lsb,
      ...packet,
    ]);

    final recreatedPacket = await completer.future;
    expect(recreatedPacket.myInfo.myNodeNum, equals(123));
  });
}
