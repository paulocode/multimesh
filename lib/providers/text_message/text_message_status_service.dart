import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tuple/tuple.dart';

import '../../models/text_message.dart';
import '../../models/text_message_status.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../../protobufs/generated/meshtastic/portnums.pb.dart';
import '../../repository/text_message_repository.dart';
import '../../services/interfaces/radio_reader.dart';
import '../radio_reader.dart';
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
  final _logger = Logger();

  @override
  Future<Tuple2<TextMessageStatus, Routing_Error>> build({
    required int packetId,
    Duration timeout = const Duration(minutes: 1),
  }) async {
    _textMessageRepository = ref.watch(textMessageRepositoryProvider);
    final textMessage = await _textMessageRepository.getByPacketId(
      packetId: packetId,
    );
    if (textMessage.state != TextMessageStatus.SENDING) {
      return Tuple2(textMessage.state, textMessage.routingError);
    }

    _radioReader = ref.watch(radioReaderProvider);
    _textMessage = textMessage;
    _link = ref.keepAlive();
    _setTimeout(timeout);
    _listenToStatusUpdates();
    return Tuple2(textMessage.state, textMessage.routingError);
  }

  void _setTimeout(Duration timeout) {
    _timer = Timer(timeout, () async {
      await _packetListener?.cancel();
      _link.close();
      _logger.w('Message ${_textMessage.packetId} timed out');
      state = const AsyncValue.data(
        Tuple2(TextMessageStatus.RADIO_ERROR, Routing_Error.TIMEOUT),
      );
      await _textMessageRepository.updateStatusByPacketId(
        packetId: _textMessage.packetId,
        status: TextMessageStatus.RADIO_ERROR,
        routingError: Routing_Error.TIMEOUT,
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
        _logger.i(routing);
        late final TextMessageStatus status;
        switch (routing.errorReason) {
          case Routing_Error.NONE:
            status = TextMessageStatus.OK;
          default:
            status = TextMessageStatus.RADIO_ERROR;
        }
        state = AsyncValue.data(Tuple2(status, routing.errorReason));

        await _textMessageRepository.updateStatusByPacketId(
          packetId: _textMessage.packetId,
          status: status,
          routingError: routing.errorReason,
        );
        _link.close();
        _timer.cancel();
      } else if (event.whichPayloadVariant() ==
              FromRadio_PayloadVariant.queueStatus &&
          event.queueStatus.meshPacketId == _textMessage.packetId) {
        state = const AsyncValue.data(
          Tuple2(TextMessageStatus.RECVD_BY_RADIO, Routing_Error.NONE),
        );
        await _textMessageRepository.updateStatusByPacketId(
          packetId: _textMessage.packetId,
          status: TextMessageStatus.RECVD_BY_RADIO,
        );
      }
    });
    ref.onDispose(() => _packetListener?.cancel());
  }
}
