import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/mesh_node.dart';
import '../providers/node/node_service.dart';
import '../widgets/app_bar_connection_indicator.dart';
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
    final nodes = ref.watch(nodeServiceProvider);
    final node = nodes[widget.nodeNum] ?? _defaultNode;
    return Scaffold(
      appBar: AppBarWithConnectionIndicator(
        title: node.longName,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              NodeCard(
                node: node,
                showChevron: false,
              ),
              OutlinedButton(
                onPressed: () {
                  context.push('/telemetryLog?nodeNum=${widget.nodeNum}');
                },
                child: const Text('Telemetry'),
              ),
              OutlinedButton(
                onPressed: () {
                  context.push('/traceroute?nodeNum=${widget.nodeNum}');
                },
                child: const Text('Traceroute'),
              ),
            ],
          );
        },
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
