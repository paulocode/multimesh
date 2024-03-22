// coverage:ignore-file
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/ble/ble_permissions_requester.dart';
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
