import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/chat_type.dart';
import '../providers/text_message/text_message_sender_service.dart';

class MessageInput extends ConsumerStatefulWidget {
  const MessageInput({
    required this.chatType,
    super.key,
  });

  final ChatType chatType;

  @override
  ConsumerState<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends ConsumerState<MessageInput> {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _textEditingController,
            textInputAction: TextInputAction.send,
            onSubmitted: (_) => _send(),
            decoration: const InputDecoration(hintText: 'Input message...'),
          ),
        ),
        IconButton(
          onPressed: _send,
          icon: const Icon(
            Icons.send,
            size: 35,
          ),
        ),
      ],
    );
  }

  void _send() {
    final text = _textEditingController.text.trim();
    _textEditingController.clear();
    if (text.isNotEmpty) {
      ref.read(
        sendTextMessageProvider(
          chatType: widget.chatType,
          text: text,
        ),
      );
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
