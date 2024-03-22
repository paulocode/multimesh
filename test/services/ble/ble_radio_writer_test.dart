import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/exceptions/mesh_radio_exception.dart';
import 'package:meshx/services/ble/ble_radio_writer.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'ble_characteristics_finder_test.mocks.dart';

@GenerateMocks([BluetoothCharacteristic])
void main() {
  late MockBluetoothCharacteristic to;
  setUp(() {
    to = MockBluetoothCharacteristic();
  });

  test('write', () {
    when(to.write(any)).thenAnswer((_) async {});
    final writer = BleRadioWriter(to: to);

    writer.write([2, 7, 1, 8, 2]);

    verify(to.write([2, 7, 1, 8, 2]));
  });

  test('BLE exception', () {
    when(to.write(any)).thenThrow(
      FlutterBluePlusException(ErrorPlatform.android, '', 123, 'error 31415'),
    );
    final writer = BleRadioWriter(to: to);

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
    final writer = BleRadioWriter(to: to);

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
