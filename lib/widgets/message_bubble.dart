import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/services/node_service.dart';
import 'text_message_status_indicator.dart';

class MessageBubble extends ConsumerWidget {
  const MessageBubble({
    super.key,
    required this.text,
    required this.fromNode,
    required this.isSender,
    required this.showSenderAvatar,
    required this.time,
    required this.showDate,
    required this.packetId,
  });

  final String text;
  final int fromNode;
  final bool isSender;
  final bool showSenderAvatar;
  final DateTime? time;
  final bool showDate;
  final int packetId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nodes = ref.watch(nodeServiceProvider);
    final node = nodes[fromNode];
    final showSenderAvatarOrNodeNull = showSenderAvatar || node == null;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (showDate)
          Center(
            child: Text(
              DateFormat.yMMMd().format(time ?? DateTime.now()),
              style: theme.textTheme.bodyLarge,
            ),
          ),
        if (showDate)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
        if (showSenderAvatarOrNodeNull)
          const SizedBox(
            height: 16,
          ),
        if (showSenderAvatarOrNodeNull)
          Padding(
            padding: const EdgeInsets.only(
              left: 50,
              right: 50,
            ),
            child: Text(
              node?.longName ?? '????',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onBackground.withAlpha(200),
              ),
            ),
          ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            if (showSenderAvatarOrNodeNull)
              Positioned(
                top: -20,
                right: isSender ? 0 : null,
                child: CircleAvatar(
                  backgroundColor: isSender
                      ? theme.colorScheme.primary
                      : theme.colorScheme.tertiary,
                  radius: 23,
                  child: Text(
                    node?.shortName ?? '????',
                    style: TextStyle(
                      color: isSender
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.onTertiary,
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: BubbleSpecialOne(
                text: text,
                color: isSender
                    ? theme.colorScheme.primary
                    : theme.colorScheme.tertiary,
                isSender: isSender,
                tail: showSenderAvatarOrNodeNull,
                textStyle: theme.textTheme.bodyLarge!.copyWith(
                  color: isSender
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.onTertiary,
                ),
              ),
            ),
            if (isSender)
              TextMessageStatusIndicator(
                packetId: packetId,
              ),
          ],
        ),
        if (time != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              DateFormat.Hm().format(time!),
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
