import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/breadcrumb_logger.dart';
part 'breadcrumb_logger.g.dart';

@Riverpod(keepAlive: true)
BreadcrumbLogger breadcrumbLogger(BreadcrumbLoggerRef ref) {
  return BreadcrumbLogger();
}
