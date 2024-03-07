import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platform/platform.dart';

final localPlatformProvider = Provider<LocalPlatform>((ref) {
  return const LocalPlatform();
});
