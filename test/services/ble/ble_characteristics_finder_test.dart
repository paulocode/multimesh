import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multimesh/constants/ble_constants.dart';
import 'package:multimesh/exceptions/mesh_radio_exception.dart';
import 'package:multimesh/services/ble/ble_characteristics_finder.dart';

import 'ble_characteristics_finder_test.mocks.dart';

@GenerateMocks(
  [
    FlutterReactiveBle,
  ],
)
void main() {
  late BleCharacteristicsFinder bleCharsFinder;
  late MockFlutterReactiveBle mockBle;

  setUp(() {
    mockBle = MockFlutterReactiveBle();
    bleCharsFinder = BleCharacteristicsFinder(mockBle);
  });

  test('must return right characteristics', () async {
    const deviceId = 'test-device-id';
    final serviceUuid = Uuid.parse(MESHTASTIC_BLE_SERVICE);
    final toRadioUuid = Uuid.parse(MESHTASTIC_TORADIO_CHARACTERISTIC);
    final fromRadioUuid = Uuid.parse(MESHTASTIC_FROMRADIO_CHARACTERISTIC);
    final fromNumUuid = Uuid.parse(MESHTASTIC_FROMNUM_CHARACTERISTIC);

    final service = DiscoveredService(
      serviceId: serviceUuid,
      characteristicIds: [toRadioUuid, fromRadioUuid, fromNumUuid],
      characteristics: [
        CharacteristicInstance(
          characteristicId: toRadioUuid,
          serviceId: serviceUuid,
          isReadable: false,
          isWritableWithResponse: true,
          isWritableWithoutResponse: false,
          isNotifiable: false,
          isIndicatable: false,
        ),
        CharacteristicInstance(
          characteristicId: fromRadioUuid,
          serviceId: serviceUuid,
          isReadable: true,
          isWritableWithResponse: false,
          isWritableWithoutResponse: false,
          isNotifiable: false,
          isIndicatable: false,
        ),
        CharacteristicInstance(
          characteristicId: fromNumUuid,
          serviceId: serviceUuid,
          isReadable: false,
          isWritableWithResponse: false,
          isWritableWithoutResponse: false,
          isNotifiable: true,
          isIndicatable: false,
        ),
      ],
      includedServices: [],
    );

    when(mockBle.discoverServices(deviceId)).thenAnswer(
      (_) => Future.value([service]),
    );

    final bleChars = await bleCharsFinder.findCharacteristics(deviceId);

    expect(bleChars.toRadio.characteristicId, toRadioUuid);
    expect(bleChars.fromRadio.characteristicId, fromRadioUuid);
    expect(bleChars.fromNum.characteristicId, fromNumUuid);
  });

  test('must throw MeshRadioException if meshtastic service does not exist',
      () async {
    const deviceId = 'test-device-id';

    when(mockBle.discoverServices(deviceId)).thenAnswer(
      (_) => Future.value([]),
    );

    try {
      await bleCharsFinder.findCharacteristics(deviceId);
    } catch (e) {
      expect(e, isA<MeshRadioException>());
      expect((e as MeshRadioException).msg, 'Not a Meshtastic device');
      return;
    }

    throw Exception();
  });

  test('must throw exception if meshtastic characteristic does not exist',
      () async {
    const deviceId = 'test-device-id';

    when(mockBle.discoverServices(deviceId)).thenAnswer(
      (_) => Future.value([]),
    );

    expect(
      () => bleCharsFinder.findCharacteristics(deviceId),
      throwsA(anything),
    );
  });
}
