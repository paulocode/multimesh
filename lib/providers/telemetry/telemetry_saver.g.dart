// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telemetry_saver.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$telemetrySaverHash() => r'd146385057215a3a2292909f2fe3b9100873a1cd';

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

/// See also [telemetrySaver].
@ProviderFor(telemetrySaver)
const telemetrySaverProvider = TelemetrySaverFamily();

/// See also [telemetrySaver].
class TelemetrySaverFamily extends Family<Raw<Future<void>>> {
  /// See also [telemetrySaver].
  const TelemetrySaverFamily();

  /// See also [telemetrySaver].
  TelemetrySaverProvider call(
    int nodeNum,
  ) {
    return TelemetrySaverProvider(
      nodeNum,
    );
  }

  @override
  TelemetrySaverProvider getProviderOverride(
    covariant TelemetrySaverProvider provider,
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
  String? get name => r'telemetrySaverProvider';
}

/// See also [telemetrySaver].
class TelemetrySaverProvider extends AutoDisposeProvider<Raw<Future<void>>> {
  /// See also [telemetrySaver].
  TelemetrySaverProvider(
    int nodeNum,
  ) : this._internal(
          (ref) => telemetrySaver(
            ref as TelemetrySaverRef,
            nodeNum,
          ),
          from: telemetrySaverProvider,
          name: r'telemetrySaverProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$telemetrySaverHash,
          dependencies: TelemetrySaverFamily._dependencies,
          allTransitiveDependencies:
              TelemetrySaverFamily._allTransitiveDependencies,
          nodeNum: nodeNum,
        );

  TelemetrySaverProvider._internal(
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
  Override overrideWith(
    Raw<Future<void>> Function(TelemetrySaverRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TelemetrySaverProvider._internal(
        (ref) => create(ref as TelemetrySaverRef),
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
  AutoDisposeProviderElement<Raw<Future<void>>> createElement() {
    return _TelemetrySaverProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TelemetrySaverProvider && other.nodeNum == nodeNum;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, nodeNum.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TelemetrySaverRef on AutoDisposeProviderRef<Raw<Future<void>>> {
  /// The parameter `nodeNum` of this provider.
  int get nodeNum;
}

class _TelemetrySaverProviderElement
    extends AutoDisposeProviderElement<Raw<Future<void>>>
    with TelemetrySaverRef {
  _TelemetrySaverProviderElement(super.provider);

  @override
  int get nodeNum => (origin as TelemetrySaverProvider).nodeNum;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
