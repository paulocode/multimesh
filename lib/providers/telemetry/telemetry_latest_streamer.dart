import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/telemetry_state.dart';
import '../../models/timed_telemetry.dart';
import '../../repository/telemetry_repository.dart';
import '../radio_config/radio_config_service.dart';
import '../repository/telemetry_repository.dart';
import 'telemetry_receiver.dart';

part 'telemetry_latest_streamer.g.dart';

@Riverpod(keepAlive: true)
class TelemetryLatestStreamer extends _$TelemetryLatestStreamer {
  late TelemetryRepository _telemetryRepository;
  late int _myNodeNum;
  late int _nodeNum;

  @override
  TelemetryState build({required int nodeNum}) {
    final sub = ref
        .watch(telemetryReceiverProvider)
        .addTelemetryListener(nodeNum: nodeNum, listener: _processTelemetry);
    _myNodeNum = ref
        .watch(radioConfigServiceProvider.select((value) => value.myNodeNum));
    _telemetryRepository = ref.watch(telemetryRepositoryProvider);
    _nodeNum = nodeNum;
    ref.onDispose(sub.cancel);
    _loadFirstTelemetry();
    return const TelemetryState();
  }

  void _processTelemetry(TimedTelemetry timedTelemetry) {
    final telemetry = timedTelemetry.telemetry;
    final environmentMetrics = telemetry.environmentMetrics;
    if (environmentMetrics.hasTemperature()) {
      state = state.copyWith(temp: telemetry.environmentMetrics.temperature);
    }
    if (environmentMetrics.hasRelativeHumidity()) {
      state = state.copyWith(
        relativeHumidity: telemetry.environmentMetrics.relativeHumidity,
      );
    }
    if (environmentMetrics.hasBarometricPressure()) {
      state = state.copyWith(
        barometricPressure: telemetry.environmentMetrics.barometricPressure,
      );
    }
    if (environmentMetrics.hasGasResistance()) {
      state = state.copyWith(
        gasResistance: telemetry.environmentMetrics.gasResistance,
      );
    }
  }

  Future<void> _loadFirstTelemetry() async {
    final telemetry = await _telemetryRepository.getOne(
      index: 0,
      fromNode: _nodeNum,
      owner: _myNodeNum,
    );
    if (telemetry != null) {
      _processTelemetry(telemetry);
    }
  }
}
