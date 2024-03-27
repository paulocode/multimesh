// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_search.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nodeSearchHash() => r'573a10d5de2179f9f95b0c4cb1993b7610c14009';

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

/// See also [nodeSearch].
@ProviderFor(nodeSearch)
const nodeSearchProvider = NodeSearchFamily();

/// See also [nodeSearch].
class NodeSearchFamily extends Family<Map<int, MeshNode>> {
  /// See also [nodeSearch].
  const NodeSearchFamily();

  /// See also [nodeSearch].
  NodeSearchProvider call(
    String searchKey,
  ) {
    return NodeSearchProvider(
      searchKey,
    );
  }

  @override
  NodeSearchProvider getProviderOverride(
    covariant NodeSearchProvider provider,
  ) {
    return call(
      provider.searchKey,
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
  String? get name => r'nodeSearchProvider';
}

/// See also [nodeSearch].
class NodeSearchProvider extends AutoDisposeProvider<Map<int, MeshNode>> {
  /// See also [nodeSearch].
  NodeSearchProvider(
    String searchKey,
  ) : this._internal(
          (ref) => nodeSearch(
            ref as NodeSearchRef,
            searchKey,
          ),
          from: nodeSearchProvider,
          name: r'nodeSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$nodeSearchHash,
          dependencies: NodeSearchFamily._dependencies,
          allTransitiveDependencies:
              NodeSearchFamily._allTransitiveDependencies,
          searchKey: searchKey,
        );

  NodeSearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchKey,
  }) : super.internal();

  final String searchKey;

  @override
  Override overrideWith(
    Map<int, MeshNode> Function(NodeSearchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NodeSearchProvider._internal(
        (ref) => create(ref as NodeSearchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        searchKey: searchKey,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Map<int, MeshNode>> createElement() {
    return _NodeSearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NodeSearchProvider && other.searchKey == searchKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchKey.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NodeSearchRef on AutoDisposeProviderRef<Map<int, MeshNode>> {
  /// The parameter `searchKey` of this provider.
  String get searchKey;
}

class _NodeSearchProviderElement
    extends AutoDisposeProviderElement<Map<int, MeshNode>> with NodeSearchRef {
  _NodeSearchProviderElement(super.provider);

  @override
  String get searchKey => (origin as NodeSearchProvider).searchKey;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
