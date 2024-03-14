import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/text_message.dart';
import '../../models/text_message_status.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../../protobufs/generated/meshtastic/portnums.pb.dart';
import '../ble/radio_reader.dart';
import '../repository/text_message_repository.dart';

part 'text_message_status_service.g.dart';

@riverpod
class TextMessageStatusService extends _$TextMessageStatusService {
  late TextMessageRepository _textMessageRepository;
  late RadioReader _radioReader;
  late TextMessage _textMessage;
  late KeepAliveLink _link;
  StreamSubscription<FromRadio>? _packetListener;
  late Timer _timer;

  @override
  Future<TextMessageStatus> build({
    required TextMessage textMessage,
    Duration timeout = const Duration(minutes: 1),
  }) async {
    if (textMessage.state != TextMessageStatus.SENDING) {
      return textMessage.state;
    }

    _radioReader = ref.watch(radioReaderProvider);
    _textMessageRepository = ref.watch(textMessageRepositoryProvider);
    _textMessage = textMessage;
    _link = ref.keepAlive();
    _setTimeout(timeout);
    _listenToStatusUpdates();
    return _textMessage.state;
  }

  void _setTimeout(Duration timeout) {
    _timer = Timer(timeout, () async {
      await _packetListener?.cancel();
      _link.close();
      state = const AsyncValue.data(TextMessageStatus.RADIO_ERROR);
      await _textMessageRepository.updateStatusByPacketId(
        packetId: _textMessage.packetId,
        status: TextMessageStatus.RADIO_ERROR,
      );
    });
    ref.onDispose(_timer.cancel);
  }

  void _listenToStatusUpdates() {
    _packetListener = _radioReader.onPacketReceived().listen((event) async {
      final decoded = event.packet.decoded;
      if (decoded.portnum == PortNum.ROUTING_APP &&
          decoded.requestId == _textMessage.packetId) {
        final routing = Routing.fromBuffer(decoded.payload);
        final status = switch (routing.errorReason) {
          Routing_Error.NONE => TextMessageStatus.OK,
          Routing_Error.MAX_RETRANSMIT => TextMessageStatus.MAX_RETRANSMIT,
          _ => TextMessageStatus.RADIO_ERROR
        };
        state = AsyncValue.data(status);
        await _textMessageRepository.updateStatusByPacketId(
          packetId: _textMessage.packetId,
          status: status,
        );
        _link.close();
        _timer.cancel();
      } else if (event.whichPayloadVariant() ==
              FromRadio_PayloadVariant.queueStatus &&
          event.queueStatus.meshPacketId == _textMessage.packetId) {
        state = const AsyncValue.data(TextMessageStatus.RECVD_BY_RADIO);
        await _textMessageRepository.updateStatusByPacketId(
          packetId: _textMessage.packetId,
          status: TextMessageStatus.RECVD_BY_RADIO,
        );
      }
    });
    ref.onDispose(() => _packetListener?.cancel());
  }
}
