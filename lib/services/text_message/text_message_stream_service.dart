import 'dart:async';

import 'package:logger/logger.dart';

import '../../constants/app_constants.dart';
import '../../constants/ble_constants.dart';
import '../../models/chat_type.dart';
import '../../models/text_message.dart';
import '../../models/text_message_status.dart';
import '../../repository/text_message_repository.dart';
import 'text_message_receiver_service.dart';

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
  bool _needsFullDispose = false;

  Future<void> _loadInitialMessagesFromLocal() async {
    _currentStreamState = switch (_chatType) {
      DirectMessageChat() => await _textMessageRepository.getDirectMessagesBy(
          myNodeNum: _myNodeNum,
          otherNodeNum: _chatType.toNode,
          limit: BATCH_NUM_MESSAGES_TO_LOAD,
          owner: _myNodeNum,
        ),
      ChannelChat() => _currentStreamState = await _textMessageRepository.getBy(
          toNode: TO_BROADCAST,
          channel: _chatType.channel,
          limit: BATCH_NUM_MESSAGES_TO_LOAD,
          owner: _myNodeNum,
        ),
    };

    _currentStreamState = _currentStreamState.reversed.toList();

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
          otherNodeNum: _chatType.toNode,
          owner: _myNodeNum,
        );
      case ChannelChat():
        totalSavedMessages = await _textMessageRepository.count(
          toNode: TO_BROADCAST,
          channel: _chatType.channel,
          owner: _myNodeNum,
        );
    }

    return _currentStreamState.length == totalSavedMessages;
  }

  Future<void> loadOlderMessages() async {
    final prevLen = _currentStreamState.length;
    final oldMessages = switch (_chatType) {
      DirectMessageChat() => await _textMessageRepository.getDirectMessagesBy(
          myNodeNum: _myNodeNum,
          otherNodeNum: _chatType.toNode,
          limit: BATCH_NUM_MESSAGES_TO_LOAD,
          offset: prevLen,
          owner: _myNodeNum,
        ),
      ChannelChat() => await _textMessageRepository.getBy(
          toNode: TO_BROADCAST,
          channel: _chatType.channel,
          limit: BATCH_NUM_MESSAGES_TO_LOAD,
          offset: prevLen,
          owner: _myNodeNum,
        )
    };
    _currentStreamState = [
      ...oldMessages.reversed,
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
    // because this class does not listen to status updates,
    // we must clear the messages cache to not serve stale
    // statuses.
    if (textMessage.from == _myNodeNum) {
      _needsFullDispose = true;
    }
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
    if (_needsFullDispose) {
      _loadInitialMessagesFromLocal();
      _needsFullDispose = _currentStreamState
          .any((element) => element.state == TextMessageStatus.SENDING);
    } else {
      final length = _currentStreamState.length;
      _currentStreamState = length < BATCH_NUM_MESSAGES_TO_LOAD
          ? _currentStreamState
          : _currentStreamState.sublist(length - BATCH_NUM_MESSAGES_TO_LOAD);
      _logger.i(
        'Old messages disposed. New length: ${_currentStreamState.length}',
      );
    }
  }
}
