import 'package:platform/platform.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_platform.g.dart';

@Riverpod(keepAlive: true)
LocalPlatform localPlatform(LocalPlatformRef ref) {
  return const LocalPlatform();
}
