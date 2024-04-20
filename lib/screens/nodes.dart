import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/node/node_search.dart';
import '../widgets/node_card.dart';

class NodesScreen extends ConsumerStatefulWidget {
  const NodesScreen({super.key});

  @override
  ConsumerState<NodesScreen> createState() => _NodesScreenState();
}

class _NodesScreenState extends ConsumerState<NodesScreen> {
  String _searchKey = '';

  @override
  Widget build(BuildContext context) {
    final nodes = ref.watch(nodeSearchProvider(_searchKey)).values.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nodes'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TextField(
              textInputAction: TextInputAction.search,
              onChanged: (value) => setState(() {
                _searchKey = value;
              }),
              decoration: const InputDecoration(
                hintText: 'Search node name',
                filled: true,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: nodes.length,
                itemBuilder: (context, index) {
                  final node = nodes[index];
                  return NodeCard(
                    node: node,
                    showChevron: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
