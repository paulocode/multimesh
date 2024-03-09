import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/chat_type.dart';
import '../providers/services/channel_service.dart';
import '../providers/services/node_service.dart';
import '../providers/services/text_message_stream_service.dart';
import '../widgets/channel_card.dart';

class ChannelListScreen extends ConsumerWidget {
  const ChannelListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channels = ref.watch(channelServiceProvider);
    final nodes = ref.watch(nodeServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Channel List'),
      ),
      body: ListView.builder(
        itemCount: channels.length,
        itemBuilder: (context, index) {
          final channel = channels[index];
          if (!channel.used) {
            return Container();
          }
          final textMessageStreamService = ref.watch(
            textMessageStreamServiceProvider(
              chatType: ChannelChat(channel: index),
            ),
          );
          return StreamBuilder(
            stream: textMessageStreamService.stream,
            initialData: textMessageStreamService.getMessages(),
            builder: (context, snapshot) {
              final lastMessage = snapshot.data!.lastOrNull;
              final lastSender =
                  lastMessage == null ? null : nodes[lastMessage.from];
              return ChannelCard(
                channel: channel,
                lastMessage: lastMessage,
                lastMessageShortName: lastSender?.shortName,
                index: index,
              );
            },
          );
        },
      ),
    );
  }
}
