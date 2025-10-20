// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NodeService)
const nodeServiceProvider = NodeServiceProvider._();

final class NodeServiceProvider
    extends $NotifierProvider<NodeService, Map<int, MeshNode>> {
  const NodeServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'nodeServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$nodeServiceHash();

  @$internal
  @override
  NodeService create() => NodeService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<int, MeshNode> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, MeshNode>>(value),
    );
  }
}

String _$nodeServiceHash() => r'685ebafd38255a204dd7e0bcf7c8fcf26e07f331';

abstract class _$NodeService extends $Notifier<Map<int, MeshNode>> {
  Map<int, MeshNode> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Map<int, MeshNode>, Map<int, MeshNode>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<Map<int, MeshNode>, Map<int, MeshNode>>,
        Map<int, MeshNode>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
