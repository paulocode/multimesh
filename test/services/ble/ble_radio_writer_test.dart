import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multimesh/exceptions/mesh_radio_exception.dart';
import 'package:multimesh/models/ble_characteristics.dart';
import 'package:multimesh/models/radio_connector_state.dart';
import 'package:multimesh/services/ble/ble_radio_writer.dart';

import 'ble_radio_writer_test.mocks.dart';

@GenerateMocks([FlutterReactiveBle, BleConnected, BleCharacteristics])
void main() {
  late BleConnected connectorState;
  late MockFlutterReactiveBle mockBle;
  late QualifiedCharacteristic toCharacteristic;

  setUp(() {
    final bleCharacteristics = MockBleCharacteristics();
    mockBle = MockFlutterReactiveBle();
    toCharacteristic = QualifiedCharacteristic(
      serviceId: Uuid.parse('6ba1b218-15a8-461f-9fa8-5dcae273eafd'),
      characteristicId: Uuid.parse('f75c76d2-129e-4dad-a1dd-7866124401e7'),
      deviceId: 'test-device',
    );
    connectorState = MockBleConnected();
    when(connectorState.bleCharacteristics).thenReturn(bleCharacteristics);
    when(bleCharacteristics.toRadio).thenReturn(toCharacteristic);
  });

  test('write', () async {
    when(mockBle.writeCharacteristicWithResponse(any, value: anyNamed('value')))
        .thenAnswer((_) async {});
    final writer = BleRadioWriter(connectorState, mockBle);

    await writer.write([2, 7, 1, 8, 2]);

    verify(mockBle.writeCharacteristicWithResponse(toCharacteristic, value: [2, 7, 1, 8, 2]));
  });

  test('BLE exception', () {
    when(mockBle.writeCharacteristicWithResponse(any, value: anyNamed('value')))
        .thenThrow(Exception('error 31415'));
    final writer = BleRadioWriter(connectorState, mockBle);

    expect(
      () => writer.write([2]),
      throwsA(
        isA<MeshRadioException>().having(
          (error) => error.msg,
          'message',
          contains('error 31415'),
        ),
      ),
    );
  });

  test('Unknown exception', () {
    when(mockBle.writeCharacteristicWithResponse(any, value: anyNamed('value')))
        .thenThrow(Exception());
    final writer = BleRadioWriter(connectorState, mockBle);

    expect(
      () => writer.write([2]),
      throwsA(isA<MeshRadioException>()),
    );
  });
}
