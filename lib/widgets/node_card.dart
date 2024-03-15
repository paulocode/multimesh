import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/chat_type.dart';
import '../models/mesh_node.dart';
import '../providers/services/node_service.dart';
import '../providers/services/text_message_stream_service.dart';

class NodeCard extends ConsumerWidget {
  const NodeCard({
    super.key,
    required this.node,
  });

  final MeshNode node;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nodes = ref.watch(nodeServiceProvider);
    final textMessageStreamService = ref.watch(
      textMessageStreamServiceProvider(
        chatType: DirectMessageChat(dmNode: node.nodeNum),
      ),
    );
    return StreamBuilder(
      stream: textMessageStreamService.stream,
      initialData: textMessageStreamService.getMessages(),
      builder: (context, snapshot) {
        final lastMessage = snapshot.data!.lastOrNull;
        final lastSender = lastMessage?.from;
        final lastSenderShortName = nodes[lastSender]?.shortName ?? '';
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
            subtitle: lastMessage != null
                ? Row(
                    children: [
                      Text(
                        '$lastSenderShortName: ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(lastMessage.text),
                    ],
                  )
                : Container(),
            leading: CircleAvatar(
              radius: 40,
              child: Text(node.shortName),
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
    );
  }
}