import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/breadcrumb_logger.dart';
import 'wrap/local_platform.dart';
part 'breadcrumb_logger.g.dart';

@Riverpod(keepAlive: true)
BreadcrumbLogger breadcrumbLogger(Ref ref) {
  final localPlatform = ref.read(localPlatformProvider);
  if (!localPlatform.isWindows && !localPlatform.isLinux) {
    return FirebaseLogger();
  } else {
    return NullLogger();
  }
}
