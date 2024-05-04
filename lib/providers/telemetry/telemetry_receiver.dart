import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/telemetry/telemetry_receiver.dart';
import '../radio_config/radio_config_service.dart';
import '../radio_reader.dart';
import '../repository/telemetry_repository.dart';
part 'telemetry_receiver.g.dart';

@Riverpod(keepAlive: true)
TelemetryReceiver telemetryReceiver(TelemetryReceiverRef ref) {
  return TelemetryReceiver(
    myNodeNum: ref
        .watch(radioConfigServiceProvider.select((value) => value.myNodeNum)),
    telemetryRepository: ref.watch(telemetryRepositoryProvider),
    radioReader: ref.watch(radioReaderProvider),
    onDispose: ref.onDispose,
  );
}
