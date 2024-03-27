import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/mesh_node.dart';
import 'node_service.dart';

part 'node_search.g.dart';

@riverpod
Map<int, MeshNode> nodeSearch(NodeSearchRef ref, String searchKey) {
  final searchKeyLowercase = searchKey.toLowerCase();
  final nodes = ref.watch(nodeServiceProvider);
  if (searchKey.trim().isEmpty) {
    return nodes;
  } else {
    final result = <int, MeshNode>{};
    nodes.values
        .where(
      (element) =>
          element.longName.toLowerCase().contains(searchKeyLowercase) ||
          element.shortName.toLowerCase().contains(searchKeyLowercase),
    )
        .forEach((element) {
      result[element.nodeNum] = element;
    });
    return result;
  }
}
