// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telemetry_latest_streamer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TelemetryLatestStreamer)
const telemetryLatestStreamerProvider = TelemetryLatestStreamerFamily._();

final class TelemetryLatestStreamerProvider
    extends $NotifierProvider<TelemetryLatestStreamer, TelemetryState> {
  const TelemetryLatestStreamerProvider._(
      {required TelemetryLatestStreamerFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'telemetryLatestStreamerProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$telemetryLatestStreamerHash();

  @override
  String toString() {
    return r'telemetryLatestStreamerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TelemetryLatestStreamer create() => TelemetryLatestStreamer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TelemetryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TelemetryState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TelemetryLatestStreamerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$telemetryLatestStreamerHash() =>
    r'70e05cad7f44f3498464a29cb90c0a875e55f18d';

final class TelemetryLatestStreamerFamily extends $Family
    with
        $ClassFamilyOverride<TelemetryLatestStreamer, TelemetryState,
            TelemetryState, TelemetryState, int> {
  const TelemetryLatestStreamerFamily._()
      : super(
          retry: null,
          name: r'telemetryLatestStreamerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: false,
        );

  TelemetryLatestStreamerProvider call({
    required int nodeNum,
  }) =>
      TelemetryLatestStreamerProvider._(argument: nodeNum, from: this);

  @override
  String toString() => r'telemetryLatestStreamerProvider';
}

abstract class _$TelemetryLatestStreamer extends $Notifier<TelemetryState> {
  late final _$args = ref.$arg as int;
  int get nodeNum => _$args;

  TelemetryState build({
    required int nodeNum,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      nodeNum: _$args,
    );
    final ref = this.ref as $Ref<TelemetryState, TelemetryState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<TelemetryState, TelemetryState>,
        TelemetryState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
