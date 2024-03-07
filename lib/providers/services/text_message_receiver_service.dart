import 'dart:async';

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/meshtastic_constants.dart';
import '../../models/mesh_node.dart';
import '../../models/text_message.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../../protobufs/generated/meshtastic/portnums.pb.dart';
import '../ble/radio_reader.dart';
import '../notifications/notifications.dart';
import '../repository/text_message_repository.dart';
import 'node_service.dart';
import 'radio_config_service.dart';

part 'text_message_receiver_service.g.dart';

@Riverpod(keepAlive: true)
TextMessageReceiverService textMessageReceiverService(
  TextMessageReceiverServiceRef ref,
) {
  return TextMessageReceiverService(
    textMessageRepository: ref.watch(textMessageRepositoryProvider),
    radioReader: ref.watch(radioReaderProvider),
    nodes: ref.watch(nodeServiceProvider),
    configDownloaded: ref
        .watch(radioConfigServiceProvider.select((it) => it.configDownloaded)),
    showNotification: (title, text, callbackValue) async {
      ref.read(showNotificationProvider(title, text, callbackValue));
    },
    onDispose: ref.onDispose,
  );
}

class TextMessageReceiverService {
  TextMessageReceiverService({
    required TextMessageRepository textMessageRepository,
    required RadioReader radioReader,
    required Map<int, MeshNode> nodes,
    required bool configDownloaded,
    required Future<void> Function(String, String, String) showNotification,
    required void Function(void Function()) onDispose,
  })  : _onDispose = onDispose,
        _radioReader = radioReader,
        _textMessageRepository = textMessageRepository,
        _nodes = nodes,
        _showNotification = showNotification {
    _onDispose(() {
      for (final element in _streamControllers) {
        element.close();
      }
    });

    if (!configDownloaded) {
      return;
    }

    _listenToPackets();
  }

  final TextMessageRepository _textMessageRepository;
  final RadioReader _radioReader;
  final Map<int, MeshNode> _nodes;
  final void Function(void Function() cb) _onDispose;
  final Future<void> Function(String, String, String) _showNotification;

  late final List<StreamController<TextMessage>> _streamControllers =
      List.generate(
    MESHTASTIC_MAX_CHANNELS,
    (_) => StreamController.broadcast(),
  );
  final _logger = Logger();

  void _listenToPackets() {
    final subscription = _radioReader.onPacketReceived().listen(_processPacket);
    _onDispose(subscription.cancel);
  }

  StreamSubscription<TextMessage> addMessageListener({
    required int channel,
    required void Function(TextMessage) listener,
  }) {
    return _streamControllers[channel].stream.listen(listener);
  }

  Future<void> _processPacket(FromRadio event) async {
    final packet = event.packet;
    final decoded = packet.decoded;
    if (decoded.portnum == PortNum.TEXT_MESSAGE_APP) {
      final channel = packet.channel;
      final message = TextMessage(
        packetId: packet.id,
        text: String.fromCharCodes(decoded.payload),
        from: packet.from,
        to: packet.to,
        channel: packet.channel,
        time: DateTime.now(),
      );
      await _saveAndBroadcastMessage(channel, message);
    } else if (decoded.portnum == PortNum.ROUTING_APP) {
      final routing = Routing.fromBuffer(decoded.payload);
      _logger.i(routing.toString());
    }
  }

  Future<void> _saveAndBroadcastMessage(
    int channel,
    TextMessage message,
  ) async {
    await _textMessageRepository.add(textMessage: message);
    _streamControllers[channel].add(message);
    final node = _nodes[message.from];
    await _showNotification(
      node?.longName ?? '',
      message.text,
      message.packetId.toString(),
    );
  }
}
