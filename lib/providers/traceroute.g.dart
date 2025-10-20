// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'traceroute.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Traceroute)
const tracerouteProvider = TracerouteFamily._();

final class TracerouteProvider
    extends $NotifierProvider<Traceroute, TracerouteResponse> {
  const TracerouteProvider._(
      {required TracerouteFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'tracerouteProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tracerouteHash();

  @override
  String toString() {
    return r'tracerouteProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Traceroute create() => Traceroute();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TracerouteResponse value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TracerouteResponse>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TracerouteProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tracerouteHash() => r'3bfdd3f34e83376b7bcab21bb4eb9b6c1d635485';

final class TracerouteFamily extends $Family
    with
        $ClassFamilyOverride<Traceroute, TracerouteResponse, TracerouteResponse,
            TracerouteResponse, int> {
  const TracerouteFamily._()
      : super(
          retry: null,
          name: r'tracerouteProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  TracerouteProvider call(
    int nodeNum,
  ) =>
      TracerouteProvider._(argument: nodeNum, from: this);

  @override
  String toString() => r'tracerouteProvider';
}

abstract class _$Traceroute extends $Notifier<TracerouteResponse> {
  late final _$args = ref.$arg as int;
  int get nodeNum => _$args;

  TracerouteResponse build(
    int nodeNum,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<TracerouteResponse, TracerouteResponse>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<TracerouteResponse, TracerouteResponse>,
        TracerouteResponse,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
