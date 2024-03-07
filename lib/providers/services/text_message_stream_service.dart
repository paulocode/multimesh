import 'dart:async';

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/app_constants.dart';
import '../../models/text_message.dart';
import '../repository/text_message_repository.dart';
import 'radio_config_service.dart';
import 'text_message_receiver_service.dart';

part 'text_message_stream_service.g.dart';

@riverpod
TextMessageStreamService textMessageStreamService(
  TextMessageStreamServiceRef ref, {
  required int channel,
}) {
  return TextMessageStreamService(
    channel: channel,
    nodeNum: ref.watch(radioConfigServiceProvider.select((it) => it.myNodeNum)),
    textMessageRepository: ref.watch(textMessageRepositoryProvider),
    textMessageReceiverService: ref.watch(textMessageReceiverServiceProvider),
    onDispose: ref.onDispose,
  );
}

class TextMessageStreamService {
  TextMessageStreamService({
    required int channel,
    required int nodeNum,
    required TextMessageRepository textMessageRepository,
    required TextMessageReceiverService textMessageReceiverService,
    required void Function(void Function()) onDispose,
  })  : _channel = channel,
        _nodeNum = nodeNum,
        _onDispose = onDispose,
        _textMessageRepository = textMessageRepository,
        _textMessageReceiverService = textMessageReceiverService {
    _loadInitialMessagesFromLocal();
    _listenToRemoteMessages();
    _onDispose(_streamController.close);
  }

  Future<void> _loadInitialMessagesFromLocal() async {
    _currentStreamState = await _textMessageRepository.getBy(
      nodeNum: _nodeNum,
      channel: _channel,
      limit: BATCH_NUM_MESSAGES_TO_LOAD,
    );
    _logger.i('Loaded initial messages: ${_currentStreamState.length}');
    _streamController.add(_currentStreamState);
  }

  final int _channel;
  final int _nodeNum;
  final TextMessageRepository _textMessageRepository;
  final TextMessageReceiverService _textMessageReceiverService;
  final void Function(void Function() cb) _onDispose;
  List<TextMessage> _currentStreamState = [];
  final _logger = Logger();

  final _streamController = StreamController<List<TextMessage>>.broadcast();

  Stream<List<TextMessage>> get stream {
    return _streamController.stream;
  }

  Future<bool> get allMessagesLoaded async {
    final totalSavedMessages = await _textMessageRepository.count(
      channel: _channel,
      nodeNum: _nodeNum,
    );
    return _currentStreamState.length == totalSavedMessages;
  }

  Future<void> loadOlderMessages() async {
    final prevLen = _currentStreamState.length;
    final oldMessages = await _textMessageRepository.getBy(
      nodeNum: _nodeNum,
      offset: prevLen,
      channel: _channel,
      limit: BATCH_NUM_MESSAGES_TO_LOAD,
    );
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
      channel: _channel,
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
