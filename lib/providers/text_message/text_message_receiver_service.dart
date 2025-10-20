// coverage:ignore-file
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/text_message/text_message_receiver_service.dart';
import '../node/node_service.dart';
import '../notifications.dart';
import '../radio_config/radio_config_service.dart';
import '../radio_reader.dart';
import '../repository/text_message_repository.dart';

part 'text_message_receiver_service.g.dart';

@Riverpod(keepAlive: true)
TextMessageReceiverService textMessageReceiverService(
  Ref ref,
) {
  return TextMessageReceiverService(
    textMessageRepository: ref.watch(textMessageRepositoryProvider),
    radioReader: ref.watch(radioReaderProvider),
    // prevent rebuilds when there is a new node
    nodes: () => ref.read(nodeServiceProvider),
    nodeService: () => ref.read(nodeServiceProvider.notifier),
    configDownloaded: ref
        .watch(radioConfigServiceProvider.select((it) => it.configDownloaded)),
    myNodeNum:
        ref.watch(radioConfigServiceProvider.select((it) => it.myNodeNum)),
    showNotification: (title, text, callbackValue) async {
      ref.read(
        showNotificationProvider(
          title: title,
          text: text,
          callbackValue: callbackValue,
        ),
      );
    },
    onDispose: ref.onDispose,
  );
}
