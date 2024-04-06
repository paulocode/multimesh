import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/text_message.dart';
import '../models/text_message_status.dart';
import '../providers/text_message/text_message_status_service.dart';

class TextMessageStatusIndicator extends ConsumerWidget {
  const TextMessageStatusIndicator({
    super.key,
    required TextMessage textMessage,
  }) : _textMessage = textMessage;

  final TextMessage _textMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref
        .watch(
          textMessageStatusServiceProvider(textMessage: _textMessage),
        )
        .value
        ?.state;

    final icon = switch (status) {
      TextMessageStatus.RADIO_ERROR => Icons.error_outline,
      TextMessageStatus.OK => Icons.check_circle,
      TextMessageStatus.RECVD_BY_RADIO => Icons.check_circle_outline,
      _ => null,
    };

    return Icon(
      icon,
      size: 15,
    );
  }
}
