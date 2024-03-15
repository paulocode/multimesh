import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'permissions.g.dart';

@Riverpod(keepAlive: true)
Permissions permissions(PermissionsRef ref) {
  return Permissions();
}

class Permissions {
  Future<void> locationWhenInUseRequest() async {
    await Permission.locationWhenInUse.request();
  }
}
