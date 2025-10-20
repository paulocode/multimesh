// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telemetry_streamer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TelemetryStreamer)
const telemetryStreamerProvider = TelemetryStreamerFamily._();

final class TelemetryStreamerProvider
    extends $StreamNotifierProvider<TelemetryStreamer, List<TimedTelemetry>> {
  const TelemetryStreamerProvider._(
      {required TelemetryStreamerFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'telemetryStreamerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$telemetryStreamerHash();

  @override
  String toString() {
    return r'telemetryStreamerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TelemetryStreamer create() => TelemetryStreamer();

  @override
  bool operator ==(Object other) {
    return other is TelemetryStreamerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$telemetryStreamerHash() => r'0a7a2bf17b6421eedb023d743dfa4078ae7d2ae2';

final class TelemetryStreamerFamily extends $Family
    with
        $ClassFamilyOverride<
            TelemetryStreamer,
            AsyncValue<List<TimedTelemetry>>,
            List<TimedTelemetry>,
            Stream<List<TimedTelemetry>>,
            int> {
  const TelemetryStreamerFamily._()
      : super(
          retry: null,
          name: r'telemetryStreamerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  TelemetryStreamerProvider call({
    required int nodeNum,
  }) =>
      TelemetryStreamerProvider._(argument: nodeNum, from: this);

  @override
  String toString() => r'telemetryStreamerProvider';
}

abstract class _$TelemetryStreamer
    extends $StreamNotifier<List<TimedTelemetry>> {
  late final _$args = ref.$arg as int;
  int get nodeNum => _$args;

  Stream<List<TimedTelemetry>> build({
    required int nodeNum,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      nodeNum: _$args,
    );
    final ref = this.ref
        as $Ref<AsyncValue<List<TimedTelemetry>>, List<TimedTelemetry>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<TimedTelemetry>>, List<TimedTelemetry>>,
        AsyncValue<List<TimedTelemetry>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
