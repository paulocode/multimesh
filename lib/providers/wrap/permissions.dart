import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/wrap/permissions.dart';
import 'local_platform.dart';

part 'permissions.g.dart';

@Riverpod(keepAlive: true)
Permissions permissions(PermissionsRef ref) {
  return Permissions(localPlatform: ref.watch(localPlatformProvider));
}
