// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hops_away.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hopsAwayHash() => r'359013b0ad14b82fcc6757712f356cc82f147bbf';

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

abstract class _$HopsAway extends BuildlessNotifier<int?> {
  late final int nodeNum;

  int? build(
    int nodeNum,
  );
}

/// See also [HopsAway].
@ProviderFor(HopsAway)
const hopsAwayProvider = HopsAwayFamily();

/// See also [HopsAway].
class HopsAwayFamily extends Family<int?> {
  /// See also [HopsAway].
  const HopsAwayFamily();

  /// See also [HopsAway].
  HopsAwayProvider call(
    int nodeNum,
  ) {
    return HopsAwayProvider(
      nodeNum,
    );
  }

  @override
  HopsAwayProvider getProviderOverride(
    covariant HopsAwayProvider provider,
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
  String? get name => r'hopsAwayProvider';
}

/// See also [HopsAway].
class HopsAwayProvider extends NotifierProviderImpl<HopsAway, int?> {
  /// See also [HopsAway].
  HopsAwayProvider(
    int nodeNum,
  ) : this._internal(
          () => HopsAway()..nodeNum = nodeNum,
          from: hopsAwayProvider,
          name: r'hopsAwayProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$hopsAwayHash,
          dependencies: HopsAwayFamily._dependencies,
          allTransitiveDependencies: HopsAwayFamily._allTransitiveDependencies,
          nodeNum: nodeNum,
        );

  HopsAwayProvider._internal(
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
  int? runNotifierBuild(
    covariant HopsAway notifier,
  ) {
    return notifier.build(
      nodeNum,
    );
  }

  @override
  Override overrideWith(HopsAway Function() create) {
    return ProviderOverride(
      origin: this,
      override: HopsAwayProvider._internal(
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
  NotifierProviderElement<HopsAway, int?> createElement() {
    return _HopsAwayProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HopsAwayProvider && other.nodeNum == nodeNum;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, nodeNum.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HopsAwayRef on NotifierProviderRef<int?> {
  /// The parameter `nodeNum` of this provider.
  int get nodeNum;
}

class _HopsAwayProviderElement extends NotifierProviderElement<HopsAway, int?>
    with HopsAwayRef {
  _HopsAwayProviderElement(super.provider);

  @override
  int get nodeNum => (origin as HopsAwayProvider).nodeNum;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
