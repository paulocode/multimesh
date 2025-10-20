import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../repository/telemetry_repository.dart';
import 'sqflite.dart';

part 'telemetry_repository.g.dart';

@Riverpod(keepAlive: true)
TelemetryRepository telemetryRepository(
  Ref ref,
) {
  return TelemetryRepository(
    database: ref.watch(sqfliteProvider).requireValue,
  );
}
