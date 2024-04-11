import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/mesh_node.dart';
import '../providers/node/node_service.dart';
import '../providers/radio_config/radio_config_service.dart';
import '../providers/traceroute.dart';
import 'app_bar_connection_indicator.dart';
import 'node_card.dart';

class TracerouteModal extends ConsumerWidget {
  const TracerouteModal(this.nodeNum, {super.key});

  final int nodeNum;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final route = ref.watch(tracerouteProvider(nodeNum));
    final nodes = ref.watch(nodeServiceProvider);
    final myNodeNum =
        ref.watch(radioConfigServiceProvider.select((it) => it.myNodeNum));
    final body = switch (route) {
      AsyncValue(:final valueOrNull?) => Column(
          children: [
            for (final n in [myNodeNum, ...valueOrNull, nodeNum]
                .map((e) => nodes[e] ?? _defaultNode))
              Column(
                children: [
                  NodeCard(node: n, showChevron: true),
                  if (n.nodeNum != nodeNum)
                    const Icon(Icons.arrow_downward_sharp),
                ],
              ),
          ],
        ),
      AsyncError(:final error) => Text('Error $error'),
      _ => const Padding(
          padding: EdgeInsets.all(8),
          child: Center(child: CircularProgressIndicator()),
        )
    };
    return Scaffold(
      appBar: const AppBarWithConnectionIndicator(
        title: 'Traceroute',
      ),
      body: SingleChildScrollView(child: body),
    );
  }
}

// TODO create default node generator that generates default names from nodenum
final _defaultNode = MeshNode(
  nodeNum: 0,
  longName: '????',
  shortName: '????',
  channel: 0,
  id: '????',
  lastSeen: DateTime.now(),
);
