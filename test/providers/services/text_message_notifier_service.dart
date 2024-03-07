import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/constants/app_constants.dart';
import 'package:meshx/constants/ble_constants.dart';
import 'package:meshx/models/text_message.dart';
import 'package:meshx/providers/repository/text_message_repository.dart';
import 'package:meshx/providers/services/text_message_notifier_service.dart';
import 'package:meshx/providers/services/text_message_receiver_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mock_stream.dart';
import 'text_message_notifier_service.mocks.dart';

@GenerateMocks([
  TextMessageRepository,
  TextMessageReceiverService,
])
void main() {
  late TextMessageNotifierService textMessageNotifierService;
  late MockTextMessageRepository textMessageRepository;
  late MockTextMessageReceiverService textMessageReceiverService;
  late MockStream<TextMessage> messageStream;

  List<TextMessage> _generateMessages({int offset = 0}) {
    return List.generate(
      BATCH_NUM_MESSAGES_TO_LOAD,
      (index) => TextMessage(
        packetId: index,
        text: (index + offset).toString(),
        from: 1,
        to: TO_CHANNEL,
        channel: 1,
        time: DateTime.now(),
      ),
    );
  }

  setUp(() {
    textMessageRepository = MockTextMessageRepository();
    textMessageReceiverService = MockTextMessageReceiverService();
    messageStream = MockStream();
    final messages = _generateMessages();

    when(
      textMessageRepository.getBy(
        nodeNum: 123,
        channel: 1,
        limit: argThat(equals(BATCH_NUM_MESSAGES_TO_LOAD), named: 'limit'),
      ),
    ).thenAnswer((_) => Future.value(messages));

    when(
      textMessageReceiverService.addMessageListener(
        channel: 1,
        listener: anyNamed('listener'),
      ),
    ).thenAnswer((realInvocation) {
      final listener = realInvocation.namedArguments[const Symbol('listener')]
          as void Function(TextMessage);
      return messageStream.listen(listener);
    });

    textMessageNotifierService = TextMessageNotifierService(
      channel: 1,
      nodeNum: 123,
      textMessageRepository: textMessageRepository,
      textMessageReceiverService: textMessageReceiverService,
      onDispose: (_) {},
    );
  });

  test('load initial messages', () {
    final messages = textMessageNotifierService.getMessages();
    expect(messages.length, equals(BATCH_NUM_MESSAGES_TO_LOAD));
    expect(messages[0].text, equals('0'));
  });

  test('emit remote message', () async {
    await messageStream.emit(
      TextMessage(
        text: 'new',
        from: 0,
        to: 0,
        channel: 0,
        time: DateTime.now(),
      ),
    );

    final messages = textMessageNotifierService.getMessages();
    expect(messages.length, equals(BATCH_NUM_MESSAGES_TO_LOAD + 1));
    expect(messages.last.text, equals('new'));
  });

  test('emit remote message to stream', () async {
    final messagesFuture = textMessageNotifierService.stream.first;

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
    await textMessageNotifierService.onNewMessage(
      TextMessage(
        text: 'new',
        from: 0,
        to: 0,
        channel: 0,
        time: DateTime.now(),
      ),
    );

    final messages = textMessageNotifierService.getMessages();
    expect(messages.length, equals(BATCH_NUM_MESSAGES_TO_LOAD + 1));
    expect(messages.last.text, equals('new'));
  });

  test('onNewMessage to stream', () async {
    final messagesFuture = textMessageNotifierService.stream.first;

    await textMessageNotifierService.onNewMessage(
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
    final messagesFuture = textMessageNotifierService.stream.first;
    when(
      textMessageRepository.getBy(
        nodeNum: 123,
        channel: 1,
        limit: argThat(equals(BATCH_NUM_MESSAGES_TO_LOAD), named: 'limit'),
        offset: BATCH_NUM_MESSAGES_TO_LOAD,
      ),
    ).thenAnswer(
      (_) =>
          Future.value(_generateMessages(offset: BATCH_NUM_MESSAGES_TO_LOAD)),
    );

    await textMessageNotifierService.loadOlderMessages();

    final messages = await messagesFuture;
    expect(messages.length, equals(BATCH_NUM_MESSAGES_TO_LOAD * 2));
    expect(messages[0].text, equals(BATCH_NUM_MESSAGES_TO_LOAD.toString()));
    expect(messages[BATCH_NUM_MESSAGES_TO_LOAD].text, equals('0'));
  });

  test('disposeOldMessages', () async {
    when(
      textMessageRepository.getBy(
        nodeNum: 123,
        channel: 1,
        limit: argThat(equals(BATCH_NUM_MESSAGES_TO_LOAD), named: 'limit'),
        offset: BATCH_NUM_MESSAGES_TO_LOAD,
      ),
    ).thenAnswer(
      (_) =>
          Future.value(_generateMessages(offset: BATCH_NUM_MESSAGES_TO_LOAD)),
    );

    textMessageNotifierService.disposeOldMessages();

    final messages = textMessageNotifierService.getMessages();

    expect(messages.length, equals(BATCH_NUM_MESSAGES_TO_LOAD));
    expect(messages[0].text, equals('0'));
  });
}
