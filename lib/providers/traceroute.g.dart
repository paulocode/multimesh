// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'traceroute.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tracerouteHash() => r'e9a8b925fc7e1f5280d1bd8bd1709db921722512';

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

/// See also [traceroute].
@ProviderFor(traceroute)
const tracerouteProvider = TracerouteFamily();

/// See also [traceroute].
class TracerouteFamily extends Family<AsyncValue<List<int>>> {
  /// See also [traceroute].
  const TracerouteFamily();

  /// See also [traceroute].
  TracerouteProvider call(
    int nodeNum, {
    Duration timeout = const Duration(minutes: 5),
  }) {
    return TracerouteProvider(
      nodeNum,
      timeout: timeout,
    );
  }

  @override
  TracerouteProvider getProviderOverride(
    covariant TracerouteProvider provider,
  ) {
    return call(
      provider.nodeNum,
      timeout: provider.timeout,
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

/// See also [traceroute].
class TracerouteProvider extends AutoDisposeFutureProvider<List<int>> {
  /// See also [traceroute].
  TracerouteProvider(
    int nodeNum, {
    Duration timeout = const Duration(minutes: 5),
  }) : this._internal(
          (ref) => traceroute(
            ref as TracerouteRef,
            nodeNum,
            timeout: timeout,
          ),
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
          timeout: timeout,
        );

  TracerouteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.nodeNum,
    required this.timeout,
  }) : super.internal();

  final int nodeNum;
  final Duration timeout;

  @override
  Override overrideWith(
    FutureOr<List<int>> Function(TracerouteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TracerouteProvider._internal(
        (ref) => create(ref as TracerouteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        nodeNum: nodeNum,
        timeout: timeout,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<int>> createElement() {
    return _TracerouteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TracerouteProvider &&
        other.nodeNum == nodeNum &&
        other.timeout == timeout;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, nodeNum.hashCode);
    hash = _SystemHash.combine(hash, timeout.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TracerouteRef on AutoDisposeFutureProviderRef<List<int>> {
  /// The parameter `nodeNum` of this provider.
  int get nodeNum;

  /// The parameter `timeout` of this provider.
  Duration get timeout;
}

class _TracerouteProviderElement
    extends AutoDisposeFutureProviderElement<List<int>> with TracerouteRef {
  _TracerouteProviderElement(super.provider);

  @override
  int get nodeNum => (origin as TracerouteProvider).nodeNum;
  @override
  Duration get timeout => (origin as TracerouteProvider).timeout;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
