import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/chat_type.dart';
import '../providers/channel_service.dart';
import '../providers/node/node_service.dart';
import '../widgets/app_bar_connection_indicator.dart';
import '../widgets/message_input.dart';
import '../widgets/message_list.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key, required ChatType chatType})
      : _chatType = chatType;

  final ChatType _chatType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channels = ref.watch(channelServiceProvider);
    final nodes = ref.watch(nodeServiceProvider);
    final title = switch (_chatType) {
      DirectMessageChat() => nodes[_chatType.toNode]?.longName ?? '',
      ChannelChat() => channels[_chatType.channel].name,
    };
    if (_chatType is DirectMessageChat) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        ref
            .read(nodeServiceProvider.notifier)
            .unsetHasUnreadMessages(_chatType.toNode);
      });
    }
    return Scaffold(
      appBar: AppBarWithConnectionIndicator(title: title),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        child: Column(
          children: [
            MessageList(
              chatType: _chatType,
            ),
            MessageInput(
              chatType: _chatType,
            ),
          ],
        ),
      ),
    );
  }
}
