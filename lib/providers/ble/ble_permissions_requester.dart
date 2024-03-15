import 'package:logger/logger.dart';
import 'package:platform/platform.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../wrap/flutter_blue_plus_mockable.dart';
import '../wrap/local_platform.dart';
import '../wrap/permissions.dart';

part 'ble_permissions_requester.g.dart';

@Riverpod(keepAlive: true)
BlePermissionsRequester blePermissionsRequester(
  BlePermissionsRequesterRef ref,
) {
  return BlePermissionsRequester(
    localPlatform: ref.watch(localPlatformProvider),
    flutterBluePlus: ref.watch(flutterBluePlusProvider),
    permissions: ref.watch(permissionsProvider),
  );
}

class BlePermissionsRequester {
  BlePermissionsRequester({
    required LocalPlatform localPlatform,
    required FlutterBluePlusMockable flutterBluePlus,
    required Permissions permissions,
  })  : _localPlatform = localPlatform,
        _flutterBluePlus = flutterBluePlus,
        _permissions = permissions;

  final LocalPlatform _localPlatform;
  final FlutterBluePlusMockable _flutterBluePlus;
  final Permissions _permissions;
  final _logger = Logger();

  Future<bool> request() async {
    await _permissions.locationWhenInUseRequest();
    if (_localPlatform.isAndroid) {
      try {
        await _flutterBluePlus.turnOn();
      } catch (e) {
        _logger.e(e);
        return false;
      }
    }
    return true;
  }
}
