// coverage:ignore-file
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/ble/ble_permissions_requester.dart';
import '../wrap/permissions.dart';

part 'ble_permissions_requester.g.dart';

@Riverpod(keepAlive: true)
BlePermissionsRequester blePermissionsRequester(
  Ref ref,
) {
  return BlePermissionsRequester(
    permissions: ref.watch(permissionsProvider),
  );
}
