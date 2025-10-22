// coverage:ignore-file
import 'dart:async';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

/// Wrapper for FlutterReactiveBle in order to easily mock it
/// Wraps calls for testing purposes
class FlutterBluePlusMockable {
  FlutterBluePlusMockable() : _ble = FlutterReactiveBle();

  final FlutterReactiveBle _ble;
  StreamSubscription<DiscoveredDevice>? _scanSubscription;
  final _scanResultsController = StreamController<List<DiscoveredDevice>>.broadcast();
  final _isScanningController = StreamController<bool>.broadcast();
  final _discoveredDevices = <String, DiscoveredDevice>{};

  Stream<BleStatus> get adapterState => _ble.statusStream;

  Stream<List<DiscoveredDevice>> get scanResults => _scanResultsController.stream;

  bool get isScanningNow => _scanSubscription != null;

  Stream<bool> get isScanning => _isScanningController.stream;

  Future<void> startScan({
    List<Uuid> withServices = const [],
    Duration? timeout,
    Duration? removeIfGone,
    bool oneByOne = false,
    bool androidUsesFineLocation = false,
  }) async {
    if (_scanSubscription != null) {
      return;
    }

    _discoveredDevices.clear();
    _isScanningController.add(true);

    _scanSubscription = _ble.scanForDevices(
      withServices: withServices,
      scanMode: ScanMode.lowLatency,
    ).listen((device) {
      _discoveredDevices[device.id] = device;
      _scanResultsController.add(_discoveredDevices.values.toList());
    });

    if (timeout != null) {
      Future.delayed(timeout, stopScan);
    }
  }

  Future<void> stopScan() async {
    await _scanSubscription?.cancel();
    _scanSubscription = null;
    _isScanningController.add(false);
  }

  Future<bool> get isSupported async {
    // flutter_reactive_ble doesn't have a direct isSupported check
    // We can check if status is not unsupported
    final status = await _ble.statusStream.first;
    return status != BleStatus.unsupported;
  }

  Stream<ConnectionStateUpdate> connectToDevice({
    required String id,
    Duration? timeout,
  }) {
    return _ble.connectToDevice(
      id: id,
      connectionTimeout: timeout,
    );
  }

  Future<void> disconnectDevice(String deviceId) async {
    // flutter_reactive_ble doesn't have explicit disconnect
    // Connection is managed through the stream subscription
  }

  Future<List<DiscoveredService>> discoverServices(String deviceId) {
    return _ble.discoverServices(deviceId);
  }

  Stream<List<int>> subscribeToCharacteristic(
    QualifiedCharacteristic characteristic,
  ) {
    return _ble.subscribeToCharacteristic(characteristic);
  }

  Future<void> writeCharacteristicWithResponse(
    QualifiedCharacteristic characteristic,
    List<int> value,
  ) {
    return _ble.writeCharacteristicWithResponse(characteristic, value: value);
  }

  Future<void> writeCharacteristicWithoutResponse(
    QualifiedCharacteristic characteristic,
    List<int> value,
  ) {
    return _ble.writeCharacteristicWithoutResponse(characteristic, value: value);
  }

  Future<List<int>> readCharacteristic(
    QualifiedCharacteristic characteristic,
  ) {
    return _ble.readCharacteristic(characteristic);
  }

  // Note: flutter_reactive_ble does not support these features
  // Returning dummy implementations for compatibility

  Future<String> get adapterName async => 'Unknown';

  Future<void> turnOn({int timeout = 60}) async {
    // Not supported in flutter_reactive_ble
    throw UnsupportedError('turnOn is not supported in flutter_reactive_ble');
  }

  List<String> get connectedDevices => [];

  Future<List<DiscoveredDevice>> get systemDevices async => [];

  Future<List<String>> get bondedDevices async => [];

  void cancelWhenScanComplete(
    StreamSubscription<List<DiscoveredDevice>> subscription,
  ) {
    // Not needed in flutter_reactive_ble
  }

  void dispose() {
    _scanSubscription?.cancel();
    _scanResultsController.close();
    _isScanningController.close();
  }
}
