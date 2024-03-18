import 'package:permission_handler/permission_handler.dart';
import 'package:platform/platform.dart';

class Permissions {
  Permissions({required LocalPlatform localPlatform})
      : _localPlatform = localPlatform;

  final LocalPlatform _localPlatform;

  Future<void> locationWhenInUseRequest() async {
    if (_localPlatform.isIOS || _localPlatform.isAndroid) {
      await Permission.locationWhenInUse.request();
    }
  }
}
