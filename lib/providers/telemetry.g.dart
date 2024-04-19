// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telemetry.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$telemetryReceiverHash() => r'c0355d641adbf7f6f13f7b3074c5a6bf2b0aabc1';

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

abstract class _$TelemetryReceiver extends BuildlessNotifier<TelemetryState> {
  late final int nodeNum;

  TelemetryState build(
    int nodeNum,
  );
}

/// See also [TelemetryReceiver].
@ProviderFor(TelemetryReceiver)
const telemetryReceiverProvider = TelemetryReceiverFamily();

/// See also [TelemetryReceiver].
class TelemetryReceiverFamily extends Family<TelemetryState> {
  /// See also [TelemetryReceiver].
  const TelemetryReceiverFamily();

  /// See also [TelemetryReceiver].
  TelemetryReceiverProvider call(
    int nodeNum,
  ) {
    return TelemetryReceiverProvider(
      nodeNum,
    );
  }

  @override
  TelemetryReceiverProvider getProviderOverride(
    covariant TelemetryReceiverProvider provider,
  ) {
    return call(
      provider.nodeNum,
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
  String? get name => r'telemetryReceiverProvider';
}

/// See also [TelemetryReceiver].
class TelemetryReceiverProvider
    extends NotifierProviderImpl<TelemetryReceiver, TelemetryState> {
  /// See also [TelemetryReceiver].
  TelemetryReceiverProvider(
    int nodeNum,
  ) : this._internal(
          () => TelemetryReceiver()..nodeNum = nodeNum,
          from: telemetryReceiverProvider,
          name: r'telemetryReceiverProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$telemetryReceiverHash,
          dependencies: TelemetryReceiverFamily._dependencies,
          allTransitiveDependencies:
              TelemetryReceiverFamily._allTransitiveDependencies,
          nodeNum: nodeNum,
        );

  TelemetryReceiverProvider._internal(
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
    covariant TelemetryReceiver notifier,
  ) {
    return notifier.build(
      nodeNum,
    );
  }

  @override
  Override overrideWith(TelemetryReceiver Function() create) {
    return ProviderOverride(
      origin: this,
      override: TelemetryReceiverProvider._internal(
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
  NotifierProviderElement<TelemetryReceiver, TelemetryState> createElement() {
    return _TelemetryReceiverProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TelemetryReceiverProvider && other.nodeNum == nodeNum;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, nodeNum.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TelemetryReceiverRef on NotifierProviderRef<TelemetryState> {
  /// The parameter `nodeNum` of this provider.
  int get nodeNum;
}

class _TelemetryReceiverProviderElement
    extends NotifierProviderElement<TelemetryReceiver, TelemetryState>
    with TelemetryReceiverRef {
  _TelemetryReceiverProviderElement(super.provider);

  @override
  int get nodeNum => (origin as TelemetryReceiverProvider).nodeNum;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
