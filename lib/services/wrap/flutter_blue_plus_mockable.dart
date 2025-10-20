// coverage:ignore-file
import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

/// Wrapper for FlutterBluePlus in order to easily mock it
/// Wraps all static calls for testing purposes
class FlutterBluePlusMockable {
  Future<void> startScan({
    List<Guid> withServices = const [],
    Duration? timeout,
    Duration? removeIfGone,
    bool oneByOne = false,
    bool androidUsesFineLocation = false,
  }) {
    return FlutterBluePlus.startScan(
      withServices: withServices,
      timeout: timeout,
      removeIfGone: removeIfGone,
      oneByOne: oneByOne,
      androidUsesFineLocation: androidUsesFineLocation,
    );
  }

  Stream<BluetoothAdapterState> get adapterState {
    return FlutterBluePlus.adapterState;
  }

  Stream<List<ScanResult>> get scanResults {
    return FlutterBluePlus.scanResults;
  }

  bool get isScanningNow {
    return FlutterBluePlus.isScanningNow;
  }

  Stream<bool> get isScanning {
    return FlutterBluePlus.isScanning;
  }

  Future<void> stopScan() {
    return FlutterBluePlus.stopScan();
  }

  Future<void> setLogLevel(LogLevel level, {bool color = true}) {
    return FlutterBluePlus.setLogLevel(level, color: color);
  }

  LogLevel get logLevel {
    return FlutterBluePlus.logLevel;
  }

  Future<bool> get isSupported {
    return FlutterBluePlus.isSupported;
  }

  Future<String> get adapterName {
    return FlutterBluePlus.adapterName;
  }

  Future<void> turnOn({int timeout = 60}) {
    return FlutterBluePlus.turnOn(timeout: timeout);
  }

  List<BluetoothDevice> get connectedDevices {
    return FlutterBluePlus.connectedDevices;
  }

  Future<List<BluetoothDevice>> get systemDevices {
    // TODO: implement GUID list for ios
    return FlutterBluePlus.systemDevices(List.empty());
  }

  Future<PhySupport> getPhySupport() {
    return FlutterBluePlus.getPhySupport();
  }

  Future<List<BluetoothDevice>> get bondedDevices {
    return FlutterBluePlus.bondedDevices;
  }

  void cancelWhenScanComplete(
    StreamSubscription<List<ScanResult>> subscription,
  ) {
    FlutterBluePlus.cancelWhenScanComplete(subscription);
  }
}
