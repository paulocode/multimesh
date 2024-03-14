import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/text_message.dart';
import '../models/text_message_status.dart';
import '../providers/services/text_message_status_service.dart';

class TextMessageStatusIndicator extends ConsumerWidget {
  const TextMessageStatusIndicator({
    super.key,
    required TextMessage textMessage,
  }) : _textMessage = textMessage;

  final TextMessage _textMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late final AsyncValue<TextMessageStatus> status;
    if (_textMessage.state == TextMessageStatus.SENDING) {
      status = ref.watch(
        textMessageStatusServiceProvider(textMessage: _textMessage),
      );
    } else {
      status = AsyncData(_textMessage.state);
    }

    final icon = switch (status) {
      AsyncValue(:final valueOrNull?) => switch (valueOrNull) {
          TextMessageStatus.RADIO_ERROR => Icons.error_outline,
          TextMessageStatus.MAX_RETRANSMIT => Icons.group_off_outlined,
          TextMessageStatus.OK => Icons.check_circle,
          TextMessageStatus.RECVD_BY_RADIO => Icons.check_circle_outline,
          _ => null,
        },
      _ => null,
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
