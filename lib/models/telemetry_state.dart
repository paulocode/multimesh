import 'package:freezed_annotation/freezed_annotation.dart';
part 'telemetry_state.freezed.dart';

@freezed
class TelemetryState with _$TelemetryState {
  const factory TelemetryState({
    double? temp,
  }) = _TelemetryState;

  const TelemetryState._();
}
