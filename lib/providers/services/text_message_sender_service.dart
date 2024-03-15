import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/chat_type.dart';
import '../../models/text_message.dart';
import '../../protobufs/generated/meshtastic/portnums.pb.dart';
import '../ble/radio_writer.dart';
import '../repository/text_message_repository.dart';
import 'radio_config_service.dart';
import 'text_message_status_service.dart';
import 'text_message_stream_service.dart';

part 'text_message_sender_service.g.dart';

@riverpod
Future<void> sendTextMessage(
  SendTextMessageRef ref, {
  required ChatType chatType,
  required String text,
}) async {
  final radioWriter = ref.watch(radioWriterProvider);
  final myNodeNum =
      ref.watch(radioConfigServiceProvider.select((it) => it.myNodeNum));
  final textMessageRepository = ref.watch(textMessageRepositoryProvider);
  final textMessageStreamService =
      ref.watch(textMessageStreamServiceProvider(chatType: chatType));

  final message = TextMessage(
    text: text,
    from: myNodeNum,
    to: chatType.toNode,
    channel: chatType.channel,
    time: DateTime.now(),
  );

  final packetId = radioWriter.sendMeshPacket(
    channel: message.channel,
    to: message.to,
    wantAck: true,
    portNum: PortNum.TEXT_MESSAGE_APP,
    payload: utf8.encode(text),
  );
  final messageWithPacketId = message.copyWith(packetId: packetId);
  await textMessageRepository.add(textMessage: messageWithPacketId);
  await textMessageStreamService.onNewMessage(messageWithPacketId);
  // start the service to receive updates
  ref.watch(textMessageStatusServiceProvider(textMessage: messageWithPacketId));
}
