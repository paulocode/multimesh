import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final permissionsProvider = Provider<Permissions>((ref) {
  return Permissions();
});

class Permissions {
  Future<void> locationWhenInUseRequest() async {
    await Permission.locationWhenInUse.request();
  }
}
