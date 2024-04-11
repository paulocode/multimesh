import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/mesh_node.dart';
import '../providers/node/node_service.dart';
import '../widgets/node_card.dart';

class NodeInfoScreen extends ConsumerStatefulWidget {
  const NodeInfoScreen(this.nodeNum, {super.key});

  final int nodeNum;

  @override
  ConsumerState<NodeInfoScreen> createState() => _NodeInfoScreenState();
}

class _NodeInfoScreenState extends ConsumerState<NodeInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final node = ref.watch(nodeServiceProvider)[widget.nodeNum] ?? _defaultNode;
    return Scaffold(
      appBar: AppBar(
        title: Text(node.longName),
      ),
      body: Column(
        children: [
          Hero(
              tag: node.nodeNum,
              child: NodeCard(
                node: node,
                showChevron: false,
              )),
          OutlinedButton(
            child: const Text('Traceroute'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

final _defaultNode = MeshNode(
  nodeNum: 0,
  longName: '????',
  shortName: '????',
  channel: 0,
  id: '????',
  lastSeen: DateTime.now(),
);
