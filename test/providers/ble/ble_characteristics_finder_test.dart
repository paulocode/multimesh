import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/constants/ble_constants.dart';
import 'package:meshx/exceptions/mesh_radio_exception.dart';
import 'package:meshx/services/ble/ble_characteristics_finder.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'ble_characteristics_finder_test.mocks.dart';

@GenerateMocks(
  [
    BluetoothDevice,
    BluetoothService,
    BluetoothCharacteristic,
  ],
)
void main() {
  late BleCharacteristicsFinder bleCharsFinder;

  setUp(() => bleCharsFinder = BleCharacteristicsFinder());

  test('must return right characteristics', () async {
    final device = MockBluetoothDevice();
    final service = MockBluetoothService();
    final toRadio = MockBluetoothCharacteristic();
    final fromRadio = MockBluetoothCharacteristic();
    final fromNum = MockBluetoothCharacteristic();

    when(device.discoverServices()).thenAnswer(
      (_) => Future.value([
        service,
      ]),
    );
    when(service.uuid).thenReturn(Guid(MESHTASTIC_BLE_SERVICE));
    when(toRadio.uuid).thenReturn(Guid(MESHTASTIC_TORADIO_CHARACTERISTIC));
    when(fromRadio.uuid).thenReturn(Guid(MESHTASTIC_FROMRADIO_CHARACTERISTIC));
    when(fromNum.uuid).thenReturn(Guid(MESHTASTIC_FROMNUM_CHARACTERISTIC));
    when(service.characteristics).thenReturn([
      toRadio,
      fromRadio,
      fromNum,
    ]);

    final bleChars = await bleCharsFinder.findCharacteristics(device);

    expect(bleChars.toRadio, toRadio);
    expect(bleChars.fromRadio, fromRadio);
    expect(bleChars.fromNum, fromNum);
  });

  test('must throw MeshRadioException if meshtastic service does not exist',
      () async {
    final device = MockBluetoothDevice();

    when(device.discoverServices()).thenAnswer(
      (_) => Future.value([]),
    );

    try {
      await bleCharsFinder.findCharacteristics(device);
    } catch (e) {
      expect(e, isA<MeshRadioException>());
      expect((e as MeshRadioException).msg, 'Not a Meshtastic device');
      return;
    }

    throw Exception();
  });

  test('must throw exception if meshtastic characteristic does not exist',
      () async {
    final device = MockBluetoothDevice();

    when(device.discoverServices()).thenAnswer(
      (_) => Future.value([]),
    );

    expect(
      () => bleCharsFinder.findCharacteristics(device),
      throwsA(anything),
    );
  });
}
