import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/providers/ble/ble_permissions_requester.dart';
import 'package:meshx/providers/ble/radio_scanner.dart';
import 'package:meshx/providers/wrap/flutter_blue_plus_mockable.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../common.dart';
import '../../mock_stream.dart';
import 'radio_scanner_test.mocks.dart';

@GenerateMocks([
  FlutterBluePlusMockable,
  BlePermissionsRequester,
  BluetoothDevice,
  ScanResult,
  AdvertisementData,
])
void main() {
  late ProviderContainer container;
  late MockFlutterBluePlusMockable flutterBluePlus;
  late MockBlePermissionsRequester blePermissionsRequester;

  setUp(() {
    flutterBluePlus = MockFlutterBluePlusMockable();
    blePermissionsRequester = MockBlePermissionsRequester();
    container = createContainer(
      overrides: [
        flutterBluePlusProvider.overrideWith((ref) => flutterBluePlus),
        blePermissionsRequesterProvider
            .overrideWith((ref) => blePermissionsRequester),
      ],
    );
  });

  test('initial state', () {
    expect(
      container.read(radioScannerProvider).scanning,
      false,
    );

    expect(
      container.read(radioScannerProvider).meshRadios,
      isEmpty,
    );
  });

  test('scanning state must be true before permissions request', () {
    final infiniteWait = Completer<bool>().future;

    when(blePermissionsRequester.request()).thenAnswer((_) => infiniteWait);

    container.read(radioScannerProvider.notifier).scan();

    expect(
      container.read(radioScannerProvider).scanning,
      equals(true),
    );
  });

  test('must request permission', () {
    final infiniteWait = Completer<bool>().future;

    when(blePermissionsRequester.request()).thenAnswer((_) => infiniteWait);

    container.read(radioScannerProvider.notifier).scan();

    verify(blePermissionsRequester.request()).called(1);
  });

  test('permission request fails', () async {
    when(blePermissionsRequester.request())
        .thenAnswer((_) => Future.value(false));

    unawaited(container.read(radioScannerProvider.notifier).scan());

    await untilCalled(blePermissionsRequester.request())
        .timeout(const Duration(seconds: 5));
    expect(container.read(radioScannerProvider).scanning, equals(false));
  });

  test('scanning must be false after scan', () async {
    final systemDevice = MockBluetoothDevice();

    when(blePermissionsRequester.request())
        .thenAnswer((_) => Future.value(true));
    when(systemDevice.remoteId)
        .thenReturn(const DeviceIdentifier('systemDevice'));
    when(systemDevice.advName).thenReturn('systemDevice');
    when(flutterBluePlus.systemDevices)
        .thenAnswer((_) => Future.value([systemDevice]));
    when(flutterBluePlus.scanResults)
        .thenAnswer((_) => Future.value(<ScanResult>[]).asStream());
    when(flutterBluePlus.isScanning)
        .thenAnswer((_) => Future<bool>.value(false).asStream());

    await container.read(radioScannerProvider.notifier).scan();

    expect(container.read(radioScannerProvider).scanning, isFalse);
  });

  test('must return system (previously paired) bluetooth device', () async {
    final systemDevice = MockBluetoothDevice();

    when(blePermissionsRequester.request())
        .thenAnswer((_) => Future.value(true));
    when(systemDevice.remoteId)
        .thenReturn(const DeviceIdentifier('systemDevice'));
    when(systemDevice.advName).thenReturn('systemDevice');
    when(flutterBluePlus.systemDevices)
        .thenAnswer((_) => Future.value([systemDevice]));
    when(flutterBluePlus.scanResults)
        .thenAnswer((_) => Future.value(<ScanResult>[]).asStream());
    when(flutterBluePlus.isScanning)
        .thenAnswer((_) => Future<bool>.value(false).asStream());

    await container.read(radioScannerProvider.notifier).scan();

    expect(
      container.read(radioScannerProvider).meshRadios[0].remoteId,
      equals('systemDevice'),
    );
  });

  test('must return scanned (not previously paired) bluetooth device',
      () async {
    final scannedDevice = MockBluetoothDevice();
    final scanResult = MockScanResult();
    final advertisementData = MockAdvertisementData();

    when(blePermissionsRequester.request())
        .thenAnswer((_) => Future.value(true));
    when(scannedDevice.remoteId)
        .thenReturn(const DeviceIdentifier('scannedDevice'));
    when(scannedDevice.advName).thenReturn('scannedDevice');
    when(scanResult.device).thenReturn(scannedDevice);
    when(advertisementData.advName).thenReturn('scannedDevice');
    when(scanResult.advertisementData).thenReturn(advertisementData);
    when(flutterBluePlus.systemDevices).thenAnswer((_) => Future.value([]));
    when(flutterBluePlus.scanResults)
        .thenAnswer((_) => Future.value(<ScanResult>[scanResult]).asStream());
    when(flutterBluePlus.isScanning)
        .thenAnswer((_) => Future<bool>.value(false).asStream());

    await container.read(radioScannerProvider.notifier).scan();

    expect(
      container.read(radioScannerProvider).meshRadios[0].remoteId,
      equals('scannedDevice'),
    );
  });

  test('re-scanned devices must be deduplicated', () async {
    final scannedDevice = MockBluetoothDevice();
    final scanResult = MockScanResult();
    final advertisementData = MockAdvertisementData();
    final scanResultStream = MockStream<List<ScanResult>>();
    final isScanningStream = MockStream<bool>();

    when(blePermissionsRequester.request())
        .thenAnswer((_) => Future.value(true));
    when(scannedDevice.remoteId)
        .thenReturn(const DeviceIdentifier('scannedDevice'));
    when(scannedDevice.advName).thenReturn('scannedDevice');
    when(scanResult.device).thenReturn(scannedDevice);
    when(advertisementData.advName).thenReturn('scannedDevice');
    when(scanResult.advertisementData).thenReturn(advertisementData);
    when(flutterBluePlus.systemDevices).thenAnswer((_) => Future.value([]));
    when(flutterBluePlus.scanResults).thenAnswer((_) => scanResultStream);
    when(flutterBluePlus.isScanning).thenAnswer((_) => isScanningStream);

    final scanFuture = container.read(radioScannerProvider.notifier).scan();
    await container.pump(); // prevent deadlock
    await scanResultStream.emit([scanResult]);
    await scanResultStream.emit([scanResult]);
    await isScanningStream.emit(false);
    await scanFuture;

    expect(
      container.read(radioScannerProvider).meshRadios.length,
      equals(1),
    );
  });
}
