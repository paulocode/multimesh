// coverage:ignore-file
import 'package:platform/platform.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_platform.g.dart';

@Riverpod(keepAlive: true)
LocalPlatform localPlatform(Ref ref) {
  return const LocalPlatform();
}
