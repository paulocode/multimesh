import 'package:permission_handler/permission_handler.dart';
import 'package:platform/platform.dart';

class Permissions {
  Permissions({required LocalPlatform localPlatform})
      : _localPlatform = localPlatform;

  final LocalPlatform _localPlatform;

  Future<bool> locationWhenInUseRequest() async {
    if (_localPlatform.isIOS || _localPlatform.isAndroid) {
      final status = await Permission.locationWhenInUse.request();
      return status.isGranted;
    }
    return true;
  }

  Future<bool> requestBluetoothPermissions() async {
    if (_localPlatform.isAndroid) {
      // For Android 12+ (API 31+), we need BLUETOOTH_SCAN and BLUETOOTH_CONNECT
      final bluetoothScanStatus = await Permission.bluetoothScan.request();
      final bluetoothConnectStatus = await Permission.bluetoothConnect.request();
      
      // Also need location for BLE scanning
      final locationStatus = await Permission.locationWhenInUse.request();
      
      return bluetoothScanStatus.isGranted && 
             bluetoothConnectStatus.isGranted && 
             locationStatus.isGranted;
    } else if (_localPlatform.isIOS) {
      // iOS only needs Bluetooth permission (handled by the system)
      final bluetoothStatus = await Permission.bluetooth.request();
      return bluetoothStatus.isGranted;
    }
    return true;
  }
}
