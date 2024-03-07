import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/services/channel_service.dart';
import '../widgets/message_input.dart';
import '../widgets/message_list.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key, required this.channel});

  final int channel;

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final channels = ref.watch(channelServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(channels[widget.channel].name),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        child: Column(
          children: [
            MessageList(channel: widget.channel),
            MessageInput(channel: widget.channel),
          ],
        ),
      ),
    );
  }
}
