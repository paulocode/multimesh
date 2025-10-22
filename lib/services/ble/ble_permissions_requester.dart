import 'package:logger/logger.dart';

import '../wrap/permissions.dart';

class BlePermissionsRequester {
  BlePermissionsRequester({
    required Permissions permissions,
  })  : _permissions = permissions;

  final Permissions _permissions;
  final _logger = Logger();

  Future<bool> request() async {
    // Request all necessary Bluetooth and location permissions
    final granted = await _permissions.requestBluetoothPermissions();
    
    if (!granted) {
      _logger.w('Bluetooth permissions not granted');
      return false;
    }
    
    // Note: flutter_reactive_ble doesn't support programmatic BLE turnOn
    // User must enable Bluetooth manually from device settings
    return true;
  }
}
