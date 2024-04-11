import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
  Future<TextMessage> build({
    required int packetId,
    Duration timeout = const Duration(minutes: 1),
  }) async {
    _textMessageRepository = ref.watch(textMessageRepositoryProvider);
    _textMessage = await _textMessageRepository.getByPacketId(
      packetId: packetId,
    );

    if (_textMessage.state != TextMessageStatus.SENDING) {
      return _textMessage;
    }

    if (DateTime.now().difference(_textMessage.time).compareTo(timeout) == 1) {
      _logger.w('Stale message ${_textMessage.packetId} timed out');

      await _textMessageRepository.updateStatusByPacketId(
        packetId: _textMessage.packetId,
        status: TextMessageStatus.RADIO_ERROR,
        routingError: Routing_Error.TIMEOUT,
      );

      return _textMessage.copyWith(
        state: TextMessageStatus.RADIO_ERROR,
        routingError: Routing_Error.TIMEOUT,
      );
    }

    _logger.i('Message status service for ${_textMessage.packetId} started');

    _radioReader = ref.watch(radioReaderProvider);
    _link = ref.keepAlive();
    _setTimeout(timeout);
    _listenToStatusUpdates();
    return _textMessage;
  }

  void _setTimeout(Duration timeout) {
    _timer = Timer(timeout, () async {
      await _packetListener?.cancel();
      _link.close();
      _logger.w('Message ${_textMessage.packetId} timed out');
      state = AsyncValue.data(
        _textMessage.copyWith(
          state: TextMessageStatus.RADIO_ERROR,
          routingError: Routing_Error.TIMEOUT,
        ),
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
        state = AsyncValue.data(
          _textMessage.copyWith(
            state: status,
            routingError: routing.errorReason,
          ),
        );

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
        state = AsyncValue.data(
          _textMessage.copyWith(
            state: TextMessageStatus.RECVD_BY_RADIO,
            routingError: Routing_Error.NONE,
          ),
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
