import 'dart:async';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multimesh/models/ble_characteristics.dart';
import 'package:multimesh/models/mesh_radio.dart';
import 'package:multimesh/models/radio_connector_state.dart';
import 'package:multimesh/protobufs/generated/meshtastic/mesh.pb.dart';
import 'package:multimesh/services/ble/ble_radio_reader.dart';
import 'package:test/test.dart';

import '../../mock_stream.dart';
import 'ble_radio_reader_test.mocks.dart';

@GenerateMocks([
  FlutterReactiveBle,
])
void main() {
  late BleRadioReader radioReaderService;
  late MockFlutterReactiveBle mockBle;
  late QualifiedCharacteristic fromRadioChar;
  late QualifiedCharacteristic fromNumChar;
  late MockStream<List<int>> fromNumStream;
  final diposers = <void Function()>[];

  setUp(() {
    fromNumStream = MockStream<List<int>>();
    mockBle = MockFlutterReactiveBle();
    
    fromRadioChar = QualifiedCharacteristic(
      serviceId: Uuid.parse('6ba1b218-15a8-461f-9fa8-5dcae273eafd'),
      characteristicId: Uuid.parse('8ba2bcc2-ee02-4a55-a531-c525c5e454d5'),
      deviceId: 'test-device',
    );
    fromNumChar = QualifiedCharacteristic(
      serviceId: Uuid.parse('6ba1b218-15a8-461f-9fa8-5dcae273eafd'),
      characteristicId: Uuid.parse('ed9da18c-a800-4f66-a670-aa7547e34453'),
      deviceId: 'test-device',
    );

    when(mockBle.subscribeToCharacteristic(fromNumChar)).thenAnswer((_) => fromNumStream);

    final connectionState = BleConnected(
      bleCharacteristics: BleCharacteristics(
        toRadio: QualifiedCharacteristic(
          serviceId: Uuid.parse('6ba1b218-15a8-461f-9fa8-5dcae273eafd'),
          characteristicId: Uuid.parse('f75c76d2-129e-4dad-a1dd-7866124401e7'),
          deviceId: 'test-device',
        ),
        fromRadio: fromRadioChar,
        fromNum: fromNumChar,
      ),
      radio: BleMeshRadio(device: DiscoveredDevice(
        id: 'test-device',
        name: 'Test Device',
        serviceData: const {},
        manufacturerData: Uint8List(0),
        rssi: -50,
        serviceUuids: const [],
      )),
      isNewRadio: true,
    );

    radioReaderService = BleRadioReader(
      radioConnectorState: connectionState,
      onDispose: diposers.add,
      ble: mockBle,
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

    when(mockBle.readCharacteristic(fromRadioChar))
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

    when(mockBle.readCharacteristic(fromRadioChar))
        .thenAnswer((_) => Future.value(packetsToReceive.removeAt(0)));

    await fromNumStream.emit([]);

    final receivedPacket =
        await packetReceived.future.timeout(const Duration(seconds: 1));

    expect(receivedPacket.nodeInfo.channel, equals(1));
  });
}
