// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'traceroute.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tracerouteHash() => r'3bfdd3f34e83376b7bcab21bb4eb9b6c1d635485';

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

abstract class _$Traceroute
    extends BuildlessAutoDisposeNotifier<TracerouteResponse> {
  late final int nodeNum;

  TracerouteResponse build(
    int nodeNum,
  );
}

/// See also [Traceroute].
@ProviderFor(Traceroute)
const tracerouteProvider = TracerouteFamily();

/// See also [Traceroute].
class TracerouteFamily extends Family<TracerouteResponse> {
  /// See also [Traceroute].
  const TracerouteFamily();

  /// See also [Traceroute].
  TracerouteProvider call(
    int nodeNum,
  ) {
    return TracerouteProvider(
      nodeNum,
    );
  }

  @override
  TracerouteProvider getProviderOverride(
    covariant TracerouteProvider provider,
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
  String? get name => r'tracerouteProvider';
}

/// See also [Traceroute].
class TracerouteProvider
    extends AutoDisposeNotifierProviderImpl<Traceroute, TracerouteResponse> {
  /// See also [Traceroute].
  TracerouteProvider(
    int nodeNum,
  ) : this._internal(
          () => Traceroute()..nodeNum = nodeNum,
          from: tracerouteProvider,
          name: r'tracerouteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tracerouteHash,
          dependencies: TracerouteFamily._dependencies,
          allTransitiveDependencies:
              TracerouteFamily._allTransitiveDependencies,
          nodeNum: nodeNum,
        );

  TracerouteProvider._internal(
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
  TracerouteResponse runNotifierBuild(
    covariant Traceroute notifier,
  ) {
    return notifier.build(
      nodeNum,
    );
  }

  @override
  Override overrideWith(Traceroute Function() create) {
    return ProviderOverride(
      origin: this,
      override: TracerouteProvider._internal(
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
  AutoDisposeNotifierProviderElement<Traceroute, TracerouteResponse>
      createElement() {
    return _TracerouteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TracerouteProvider && other.nodeNum == nodeNum;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, nodeNum.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TracerouteRef on AutoDisposeNotifierProviderRef<TracerouteResponse> {
  /// The parameter `nodeNum` of this provider.
  int get nodeNum;
}

class _TracerouteProviderElement
    extends AutoDisposeNotifierProviderElement<Traceroute, TracerouteResponse>
    with TracerouteRef {
  _TracerouteProviderElement(super.provider);

  @override
  int get nodeNum => (origin as TracerouteProvider).nodeNum;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
