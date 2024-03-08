import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/text_message_status.dart';
import '../providers/services/text_message_status_service.dart';

class MessageBubble extends StatefulWidget {
  const MessageBubble({
    super.key,
    required this.text,
    required this.src,
    required this.longName,
    required this.isSender,
    required this.showSenderBubble,
    required this.time,
    required this.needDate,
    required this.packetId,
  });

  final String text;
  final String src;
  final String longName;
  final bool isSender;
  final bool showSenderBubble;
  final DateTime? time;
  final bool needDate;
  final int packetId;

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  @override
  Widget build(BuildContext context) {
    final needAvatar = widget.showSenderBubble || widget.needDate;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment:
          widget.isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (widget.needDate)
          Center(
            child: Text(
              DateFormat.yMMMd().format(widget.time ?? DateTime.now()),
              style: theme.textTheme.bodyLarge,
            ),
          ),
        if (widget.needDate)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
        if (needAvatar)
          const SizedBox(
            height: 16,
          ),
        if (needAvatar)
          Padding(
            padding: const EdgeInsets.only(
              left: 50,
              right: 50,
            ),
            child: Text(
              widget.longName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onBackground.withAlpha(200),
              ),
            ),
          ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            if (needAvatar)
              Positioned(
                top: -20,
                right: widget.isSender ? 0 : null,
                child: CircleAvatar(
                  backgroundColor: widget.isSender
                      ? theme.colorScheme.primary
                      : theme.colorScheme.tertiary,
                  radius: 23,
                  child: Text(
                    widget.src,
                    style: TextStyle(
                      color: widget.isSender
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.onTertiary,
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: BubbleSpecialOne(
                text: widget.text,
                color: widget.isSender
                    ? theme.colorScheme.primary
                    : theme.colorScheme.tertiary,
                isSender: widget.isSender,
                tail: needAvatar,
                textStyle: theme.textTheme.bodyLarge!.copyWith(
                  color: widget.isSender
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.onTertiary,
                ),
              ),
            ),
            if (widget.isSender)
              TextMessageStatusIndicator(
                packetId: widget.packetId,
              ),
          ],
        ),
        if (widget.time != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              DateFormat.Hm().format(widget.time!),
              style: theme.textTheme.bodySmall,
            ),
          ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

class TextMessageStatusIndicator extends ConsumerWidget {
  const TextMessageStatusIndicator({super.key, required int packetId})
      : _packetId = packetId;

  final int _packetId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(
      textMessageStatusServiceProvider(packetId: _packetId),
    );
    final icon = switch (status) {
      AsyncValue(:final valueOrNull?) => switch (valueOrNull) {
          TextMessageStatus.SENDING => Icons.check_circle_outline,
          TextMessageStatus.RADIO_ERROR => Icons.error_outline,
          TextMessageStatus.MAX_RETRANSMIT => Icons.group_off_outlined,
          TextMessageStatus.OK => Icons.check_circle,
        },
      _ => Icons.check_circle_outline,
    };

    return Positioned(
      top: 24,
      right: 40,
      child: Icon(
        icon,
        size: 15,
      ),
    );
  }
}
