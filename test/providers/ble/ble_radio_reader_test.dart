import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:meshx/models/ble_characteristics.dart';
import 'package:meshx/models/radio_connector_state.dart';
import 'package:meshx/protobufs/generated/meshtastic/mesh.pb.dart';
import 'package:meshx/providers/ble/radio_reader.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mock_stream.dart';
import 'ble_radio_reader_test.mocks.dart';

@GenerateMocks([
  BluetoothCharacteristic,
  BluetoothDevice,
])
void main() {
  late BleRadioReader radioReaderService;
  late MockBluetoothCharacteristic fromRadio;
  late MockBluetoothCharacteristic fromNum;
  late MockStream<List<int>> fromNumStream;
  final diposers = <void Function()>[];

  setUp(() {
    fromNumStream = MockStream<List<int>>();
    fromRadio = MockBluetoothCharacteristic();
    fromNum = MockBluetoothCharacteristic();
    when(fromNum.onValueReceived).thenAnswer((_) => fromNumStream);
    when(fromNum.setNotifyValue(any)).thenAnswer((_) => Future.value(true));

    final connectionState = Connected(
      bleCharacteristics: BleCharacteristics(
        toRadio: MockBluetoothCharacteristic(),
        fromRadio: fromRadio,
        fromNum: fromNum,
      ),
      device: MockBluetoothDevice(),
      radioId: 'radioId',
      isNewRadio: true,
    );

    radioReaderService = BleRadioReader(
      radioConnectorState: connectionState,
      onDispose: diposers.add,
    );
  });

  tearDown(diposers.clear);

  test('init, dispose', () {
    for (final diposer in diposers) {
      diposer();
    }

    expect(fromNumStream.hasListener, isFalse);
  });

  test('forceRead to trigger read until empty packet', () async {
    final packetReceived = Completer<FromRadio>();
    final packetsToReceive = [
      FromRadio(id: 1, nodeInfo: NodeInfo(channel: 1)).writeToBuffer(),
      <int>[],
    ];

    radioReaderService.onPacketReceived().listen((event) async {
      packetReceived.complete(event);
    });

    when(fromRadio.read())
        .thenAnswer((_) => Future.value(packetsToReceive.removeAt(0)));

    radioReaderService.forceRead();

    final receivedPacket =
        await packetReceived.future.timeout(const Duration(seconds: 1));

    expect(receivedPacket.nodeInfo.channel, equals(1));
  });

  test('fromNum to trigger read until empty packet', () async {
    final packetReceived = Completer<FromRadio>();
    final packetsToReceive = [
      FromRadio(id: 1, nodeInfo: NodeInfo(channel: 1)).writeToBuffer(),
      <int>[],
    ];

    radioReaderService.onPacketReceived().listen((event) async {
      packetReceived.complete(event);
    });

    when(fromRadio.read())
        .thenAnswer((_) => Future.value(packetsToReceive.removeAt(0)));

    await fromNumStream.emit([]);

    final receivedPacket =
        await packetReceived.future.timeout(const Duration(seconds: 1));

    expect(receivedPacket.nodeInfo.channel, equals(1));
  });
}
