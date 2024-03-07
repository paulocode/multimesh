import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/services/text_message_sender_service.dart';

class MessageInput extends ConsumerStatefulWidget {
  const MessageInput({
    required this.channel,
    super.key,
  });

  final int channel;

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
            decoration: const InputDecoration(hintText: 'Input message...'),
          ),
        ),
        IconButton(
          onPressed: () async {
            final text = _textEditingController.text.trim();
            _textEditingController.clear();
            if (text.isNotEmpty) {
              ref.read(
                sendTextMessageProvider(
                  channel: widget.channel,
                  text: text,
                ),
              );
            }
          },
          icon: const Icon(
            Icons.send,
            size: 35,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
