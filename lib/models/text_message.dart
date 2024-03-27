import 'package:freezed_annotation/freezed_annotation.dart';

import 'text_message_status.dart';

part 'text_message.freezed.dart';

@freezed
class TextMessage with _$TextMessage {
  const factory TextMessage({
    @Default(0) int packetId,
    required String text,
    required int from,
    required int to,
    required int channel,
    required DateTime time,
    @Default(TextMessageStatus.SENDING) TextMessageStatus state,
    required int owner,
  }) = _TextMessage;

  const TextMessage._();
}
