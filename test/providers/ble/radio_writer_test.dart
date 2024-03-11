import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/protobufs/generated/meshtastic/mesh.pb.dart';
import 'package:meshx/protobufs/generated/meshtastic/portnums.pb.dart';
import 'package:meshx/providers/ble/radio_writer.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'radio_writer_test.mocks.dart';

@GenerateMocks([
  BluetoothCharacteristic,
  BluetoothDevice,
])
void main() {
  late MockBluetoothCharacteristic toRadio;
  late RadioWriter radioWriter;

  setUp(() {
    toRadio = MockBluetoothCharacteristic();
    radioWriter = RadioWriter(toRadio: toRadio);
  });

  test('send wantConfig', () {
    radioWriter.sendWantConfig(wantConfigId: 123);

    final captured =
        verify(toRadio.write(captureAny)).captured.first as List<int>;
    final capturedPacket = ToRadio.fromBuffer(captured);
    expect(capturedPacket.wantConfigId, equals(123));
  });

  test('send packet', () async {
    final id = await radioWriter.sendMeshPacket(
      to: 123,
      channel: 456,
      portNum: PortNum.ADMIN_APP,
      payload: Uint8List.fromList([1, 2, 3]),
    );

    final captured =
        verify(toRadio.write(captureAny)).captured.first as List<int>;
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
}
