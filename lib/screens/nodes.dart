import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/services/node_service.dart';
import '../providers/services/radio_config_service.dart';

class NodesScreen extends ConsumerWidget {
  const NodesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nodes = ref.watch(nodeServiceProvider).values.toList();
    final myNodeNum = ref
        .watch(radioConfigServiceProvider.select((value) => value.myNodeNum));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nodes'),
      ),
      body: ListView.builder(
        itemCount: nodes.length,
        itemBuilder: (context, index) {
          final node = nodes[index];
          if (node.nodeNum == myNodeNum) {
            return Container();
          }
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                title: Text(nodes[index].longName),
                leading: CircleAvatar(
                  radius: 40,
                  child: Text(nodes[index].shortName),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.mail)),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
