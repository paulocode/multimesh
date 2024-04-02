import 'dart:async';
import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/chat_type.dart';
import '../../models/text_message.dart';
import '../../protobufs/generated/meshtastic/portnums.pb.dart';
import '../ack_waiting_radio_writer.dart';
import '../radio_config/radio_config_service.dart';
import '../repository/text_message_repository.dart';
import 'text_message_status_service.dart';
import 'text_message_stream_service.dart';

part 'text_message_sender_service.g.dart';

@riverpod
Future<void> sendTextMessage(
  SendTextMessageRef ref, {
  required ChatType chatType,
  required String text,
}) async {
  final radioWriter = ref.watch(ackWaitingRadioWriterProvider);
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
    owner: myNodeNum,
    packetId: radioWriter.generatePacketId(),
  );

  await textMessageRepository.add(textMessage: message);
  await textMessageStreamService.onNewMessage(message);
  // start the service to receive updates
  ref.read(textMessageStatusServiceProvider(textMessage: message));

  await radioWriter.sendMeshPacket(
    channel: message.channel,
    to: message.to,
    wantAck: true,
    portNum: PortNum.TEXT_MESSAGE_APP,
    payload: utf8.encode(text),
    id: message.packetId,
  );
}
