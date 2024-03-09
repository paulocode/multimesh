import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

import '../constants/app_constants.dart';
import '../models/chat_type.dart';
import '../models/mesh_node.dart';
import '../models/radio_configuration.dart';
import '../models/text_message.dart';
import '../providers/services/node_service.dart';
import '../providers/services/radio_config_service.dart';
import '../providers/services/text_message_stream_service.dart';
import 'message_bubble.dart';
import 'scroll_button.dart';

class MessageList extends ConsumerStatefulWidget {
  const MessageList({
    super.key,
    required this.chatType,
  });

  final ChatType chatType;

  @override
  ConsumerState<MessageList> createState() => _MessageListState();
}

class _MessageListState extends ConsumerState<MessageList> {
  late RadioConfiguration _radioConfig;
  late TextMessageStreamService _textMessageStreamService;
  final _scrollController = ScrollController();
  bool _showScrollButton = false;
  bool _showNewMessageAlert = false;
  int _oldMessagesLength = BATCH_NUM_MESSAGES_TO_LOAD;
  int _lastPacketId = 0;

  late final ListObserverController observerController;
  late final ChatScrollObserver chatObserver;

  @override
  void initState() {
    super.initState();

    observerController = ListObserverController(controller: _scrollController)
      ..cacheJumpIndexOffset = false;

    chatObserver = ChatScrollObserver(observerController)
      ..fixedPositionOffset = 5
      ..toRebuildScrollViewCallback = () {
        setState(() {});
      }
      ..onHandlePositionResultCallback = (result) {
        switch (result.type) {
          case ChatScrollObserverHandlePositionType.keepPosition:
            setState(() {
              _showNewMessageAlert = true;
            });
          case ChatScrollObserverHandlePositionType.none:
            break;
        }
      };
  }

  @override
  Widget build(BuildContext context) {
    _textMessageStreamService =
        ref.watch(textMessageStreamServiceProvider(chatType: widget.chatType));
    _radioConfig = ref.watch(radioConfigServiceProvider);

    return Expanded(
      child: Stack(
        children: [
          _buildStreamBuilder(context),
          if (_showScrollButton) _buildScrollButton(),
        ],
      ),
    );
  }

  Widget _buildStreamBuilder(BuildContext context) {
    return StreamBuilder<List<TextMessage>>(
      stream: _textMessageStreamService.stream,
      initialData: _textMessageStreamService.getMessages(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          final textMessages = snapshot.data!.reversed.toList();
          _freezeScrollIfNeeded(textMessages);
          _scrollIfNeeded(textMessages);
          _oldMessagesLength = textMessages.length;
          _lastPacketId = textMessages.firstOrNull?.packetId ?? 0;
          return _buildScrollableList(context, textMessages);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  void _scrollIfNeeded(List<TextMessage> textMessages) {
    final lastMessage = textMessages.firstOrNull;
    final sameLastMessage = lastMessage?.packetId == _lastPacketId;
    if (sameLastMessage) {
      return;
    }
    final messageIsMine = lastMessage?.from == _radioConfig.myNodeNum;
    if (messageIsMine) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });
    }
  }

  void _freezeScrollIfNeeded(List<TextMessage> textMessages) {
    if (_oldMessagesLength != textMessages.length) {
      chatObserver.standby(
        changeCount: textMessages.length - _oldMessagesLength,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textMessageStreamService.disposeOldMessages();
    super.dispose();
  }

  Widget _buildScrollableList(
    BuildContext context,
    List<TextMessage> textMessages,
  ) {
    final nodes = ref.watch(nodeServiceProvider);

    return Column(
      children: [
        Expanded(
          child: ListViewObserver(
            controller: observerController,
            onObserve: (result) {
              _listObserver(result, textMessages);
            },
            child: ListView.builder(
              physics:
                  ChatObserverClampingScrollPhysics(observer: chatObserver),
              shrinkWrap: chatObserver.isShrinkWrap,
              reverse: true,
              controller: _scrollController,
              itemCount: textMessages.length,
              itemBuilder: (ctx, index) {
                final nodeFrom = nodes[textMessages[index].from];
                return _buildMessageBubble(
                  context,
                  nodeFrom,
                  textMessages,
                  index,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildScrollButton() {
    return Positioned(
      bottom: 10,
      right: 20,
      child: ScrollButton(
        scrollToBottom: _scrollToBottom,
        showNewMessageAlert: _showNewMessageAlert,
      ),
    );
  }

  void _scrollToBottom({bool animate = true}) {
    if (animate) {
      observerController.animateTo(
        index: 0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.ease,
      );
    } else {
      observerController.jumpTo(index: 0);
    }
    setState(() {
      _showScrollButton = false;
      _showNewMessageAlert = false;
    });
  }

  Widget _buildMessageBubble(
    BuildContext context,
    MeshNode? from,
    List<TextMessage> textMessages,
    int index,
  ) {
    final textMessage = textMessages[index];
    final isFirstMessage = textMessages.last == textMessage;
    final showSenderBubble = isFirstMessage ||
        textMessage.from != textMessages[index + 1].from ||
        from == null;
    final needDate = isFirstMessage ||
        showSenderBubble ||
        textMessages[index + 1].time.day != textMessages[index].time.day;
    return MessageBubble(
      text: textMessage.text,
      src: from?.shortName ?? '',
      longName: from?.longName ?? '',
      isSender: textMessage.from == _radioConfig.myNodeNum,
      showSenderAvatar: showSenderBubble,
      time: textMessage.time,
      showDate: needDate,
      packetId: textMessage.packetId,
    );
  }

  void _listObserver(
    ListViewObserveModel resultModel,
    List<TextMessage> textMessages,
  ) {
    final firstChildIndex = resultModel.firstChild?.index ?? 0;
    final isScrolledToBottom = firstChildIndex == 0;
    final twoThirdsPoint = textMessages.length - BATCH_NUM_MESSAGES_TO_LOAD / 3;
    final isScrolledUpwardsToTwoThirds = firstChildIndex > twoThirdsPoint;
    if (isScrolledToBottom) {
      if (_showScrollButton) {
        setState(() {
          _showScrollButton = false;
          _showNewMessageAlert = false;
        });
      }
    } else {
      if (!_showScrollButton) {
        setState(() {
          _showScrollButton = true;
        });
      }
    }

    if (isScrolledUpwardsToTwoThirds) {
      EasyThrottle.throttle(
        'load-older-messages-throttler',
        const Duration(milliseconds: 200),
        _textMessageStreamService.loadOlderMessages,
      );
    }
  }
}
