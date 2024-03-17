import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meshx/exceptions/mesh_radio_exception.dart';
import 'package:meshx/models/ble_characteristics.dart';
import 'package:meshx/models/mesh_radio.dart';
import 'package:meshx/models/radio_connector_state.dart';
import 'package:meshx/providers/ble/ble_characteristics_finder.dart';
import 'package:meshx/providers/ble/ble_radio_connector.dart';
import 'package:meshx/providers/wrap/local_platform.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:platform/platform.dart';
import 'package:test/test.dart';

import '../../common.dart';
import 'ble_radio_connector_test.mocks.dart';

@GenerateMocks(
  [
    BluetoothDevice,
    LocalPlatform,
    BleCharacteristicsFinder,
    BleCharacteristics,
  ],
)
void main() {
  late ProviderContainer container;
  late MockBluetoothDevice device;
  late BleMeshRadio radio;
  late MockLocalPlatform localPlatform;
  late MockBleCharacteristicsFinder bleCharacteristicsFinder;
  late MockBleCharacteristics bleCharacteristics;

  setUp(() {
    localPlatform = MockLocalPlatform();
    device = MockBluetoothDevice();
    radio = BleMeshRadio(device: device);
    bleCharacteristicsFinder = MockBleCharacteristicsFinder();
    bleCharacteristics = MockBleCharacteristics();

    when(localPlatform.isAndroid).thenReturn(false);
    when(bleCharacteristicsFinder.findCharacteristics(any))
        .thenAnswer((_) => Future.value(bleCharacteristics));
    when(radio.device.remoteId).thenReturn(const DeviceIdentifier('radio'));

    container = createContainer(
      overrides: [
        localPlatformProvider.overrideWith((ref) => localPlatform),
        bleCharacteristicsFinderProvider
            .overrideWith((ref) => bleCharacteristicsFinder),
      ],
    );
  });
  test('default status is disconnected', () {
    expect(
      container.read(bleRadioConnectorProvider),
      isA<Disconnected>(),
    );
  });

  test('calling connect must change state to connecting', () async {
    final infiniteWait = Completer<void>().future;
    when(radio.device.connect()).thenAnswer((_) => infiniteWait);

    unawaited(
      container.read(bleRadioConnectorProvider.notifier).connect(radio),
    );

    await untilCalled(radio.device.connect())
        .timeout(const Duration(seconds: 5));
    expect(
      container.read(bleRadioConnectorProvider),
      isA<Connecting>(),
    );
  });

  test('calling connect must set DeviceIdentifier', () async {
    final infiniteWait = Completer<void>().future;
    when(radio.device.connect()).thenAnswer((_) => infiniteWait);

    unawaited(
      container.read(bleRadioConnectorProvider.notifier).connect(radio),
    );

    await untilCalled(radio.device.connect())
        .timeout(const Duration(seconds: 5));

    final radioConnectorState =
        container.read(bleRadioConnectorProvider) as Connecting;
    expect(
      radioConnectorState.radioId,
      equals('radio'),
    );
  });

  test('android must call createBond', () async {
    when(localPlatform.isAndroid).thenReturn(true);
    when(radio.device.discoverServices()).thenAnswer((_) => Future.value([]));

    await container.read(bleRadioConnectorProvider.notifier).connect(radio);

    verify(device.createBond()).called(1);
  });

  test('non-android must not call createBond', () async {
    when(localPlatform.isAndroid).thenReturn(false);
    when(radio.device.discoverServices()).thenAnswer((_) => Future.value([]));

    await container.read(bleRadioConnectorProvider.notifier).connect(radio);

    verifyNever(device.createBond());
  });

  test(
      'MeshRadioException from BleCharacteristicsFinder must return ConnectionError with message',
      () async {
    when(radio.device.connectionState).thenAnswer(
      (_) => StreamController<BluetoothConnectionState>().stream,
    );
    when(bleCharacteristicsFinder.findCharacteristics(device)).thenAnswer((_) {
      throw const MeshRadioException(msg: 'myerror');
    });

    await container.read(bleRadioConnectorProvider.notifier).connect(radio);

    final radioConnectorState = container.read(bleRadioConnectorProvider);
    expect(
      radioConnectorState,
      isA<ConnectionError>(),
    );
    expect(
      (radioConnectorState as ConnectionError).msg,
      equals('myerror'),
    );
  });

  test('exception from BleCharacteristicsFinder must return Unknown Error',
      () async {
    when(radio.device.connectionState).thenAnswer(
      (_) => StreamController<BluetoothConnectionState>().stream,
    );
    when(bleCharacteristicsFinder.findCharacteristics(device)).thenAnswer((_) {
      throw Exception();
    });

    await container.read(bleRadioConnectorProvider.notifier).connect(radio);

    final radioConnectorState = container.read(bleRadioConnectorProvider);
    expect(
      radioConnectorState,
      isA<ConnectionError>(),
    );
    expect(
      (radioConnectorState as ConnectionError).msg,
      equals('Unknown error'),
    );
  });

  test('successful connection', () async {
    when(radio.device.connectionState).thenAnswer(
      (_) => StreamController<BluetoothConnectionState>().stream,
    );
    when(bleCharacteristicsFinder.findCharacteristics(device))
        .thenAnswer((_) => Future.value(bleCharacteristics));

    await container.read(bleRadioConnectorProvider.notifier).connect(radio);

    final radioConnectorState = container.read(bleRadioConnectorProvider);
    expect(
      radioConnectorState,
      isA<Connected>(),
    );
    expect(
      (radioConnectorState as Connected).bleCharacteristics,
      equals(bleCharacteristics),
    );
  });
}
