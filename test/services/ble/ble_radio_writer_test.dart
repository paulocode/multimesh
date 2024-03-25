import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multimesh/exceptions/mesh_radio_exception.dart';
import 'package:multimesh/models/ble_characteristics.dart';
import 'package:multimesh/models/radio_connector_state.dart';
import 'package:multimesh/services/ble/ble_radio_writer.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'ble_radio_writer_test.mocks.dart';

@GenerateMocks([BluetoothCharacteristic, BleConnected, BleCharacteristics])
void main() {
  late BleConnected connectorState;
  late MockBluetoothCharacteristic to;
  setUp(() {
    final bleCharacteristics = MockBleCharacteristics();
    to = MockBluetoothCharacteristic();
    connectorState = MockBleConnected();
    when(connectorState.bleCharacteristics).thenReturn(bleCharacteristics);
    when(bleCharacteristics.toRadio).thenReturn(to);
  });

  test('write', () {
    when(to.write(any)).thenAnswer((_) async {});
    final writer = BleRadioWriter(connectorState);

    writer.write([2, 7, 1, 8, 2]);

    verify(to.write([2, 7, 1, 8, 2]));
  });

  test('BLE exception', () {
    when(to.write(any)).thenThrow(
      FlutterBluePlusException(ErrorPlatform.android, '', 123, 'error 31415'),
    );
    final writer = BleRadioWriter(connectorState);

    expect(
      () => writer.write([2]),
      throwsA(
        isA<MeshRadioException>().having(
          (error) => error.msg,
          'message',
          'error 31415',
        ),
      ),
    );
  });

  test('Unknown exception', () {
    when(to.write(any)).thenThrow(
      Exception(),
    );
    final writer = BleRadioWriter(connectorState);

    expect(
      () => writer.write([2]),
      throwsA(
        isA<MeshRadioException>().having(
          (error) => error.msg,
          'message',
          'Unknown error',
        ),
      ),
    );
  });
}
