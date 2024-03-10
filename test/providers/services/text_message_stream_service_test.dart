import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/constants/app_constants.dart';
import 'package:meshx/constants/ble_constants.dart';
import 'package:meshx/models/chat_type.dart';
import 'package:meshx/models/text_message.dart';
import 'package:meshx/providers/repository/text_message_repository.dart';
import 'package:meshx/providers/services/text_message_receiver_service.dart';
import 'package:meshx/providers/services/text_message_stream_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mock_stream.dart';
import 'text_message_stream_service_test.mocks.dart';

@GenerateMocks([
  TextMessageRepository,
  TextMessageReceiverService,
])
void main() {
  late TextMessageStreamService textMessageStreamService;
  late MockTextMessageRepository textMessageRepository;
  late MockTextMessageReceiverService textMessageReceiverService;
  late MockStream<TextMessage> messageStream;

  List<TextMessage> _generateMessages({int offset = 0, required int toNode}) {
    return List.generate(
      BATCH_NUM_MESSAGES_TO_LOAD,
      (index) => TextMessage(
        packetId: index,
        text: (index + offset).toString(),
        from: 777,
        to: toNode,
        channel: 1,
        time: DateTime.now(),
      ),
    );
  }

  setUp(() {
    textMessageRepository = MockTextMessageRepository();
    textMessageReceiverService = MockTextMessageReceiverService();
    messageStream = MockStream();

    when(
      textMessageRepository.getBy(
        toNode: TO_CHANNEL,
        channel: 1,
        limit: argThat(equals(BATCH_NUM_MESSAGES_TO_LOAD), named: 'limit'),
      ),
    ).thenAnswer((_) => Future.value(_generateMessages(toNode: TO_CHANNEL)));

    when(
      textMessageRepository.count(
        toNode: TO_CHANNEL,
        channel: 1,
      ),
    ).thenAnswer((_) => Future.value(BATCH_NUM_MESSAGES_TO_LOAD * 5));

    when(
      textMessageRepository.getBy(
        toNode: 123,
        fromNode: 777,
        channel: 1,
        limit: argThat(equals(BATCH_NUM_MESSAGES_TO_LOAD), named: 'limit'),
      ),
    ).thenAnswer((_) => Future.value(_generateMessages(toNode: 123)));

    when(
      textMessageRepository.count(
        toNode: 123,
        fromNode: 777,
        channel: 1,
      ),
    ).thenAnswer((_) => Future.value(BATCH_NUM_MESSAGES_TO_LOAD));

    when(
      textMessageReceiverService.addMessageListener(
        chatType: anyNamed('chatType'),
        listener: anyNamed('listener'),
      ),
    ).thenAnswer((realInvocation) {
      final listener = realInvocation.namedArguments[const Symbol('listener')]
          as void Function(TextMessage);
      return messageStream.listen(listener);
    });
  });

  Future<void> init(ChatType chatType) async {
    textMessageStreamService = TextMessageStreamService(
      chatType: chatType,
      myNodeNum: 123,
      textMessageRepository: textMessageRepository,
      textMessageReceiverService: textMessageReceiverService,
      onDispose: (_) {},
    );
    await untilCalled(
      textMessageRepository.getBy(
        toNode: anyNamed('toNode'),
        fromNode: anyNamed('fromNode'),
        channel: anyNamed('channel'),
        limit: anyNamed('limit'),
        offset: anyNamed('offset'),
      ),
    );
  }

  test('load initial channel messages', () async {
    await init(const ChannelChat(channel: 1));
    final messages = textMessageStreamService.getMessages();
    expect(messages.length, equals(BATCH_NUM_MESSAGES_TO_LOAD));
    expect(messages[0].text, equals('0'));
    expect(messages[0].to, equals(TO_CHANNEL));
  });

  test('load initial direct messages', () async {
    await init(const DirectMessageChat(dmNode: 777, channel: 1));
    final messages = textMessageStreamService.getMessages();
    expect(messages.length, equals(BATCH_NUM_MESSAGES_TO_LOAD));
    expect(messages[0].text, equals('0'));
    expect(messages[0].to, equals(123));
  });

  test('all loaded', () async {
    await init(const DirectMessageChat(dmNode: 777, channel: 1));
    final messages = await textMessageStreamService.allMessagesLoaded;
    expect(messages, isTrue);
  });

  test('all is not loaded', () async {
    await init(const ChannelChat(channel: 1));
    final messages = await textMessageStreamService.allMessagesLoaded;
    expect(messages, isFalse);
  });

  test('emit remote message', () async {
    await init(const ChannelChat(channel: 1));
    await messageStream.emit(
      TextMessage(
        text: 'new',
        from: 0,
        to: 0,
        channel: 0,
        time: DateTime.now(),
      ),
    );

    final messages = textMessageStreamService.getMessages();
    expect(messages.length, equals(BATCH_NUM_MESSAGES_TO_LOAD + 1));
    expect(messages.last.text, equals('new'));
  });

  test('emit remote message to stream', () async {
    await init(const ChannelChat(channel: 1));
    final messagesFuture = textMessageStreamService.stream.first;

    await messageStream.emit(
      TextMessage(
        text: 'new',
        from: 0,
        to: 0,
        channel: 0,
        time: DateTime.now(),
      ),
    );

    final messages = await messagesFuture;
    expect(messages.length, equals(BATCH_NUM_MESSAGES_TO_LOAD + 1));
    expect(messages.last.text, equals('new'));
  });

  test('onNewMessage', () async {
    await init(const ChannelChat(channel: 1));
    await textMessageStreamService.onNewMessage(
      TextMessage(
        text: 'new',
        from: 0,
        to: 0,
        channel: 0,
        time: DateTime.now(),
      ),
    );

    final messages = textMessageStreamService.getMessages();
    expect(messages.length, equals(BATCH_NUM_MESSAGES_TO_LOAD + 1));
    expect(messages.last.text, equals('new'));
  });

  test('onNewMessage to stream', () async {
    await init(const ChannelChat(channel: 1));
    final messagesFuture = textMessageStreamService.stream.first;

    await textMessageStreamService.onNewMessage(
      TextMessage(
        text: 'new',
        from: 0,
        to: 0,
        channel: 0,
        time: DateTime.now(),
      ),
    );
    final messages = await messagesFuture;

    expect(messages.length, equals(BATCH_NUM_MESSAGES_TO_LOAD + 1));
    expect(messages.last.text, equals('new'));
  });

  test('loadOlderMessages', () async {
    await init(const ChannelChat(channel: 1));
    final messagesFuture = textMessageStreamService.stream.first;
    when(
      textMessageRepository.getBy(
        toNode: TO_CHANNEL,
        channel: 1,
        limit: argThat(equals(BATCH_NUM_MESSAGES_TO_LOAD), named: 'limit'),
        offset: BATCH_NUM_MESSAGES_TO_LOAD,
      ),
    ).thenAnswer(
      (_) => Future.value(
        _generateMessages(
          offset: BATCH_NUM_MESSAGES_TO_LOAD,
          toNode: TO_CHANNEL,
        ),
      ),
    );

    await textMessageStreamService.loadOlderMessages();

    final messages = await messagesFuture;
    expect(messages.length, equals(BATCH_NUM_MESSAGES_TO_LOAD * 2));
    expect(messages[0].text, equals(BATCH_NUM_MESSAGES_TO_LOAD.toString()));
    expect(messages[BATCH_NUM_MESSAGES_TO_LOAD].text, equals('0'));
  });

  test('load older direct messages', () async {
    await init(const DirectMessageChat(dmNode: 777, channel: 1));
    final messagesFuture = textMessageStreamService.stream.first;
    when(
      textMessageRepository.getBy(
        toNode: 123,
        fromNode: 777,
        channel: 1,
        limit: argThat(equals(BATCH_NUM_MESSAGES_TO_LOAD), named: 'limit'),
        offset: BATCH_NUM_MESSAGES_TO_LOAD,
      ),
    ).thenAnswer(
      (_) => Future.value(
        _generateMessages(
          offset: BATCH_NUM_MESSAGES_TO_LOAD,
          toNode: 123,
        ),
      ),
    );

    await textMessageStreamService.loadOlderMessages();

    final messages = await messagesFuture;
    expect(messages.length, equals(BATCH_NUM_MESSAGES_TO_LOAD * 2));
    expect(messages[0].text, equals(BATCH_NUM_MESSAGES_TO_LOAD.toString()));
    expect(messages[0].to, equals(123));
    expect(messages[BATCH_NUM_MESSAGES_TO_LOAD].text, equals('0'));
  });

  test('disposeOldMessages', () async {
    await init(const ChannelChat(channel: 1));
    when(
      textMessageRepository.getBy(
        toNode: 123,
        channel: 1,
        limit: argThat(equals(BATCH_NUM_MESSAGES_TO_LOAD), named: 'limit'),
        offset: BATCH_NUM_MESSAGES_TO_LOAD,
      ),
    ).thenAnswer(
      (_) => Future.value(
        _generateMessages(
          offset: BATCH_NUM_MESSAGES_TO_LOAD,
          toNode: TO_CHANNEL,
        ),
      ),
    );

    textMessageStreamService.disposeOldMessages();

    final messages = textMessageStreamService.getMessages();

    expect(messages.length, equals(BATCH_NUM_MESSAGES_TO_LOAD));
    expect(messages[0].text, equals('0'));
  });
}
