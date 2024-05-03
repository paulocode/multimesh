// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telemetry_receiver.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$telemetryReceiverHash() => r'18e77b76782e4912d8927572eae3e3b6950c8c6e';

/// See also [telemetryReceiver].
@ProviderFor(telemetryReceiver)
final telemetryReceiverProvider = Provider<TelemetryReceiver>.internal(
  telemetryReceiver,
  name: r'telemetryReceiverProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$telemetryReceiverHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TelemetryReceiverRef = ProviderRef<TelemetryReceiver>;
String _$telemetryLatestStreamerHash() =>
    r'70e05cad7f44f3498464a29cb90c0a875e55f18d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TelemetryLatestStreamer
    extends BuildlessNotifier<TelemetryState> {
  late final int nodeNum;

  TelemetryState build({
    required int nodeNum,
  });
}

/// See also [TelemetryLatestStreamer].
@ProviderFor(TelemetryLatestStreamer)
const telemetryLatestStreamerProvider = TelemetryLatestStreamerFamily();

/// See also [TelemetryLatestStreamer].
class TelemetryLatestStreamerFamily extends Family<TelemetryState> {
  /// See also [TelemetryLatestStreamer].
  const TelemetryLatestStreamerFamily();

  /// See also [TelemetryLatestStreamer].
  TelemetryLatestStreamerProvider call({
    required int nodeNum,
  }) {
    return TelemetryLatestStreamerProvider(
      nodeNum: nodeNum,
    );
  }

  @override
  TelemetryLatestStreamerProvider getProviderOverride(
    covariant TelemetryLatestStreamerProvider provider,
  ) {
    return call(
      nodeNum: provider.nodeNum,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'telemetryLatestStreamerProvider';
}

/// See also [TelemetryLatestStreamer].
class TelemetryLatestStreamerProvider
    extends NotifierProviderImpl<TelemetryLatestStreamer, TelemetryState> {
  /// See also [TelemetryLatestStreamer].
  TelemetryLatestStreamerProvider({
    required int nodeNum,
  }) : this._internal(
          () => TelemetryLatestStreamer()..nodeNum = nodeNum,
          from: telemetryLatestStreamerProvider,
          name: r'telemetryLatestStreamerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$telemetryLatestStreamerHash,
          dependencies: TelemetryLatestStreamerFamily._dependencies,
          allTransitiveDependencies:
              TelemetryLatestStreamerFamily._allTransitiveDependencies,
          nodeNum: nodeNum,
        );

  TelemetryLatestStreamerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.nodeNum,
  }) : super.internal();

  final int nodeNum;

  @override
  TelemetryState runNotifierBuild(
    covariant TelemetryLatestStreamer notifier,
  ) {
    return notifier.build(
      nodeNum: nodeNum,
    );
  }

  @override
  Override overrideWith(TelemetryLatestStreamer Function() create) {
    return ProviderOverride(
      origin: this,
      override: TelemetryLatestStreamerProvider._internal(
        () => create()..nodeNum = nodeNum,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        nodeNum: nodeNum,
      ),
    );
  }

  @override
  NotifierProviderElement<TelemetryLatestStreamer, TelemetryState>
      createElement() {
    return _TelemetryLatestStreamerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TelemetryLatestStreamerProvider && other.nodeNum == nodeNum;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, nodeNum.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TelemetryLatestStreamerRef on NotifierProviderRef<TelemetryState> {
  /// The parameter `nodeNum` of this provider.
  int get nodeNum;
}

class _TelemetryLatestStreamerProviderElement
    extends NotifierProviderElement<TelemetryLatestStreamer, TelemetryState>
    with TelemetryLatestStreamerRef {
  _TelemetryLatestStreamerProviderElement(super.provider);

  @override
  int get nodeNum => (origin as TelemetryLatestStreamerProvider).nodeNum;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
