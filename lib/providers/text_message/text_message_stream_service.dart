import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/chat_type.dart';
import '../../services/text_message/text_message_stream_service.dart';
import '../radio_config/radio_config_service.dart';
import '../repository/text_message_repository.dart';
import 'text_message_receiver_service.dart';

part 'text_message_stream_service.g.dart';

@Riverpod(keepAlive: true)
TextMessageStreamService textMessageStreamService(
  TextMessageStreamServiceRef ref, {
  required ChatType chatType,
}) {
  return TextMessageStreamService(
    chatType: chatType,
    myNodeNum:
        ref.watch(radioConfigServiceProvider.select((it) => it.myNodeNum)),
    textMessageRepository: ref.watch(textMessageRepositoryProvider),
    textMessageReceiverService: ref.watch(textMessageReceiverServiceProvider),
    onDispose: ref.onDispose,
  );
}
