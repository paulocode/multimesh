import 'package:permission_handler/permission_handler.dart';
import 'package:platform/platform.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'local_platform.dart';

part 'permissions.g.dart';

@Riverpod(keepAlive: true)
Permissions permissions(PermissionsRef ref) {
  return Permissions(localPlatform: ref.watch(localPlatformProvider));
}

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
