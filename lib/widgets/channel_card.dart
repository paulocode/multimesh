import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../models/chat_type.dart';
import '../models/mesh_channel.dart';
import '../providers/services/node_service.dart';
import '../providers/services/text_message_stream_service.dart';

class ChannelCard extends ConsumerWidget {
  const ChannelCard({
    super.key,
    required MeshChannel channel,
    required int index,
  })  : _index = index,
        _channel = channel;

  final MeshChannel _channel;
  final int _index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nodes = ref.watch(nodeServiceProvider);
    final textMessageStreamService = ref.watch(
      textMessageStreamServiceProvider(
        chatType: ChannelChat(channel: _index),
      ),
    );
    return InkWell(
      onTap: () {
        context.push(
          Uri(path: '/chat', queryParameters: {'channel': _index.toString()})
              .toString(),
        );
      },
      child: StreamBuilder(
        stream: textMessageStreamService.stream,
        initialData: textMessageStreamService.getMessages(),
        builder: (context, snapshot) {
          final lastMessage = snapshot.data!.lastOrNull;
          final lastSender = lastMessage == null ? null : nodes[lastMessage.from];
          final lastMessageShortName = lastSender?.shortName;
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              leading: Text(
                _index.toString(),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_channel.name),
                  if (lastMessage != null)
                    Text(
                      '${lastMessageShortName ?? ''}: ${lastMessage.text}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    )
                  else
                    const Text('No messages'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (lastMessage != null)
                    Text(
                      DateFormat.yMd().add_Hm().format(lastMessage.time),
                    ),
                  const SizedBox(width: 20),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
