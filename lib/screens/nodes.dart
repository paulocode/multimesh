import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              title: Text(
                node.longName,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              subtitle: Text('Channel ${node.channel}'),
              leading: CircleAvatar(
                radius: 40,
                child: Text(nodes[index].shortName),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      context.push(
                        Uri(
                          path: '/chat',
                          queryParameters: {
                            'channel': node.channel.toString(),
                            'dmNode': node.nodeNum.toString(),
                          },
                        ).toString(),
                      );
                    },
                    icon: const Icon(Icons.mail),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chevron_right),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
