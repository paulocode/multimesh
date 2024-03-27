import 'dart:async';
import 'dart:convert';

import 'package:logger/logger.dart';

import '../../constants/ble_constants.dart';
import '../../models/chat_type.dart';
import '../../models/mesh_node.dart';
import '../../models/text_message.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../../protobufs/generated/meshtastic/portnums.pb.dart';
import '../../providers/node/node_service.dart';
import '../../repository/text_message_repository.dart';
import '../interfaces/radio_reader.dart';

class TextMessageReceiverService {
  TextMessageReceiverService({
    required TextMessageRepository textMessageRepository,
    required RadioReader radioReader,
    required Map<int, MeshNode> Function() nodes,
    required NodeService Function() nodeService,
    required bool configDownloaded,
    required int myNodeNum,
    required Future<void> Function(String, String, String) showNotification,
    required void Function(void Function()) onDispose,
  })  : _onDispose = onDispose,
        _radioReader = radioReader,
        _textMessageRepository = textMessageRepository,
        _nodes = nodes,
        _showNotification = showNotification,
        _myNodeNum = myNodeNum,
        _nodeService = nodeService {
    _onDispose(_streamController.close);

    if (!configDownloaded) {
      return;
    }

    _listenToPackets();
  }

  final TextMessageRepository _textMessageRepository;
  final RadioReader _radioReader;
  final Map<int, MeshNode> Function() _nodes;
  final void Function(void Function() cb) _onDispose;
  final Future<void> Function(String, String, String) _showNotification;
  final NodeService Function() _nodeService;
  final int _myNodeNum;
  final _logger = Logger();

  final StreamController<TextMessage> _streamController =
      StreamController.broadcast();

  void _listenToPackets() {
    final subscription = _radioReader.onPacketReceived().listen(_processPacket);
    _onDispose(subscription.cancel);
  }

  StreamSubscription<TextMessage> addMessageListener({
    required ChatType chatType,
    required void Function(TextMessage) listener,
  }) {
    final stream = _streamController.stream;
    switch (chatType) {
      case DirectMessageChat():
        return stream
            .where(
              (event) =>
                  event.from == chatType.toNode && event.to == _myNodeNum,
            )
            .listen(listener);
      case ChannelChat():
        return stream
            .where(
              (event) =>
                  event.to == TO_BROADCAST && event.channel == chatType.channel,
            )
            .listen(listener);
    }
  }

  Future<void> _processPacket(FromRadio event) async {
    final packet = event.packet;
    final decoded = packet.decoded;
    if (decoded.portnum == PortNum.TEXT_MESSAGE_APP) {
      final channel = packet.channel;
      final message = TextMessage(
        packetId: packet.id,
        text: utf8.decode(decoded.payload),
        from: packet.from,
        to: packet.to,
        channel: packet.channel,
        time: DateTime.now(),
        owner: _myNodeNum,
      );
      _logger.i('Received text message from ${packet.from}');
      await _saveAndBroadcastMessage(channel, message);
    }
  }

  Future<void> _saveAndBroadcastMessage(
    int channel,
    TextMessage message,
  ) async {
    await _textMessageRepository.add(textMessage: message);
    _streamController.add(message);
    final node = _nodes()[message.from];
    if (message.to != TO_BROADCAST) {
      _nodeService().notifyHasUnreadMessages(message.from);
    }
    late final String payload;
    if (message.to != TO_BROADCAST) {
      payload = '/chat?dmNode=${message.from}';
    } else {
      payload = '/chat?channel=${message.channel}';
    }
    await _showNotification(
      node?.longName ?? '',
      message.text,
      payload,
    );
  }
}
