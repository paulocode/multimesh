import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/text_message_status.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../../protobufs/generated/meshtastic/portnums.pb.dart';
import '../ble/radio_reader.dart';
import '../repository/text_message_repository.dart';

part 'text_message_status_service.g.dart';

@riverpod
class TextMessageStatusService extends _$TextMessageStatusService {
  @override
  Future<TextMessageStatus> build({
    required int packetId,
  }) async {
    late final Timer timeout;
    final link = ref.keepAlive();
    final textMessageRepository = ref.watch(textMessageRepositoryProvider);
    final textMessage =
        await textMessageRepository.getByPacketId(packetId: packetId);
    if (textMessage.state != TextMessageStatus.SENDING) {
      return textMessage.state;
    }

    final sub =
        ref.watch(radioReaderProvider).onPacketReceived().listen((event) async {
      final decoded = event.packet.decoded;
      if (decoded.portnum != PortNum.ROUTING_APP) {
        return;
      }
      final routing = Routing.fromBuffer(decoded.payload);
      final status = switch (routing.errorReason) {
        Routing_Error.NONE => TextMessageStatus.OK,
        Routing_Error.MAX_RETRANSMIT => TextMessageStatus.MAX_RETRANSMIT,
        _ => TextMessageStatus.RADIO_ERROR
      };
      state = AsyncValue.data(status);
      await textMessageRepository.updateStatusByPacketId(
        packetId: packetId,
        status: status,
      );
      link.close();
      timeout.cancel();
    });

    timeout = Timer(const Duration(minutes: 1), () async {
      await sub.cancel();
      link.close();
      state = const AsyncValue.data(TextMessageStatus.RADIO_ERROR);
      await textMessageRepository.updateStatusByPacketId(
        packetId: packetId,
        status: TextMessageStatus.RADIO_ERROR,
      );
    });

    ref.onDispose(sub.cancel);
    ref.onDispose(timeout.cancel);

    return textMessage.state;
  }
}
