import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/text_message_status.dart';
import '../providers/services/text_message_status_service.dart';

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
