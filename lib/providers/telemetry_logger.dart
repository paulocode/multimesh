import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/telemetry_logger.dart';
part 'telemetry_logger.g.dart';

@Riverpod(keepAlive: true)
BreadcrumbLogger breadcrumbLogger(BreadcrumbLoggerRef ref) {
  return BreadcrumbLogger();
}
