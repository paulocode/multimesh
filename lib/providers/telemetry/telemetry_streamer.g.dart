// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telemetry_streamer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$telemetryStreamerHash() => r'e0ba0b07f7c860f8b5fcb780e080135310cc22be';

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

abstract class _$TelemetryStreamer
    extends BuildlessAutoDisposeStreamNotifier<List<TimedTelemetry>> {
  late final int nodeNum;

  Stream<List<TimedTelemetry>> build({
    required int nodeNum,
  });
}

/// See also [TelemetryStreamer].
@ProviderFor(TelemetryStreamer)
const telemetryStreamerProvider = TelemetryStreamerFamily();

/// See also [TelemetryStreamer].
class TelemetryStreamerFamily extends Family<AsyncValue<List<TimedTelemetry>>> {
  /// See also [TelemetryStreamer].
  const TelemetryStreamerFamily();

  /// See also [TelemetryStreamer].
  TelemetryStreamerProvider call({
    required int nodeNum,
  }) {
    return TelemetryStreamerProvider(
      nodeNum: nodeNum,
    );
  }

  @override
  TelemetryStreamerProvider getProviderOverride(
    covariant TelemetryStreamerProvider provider,
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
  String? get name => r'telemetryStreamerProvider';
}

/// See also [TelemetryStreamer].
class TelemetryStreamerProvider extends AutoDisposeStreamNotifierProviderImpl<
    TelemetryStreamer, List<TimedTelemetry>> {
  /// See also [TelemetryStreamer].
  TelemetryStreamerProvider({
    required int nodeNum,
  }) : this._internal(
          () => TelemetryStreamer()..nodeNum = nodeNum,
          from: telemetryStreamerProvider,
          name: r'telemetryStreamerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$telemetryStreamerHash,
          dependencies: TelemetryStreamerFamily._dependencies,
          allTransitiveDependencies:
              TelemetryStreamerFamily._allTransitiveDependencies,
          nodeNum: nodeNum,
        );

  TelemetryStreamerProvider._internal(
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
  Stream<List<TimedTelemetry>> runNotifierBuild(
    covariant TelemetryStreamer notifier,
  ) {
    return notifier.build(
      nodeNum: nodeNum,
    );
  }

  @override
  Override overrideWith(TelemetryStreamer Function() create) {
    return ProviderOverride(
      origin: this,
      override: TelemetryStreamerProvider._internal(
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
  AutoDisposeStreamNotifierProviderElement<TelemetryStreamer,
      List<TimedTelemetry>> createElement() {
    return _TelemetryStreamerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TelemetryStreamerProvider && other.nodeNum == nodeNum;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, nodeNum.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TelemetryStreamerRef
    on AutoDisposeStreamNotifierProviderRef<List<TimedTelemetry>> {
  /// The parameter `nodeNum` of this provider.
  int get nodeNum;
}

class _TelemetryStreamerProviderElement
    extends AutoDisposeStreamNotifierProviderElement<TelemetryStreamer,
        List<TimedTelemetry>> with TelemetryStreamerRef {
  _TelemetryStreamerProviderElement(super.provider);

  @override
  int get nodeNum => (origin as TelemetryStreamerProvider).nodeNum;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
