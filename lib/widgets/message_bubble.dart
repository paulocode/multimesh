import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/text_message.dart';
import '../models/text_message_status.dart';
import '../protobufs/generated/meshtastic/mesh.pb.dart';
import '../providers/node/node_service.dart';
import '../providers/text_message/text_message_status_service.dart';
import 'text_message_status_indicator.dart';

class MessageBubble extends ConsumerStatefulWidget {
  const MessageBubble({
    super.key,
    required this.textMessage,
    required this.isSender,
    required this.showSenderAvatar,
    required this.showDate,
  });

  final TextMessage textMessage;
  final bool isSender;
  final bool showSenderAvatar;
  final bool showDate;

  @override
  ConsumerState<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends ConsumerState<MessageBubble> {
  bool _showError = false;

  @override
  Widget build(BuildContext context) {
    final textMessage = widget.textMessage;
    final nodes = ref.watch(nodeServiceProvider);
    final node = nodes[textMessage.from];
    final showSenderAvatarOrNodeNull = widget.showSenderAvatar || node == null;
    final routingError = _getRoutingError(textMessage);

    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          _showError = !_showError;
        });
      },
      child: Column(
        crossAxisAlignment:
            widget.isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (widget.showDate)
            Center(
              child: Text(
                DateFormat.yMMMd().format(textMessage.time),
                style: theme.textTheme.bodyLarge,
              ),
            ),
          if (widget.showDate)
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
                  right: widget.isSender ? 0 : null,
                  child: CircleAvatar(
                    backgroundColor: widget.isSender
                        ? theme.colorScheme.primary
                        : theme.colorScheme.tertiary,
                    radius: 23,
                    child: Text(
                      node?.shortName ?? '????',
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
                  text: textMessage.text,
                  color: widget.isSender
                      ? theme.colorScheme.primary
                      : theme.colorScheme.tertiary,
                  isSender: widget.isSender,
                  tail: showSenderAvatarOrNodeNull,
                  textStyle: theme.textTheme.bodyLarge!.copyWith(
                    color: widget.isSender
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onTertiary,
                  ),
                ),
              ),
              if (widget.isSender)
                Positioned(
                  bottom: 5,
                  right: 40,
                  child: TextMessageStatusIndicator(
                    textMessage: textMessage,
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              DateFormat.Hm().format(textMessage.time),
              style: theme.textTheme.bodySmall,
            ),
          ),
          if (widget.isSender &&
              _showError &&
              routingError != Routing_Error.NONE)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                routingError?.toString() ?? 'Unknown error',
                style: theme.textTheme.bodySmall!
                    .copyWith(color: theme.colorScheme.error),
              ),
            ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Routing_Error? _getRoutingError(TextMessage textMessage) {
    if (!widget.isSender) {
      return Routing_Error.NONE;
    } else if (textMessage.state == TextMessageStatus.SENDING) {
      return ref
          .watch(
            textMessageStatusServiceProvider(packetId: textMessage.packetId),
          )
          .value
          ?.routingError;
    } else {
      return textMessage.routingError;
    }
  }
}
