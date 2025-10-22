// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_search.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(nodeSearch)
const nodeSearchProvider = NodeSearchFamily._();

final class NodeSearchProvider extends $FunctionalProvider<Map<int, MeshNode>,
    Map<int, MeshNode>, Map<int, MeshNode>> with $Provider<Map<int, MeshNode>> {
  const NodeSearchProvider._(
      {required NodeSearchFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'nodeSearchProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$nodeSearchHash();

  @override
  String toString() {
    return r'nodeSearchProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Map<int, MeshNode>> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Map<int, MeshNode> create(Ref ref) {
    final argument = this.argument as String;
    return nodeSearch(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<int, MeshNode> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, MeshNode>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NodeSearchProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$nodeSearchHash() => r'5d851582d1291bc2e9bcec48a2c4625fb703dd61';

final class NodeSearchFamily extends $Family
    with $FunctionalFamilyOverride<Map<int, MeshNode>, String> {
  const NodeSearchFamily._()
      : super(
          retry: null,
          name: r'nodeSearchProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  NodeSearchProvider call(
    String searchKey,
  ) =>
      NodeSearchProvider._(argument: searchKey, from: this);

  @override
  String toString() => r'nodeSearchProvider';
}
