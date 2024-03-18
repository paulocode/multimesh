import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/constants/ble_constants.dart';
import 'package:meshx/models/chat_type.dart';
import 'package:meshx/models/text_message.dart';
import 'package:meshx/protobufs/generated/meshtastic/portnums.pb.dart';
import 'package:meshx/providers/radio_writer/queued_radio_writer.dart';
import 'package:meshx/providers/repository/text_message_repository.dart';
import 'package:meshx/providers/services/radio_config_service.dart';
import 'package:meshx/providers/services/text_message_sender_service.dart';
import 'package:meshx/providers/services/text_message_stream_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../common.dart';
import 'text_message_sender_service_test.mocks.dart';

@GenerateMocks([
  QueuedRadioWriter,
  RadioConfigService,
  TextMessageRepository,
  TextMessageStreamService,
])
void main() {
  late MockTextMessageRepository textMessageRepository;
  late MockQueuedRadioWriter radioWriter;
  late MockTextMessageStreamService textMessageStreamService;
  late ProviderContainer container;

  setUp(() {
    textMessageRepository = MockTextMessageRepository();
    radioWriter = MockQueuedRadioWriter();
    textMessageStreamService = MockTextMessageStreamService();
    container = createContainer(
      overrides: [
        textMessageRepositoryProvider
            .overrideWith((ref) => textMessageRepository),
        queuedRadioWriterProvider.overrideWith((ref) => radioWriter),
        textMessageStreamServiceProvider(
          chatType: const ChannelChat(channel: 1),
        ).overrideWith((ref) => textMessageStreamService),
        textMessageStreamServiceProvider(
          chatType: const DirectMessageChat(dmNode: 789123),
        ).overrideWith((ref) => textMessageStreamService),
      ],
    );

    when(
      radioWriter.sendMeshPacket(
        to: TO_BROADCAST,
        channel: 1,
        wantAck: true,
        portNum: PortNum.TEXT_MESSAGE_APP,
        payload: anyNamed('payload'),
      ),
    ).thenReturn(765);

    when(
      radioWriter.sendMeshPacket(
        to: 789123,
        // ignore: avoid_redundant_argument_values
        channel: 0,
        wantAck: true,
        portNum: PortNum.TEXT_MESSAGE_APP,
        payload: anyNamed('payload'),
      ),
    ).thenReturn(654);

    when(
      textMessageRepository.add(textMessage: anyNamed('textMessage')),
    ).thenAnswer((realInvocation) => Future.value(1));

    when(
      textMessageStreamService.onNewMessage(any),
    ).thenAnswer((realInvocation) => Future<void>.value());

    container.read(radioConfigServiceProvider.notifier).setMyNodeNum(31415);
  });

  test('send channel message', () async {
    await container.read(
      sendTextMessageProvider(
        chatType: const ChannelChat(channel: 1),
        text: 'abc',
      ).future,
    );

    final text = verify(
      radioWriter.sendMeshPacket(
        to: TO_BROADCAST,
        channel: 1,
        wantAck: true,
        portNum: PortNum.TEXT_MESSAGE_APP,
        payload: captureAnyNamed('payload'),
      ),
    ).captured.first as Uint8List;

    expect(utf8.decode(text), equals('abc'));
  });

  test('send direct message', () async {
    await container.read(
      sendTextMessageProvider(
        chatType: const DirectMessageChat(dmNode: 789123),
        text: 'xyz',
      ).future,
    );

    final text = verify(
      radioWriter.sendMeshPacket(
        to: 789123,
        // ignore: avoid_redundant_argument_values
        channel: 0,
        wantAck: true,
        portNum: PortNum.TEXT_MESSAGE_APP,
        payload: captureAnyNamed('payload'),
      ),
    ).captured.first as Uint8List;

    expect(utf8.decode(text), equals('xyz'));
  });

  test('save', () async {
    await container.read(
      sendTextMessageProvider(
        chatType: const ChannelChat(channel: 1),
        text: 'abc',
      ).future,
    );

    final repositorySavedMessage = verify(
      textMessageRepository.add(
        textMessage: captureAnyNamed('textMessage'),
      ),
    ).captured.first as TextMessage;
    expect(repositorySavedMessage.packetId, isNot(equals(0)));
    expect(repositorySavedMessage.text, equals('abc'));
    expect(repositorySavedMessage.channel, equals(1));
    expect(repositorySavedMessage.from, equals(31415));
    expect(
      repositorySavedMessage.time.difference(DateTime.now()).inSeconds.abs(),
      lessThan(10),
    );
  });

  test('notify locally', () async {
    await container.read(
      sendTextMessageProvider(
        chatType: const ChannelChat(channel: 1),
        text: 'abc',
      ).future,
    );

    final repositorySavedMessage = verify(
      textMessageRepository.add(
        textMessage: captureAnyNamed('textMessage'),
      ),
    ).captured.first as TextMessage;
    final broadcastedMessage = verify(
      textMessageStreamService.onNewMessage(
        captureAny,
      ),
    ).captured.first as TextMessage;
    expect(repositorySavedMessage, equals(broadcastedMessage));
  });
}
