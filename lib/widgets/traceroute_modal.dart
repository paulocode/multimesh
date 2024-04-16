import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/mesh_node.dart';
import '../providers/node/node_service.dart';
import '../providers/radio_config/radio_config_service.dart';
import '../providers/traceroute.dart';
import 'app_bar_connection_indicator.dart';
import 'node_card.dart';

class TracerouteModal extends ConsumerStatefulWidget {
  const TracerouteModal(this.nodeNum, {super.key});

  final int nodeNum;

  @override
  ConsumerState<TracerouteModal> createState() => _TracerouteModalState();
}

class _TracerouteModalState extends ConsumerState<TracerouteModal> {
  bool _isRetrying = false;

  @override
  Widget build(BuildContext context) {
    final tracerouteResponse = ref.watch(tracerouteProvider(widget.nodeNum));
    final nodes = ref.watch(nodeServiceProvider);
    final myNodeNum =
        ref.watch(radioConfigServiceProvider.select((it) => it.myNodeNum));

    late Widget body;

    if (tracerouteResponse.route == null) {
      body = SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(),
              ),
            ),
            Text(
              'Last attempt: ${DateFormat.Hms().format(tracerouteResponse.attemptTime)}',
            ),
            const SizedBox(
              height: 8,
            ),
            OutlinedButton(
              onPressed: _isRetrying
                  ? null
                  : () async {
                      setState(() {
                        _isRetrying = true;
                      });
                      await Future<void>.delayed(
                        const Duration(milliseconds: 100),
                      );
                      setState(() {
                        _isRetrying = false;
                      });
                      ref.invalidate(tracerouteProvider(widget.nodeNum));
                    },
              child: _isRetrying
                  ? const CircularProgressIndicator()
                  : const Text('Retry'),
            ),
          ],
        ),
      );
    } else {
      body = Column(
        children: [
          for (final n in [
            myNodeNum,
            ...tracerouteResponse.route!,
            widget.nodeNum,
          ].map((e) => nodes[e] ?? _defaultNode))
            Column(
              children: [
                NodeCard(node: n, showChevron: true),
                if (n.nodeNum != widget.nodeNum)
                  const Icon(Icons.arrow_downward_sharp),
              ],
            ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Last attempt: ${DateFormat.Hms().format(tracerouteResponse.attemptTime)}',
          ),
          const SizedBox(
            height: 8,
          ),
          OutlinedButton(
            onPressed: () {
              ref.invalidate(tracerouteProvider(widget.nodeNum));
            },
            child: const Text('Retry'),
          ),
        ],
      );
    }

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
