import 'dart:async';

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/app_constants.dart';
import '../../constants/ble_constants.dart';
import '../../models/chat_type.dart';
import '../../models/text_message.dart';
import '../repository/text_message_repository.dart';
import 'radio_config_service.dart';
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

class TextMessageStreamService {
  TextMessageStreamService({
    required ChatType chatType,
    required int myNodeNum,
    required TextMessageRepository textMessageRepository,
    required TextMessageReceiverService textMessageReceiverService,
    required void Function(void Function()) onDispose,
  })  : _chatType = chatType,
        _myNodeNum = myNodeNum,
        _onDispose = onDispose,
        _textMessageRepository = textMessageRepository,
        _textMessageReceiverService = textMessageReceiverService {
    _loadInitialMessagesFromLocal();
    _listenToRemoteMessages();
    _onDispose(_streamController.close);
  }

  final ChatType _chatType;
  final int _myNodeNum;
  final TextMessageRepository _textMessageRepository;
  final TextMessageReceiverService _textMessageReceiverService;
  final void Function(void Function() cb) _onDispose;
  List<TextMessage> _currentStreamState = [];
  final _logger = Logger();

  Future<void> _loadInitialMessagesFromLocal() async {
    _currentStreamState = switch (_chatType) {
      DirectMessageChat() => await _textMessageRepository.getDirectMessagesBy(
          myNodeNum: _myNodeNum,
          otherNodeNum: _chatType.dmNode,
          limit: BATCH_NUM_MESSAGES_TO_LOAD,
        ),
      ChannelChat() => _currentStreamState = await _textMessageRepository.getBy(
          toNode: TO_CHANNEL,
          channel: _chatType.channel,
          limit: BATCH_NUM_MESSAGES_TO_LOAD,
        ),
    };

    _logger.i('Loaded initial messages: ${_currentStreamState.length}');
    _streamController.add(_currentStreamState);
  }

  final _streamController = StreamController<List<TextMessage>>.broadcast();

  Stream<List<TextMessage>> get stream {
    return _streamController.stream;
  }

  Future<bool> get allMessagesLoaded async {
    late final int totalSavedMessages;

    switch (_chatType) {
      case DirectMessageChat():
        totalSavedMessages = await _textMessageRepository.countDirectMessagesBy(
          myNodeNum: _myNodeNum,
          otherNodeNum: _chatType.dmNode,
        );
      case ChannelChat():
        totalSavedMessages = await _textMessageRepository.count(
          toNode: TO_CHANNEL,
          channel: _chatType.channel,
        );
    }

    return _currentStreamState.length == totalSavedMessages;
  }

  Future<void> loadOlderMessages() async {
    final prevLen = _currentStreamState.length;
    final oldMessages = switch (_chatType) {
      DirectMessageChat() => await _textMessageRepository.getDirectMessagesBy(
          myNodeNum: _myNodeNum,
          otherNodeNum: _chatType.dmNode,
          limit: BATCH_NUM_MESSAGES_TO_LOAD,
          offset: prevLen,
        ),
      ChannelChat() => await _textMessageRepository.getBy(
          toNode: TO_CHANNEL,
          channel: _chatType.channel,
          limit: BATCH_NUM_MESSAGES_TO_LOAD,
          offset: prevLen,
        )
    };
    _currentStreamState = [
      ...oldMessages,
      ..._currentStreamState,
    ];
    _logger.i('Loaded messages: ${_currentStreamState.length}');
    _streamController.add(_currentStreamState);
  }

  Future<void> onNewMessage(TextMessage textMessage) async {
    _currentStreamState = [
      ..._currentStreamState,
      textMessage,
    ];
    _streamController.add(_currentStreamState);
  }

  void _listenToRemoteMessages() {
    final subscription = _textMessageReceiverService.addMessageListener(
      chatType: _chatType,
      listener: onNewMessage,
    );
    _onDispose(subscription.cancel);
  }

  List<TextMessage> getMessages() => List.unmodifiable(_currentStreamState);

  void disposeOldMessages() {
    final length = _currentStreamState.length;
    _currentStreamState = length < BATCH_NUM_MESSAGES_TO_LOAD
        ? _currentStreamState
        : _currentStreamState.sublist(length - BATCH_NUM_MESSAGES_TO_LOAD);
    _logger
        .i('Old messages disposed. New length: ${_currentStreamState.length}');
  }
}
