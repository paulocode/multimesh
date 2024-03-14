import 'dart:async';
import 'dart:convert';

import 'package:meshx/constants/ble_constants.dart';
import 'package:meshx/models/chat_type.dart';
import 'package:meshx/models/mesh_node.dart';
import 'package:meshx/models/text_message.dart';
import 'package:meshx/protobufs/generated/meshtastic/mesh.pb.dart';
import 'package:meshx/protobufs/generated/meshtastic/mesh.pbserver.dart';
import 'package:meshx/protobufs/generated/meshtastic/portnums.pb.dart';
import 'package:meshx/providers/ble/radio_reader.dart';
import 'package:meshx/providers/repository/text_message_repository.dart';
import 'package:meshx/providers/services/text_message_receiver_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../common.dart';
import '../../mock_stream.dart';
import 'text_message_receiver_service_test.mocks.dart';

@GenerateMocks([
  TextMessageRepository,
  RadioReader,
  ShowNotification,
])
void main() {
  late MockTextMessageRepository textMessageRepository;
  late MockRadioReader radioReader;
  late MockStream<FromRadio> packetStream;
  late MockShowNotification mockShowNotification;

  setUp(() {
    packetStream = MockStream();
    textMessageRepository = MockTextMessageRepository();
    when(textMessageRepository.add(textMessage: anyNamed('textMessage')))
        .thenAnswer((realInvocation) => Future.value(456));
    radioReader = MockRadioReader();
    mockShowNotification = MockShowNotification();
    when(radioReader.onPacketReceived()).thenAnswer((_) => packetStream);
  });

  TextMessageReceiverService init({bool configDownloaded = true}) {
    return TextMessageReceiverService(
      textMessageRepository: textMessageRepository,
      radioReader: radioReader,
      nodes: () => {
        123241: MeshNode(
          channel: 1,
          shortName: 'abc',
          longName: 'ABC DEF',
          nodeNum: 999,
          id: '!abc',
        ),
      },
      configDownloaded: configDownloaded,
      myNodeNum: 111,
      showNotification: (title, text, callbackValue) async {
        await mockShowNotification.showNotification(
          title: title,
          text: text,
          callbackValue: callbackValue,
        );
      },
      onDispose: (_) {},
    );
  }

  test('receive channel message and save', () async {
    final textMessageReceiverService = init();
    final messageCompleter = Completer<TextMessage>();
    textMessageReceiverService.addMessageListener(
      chatType: const ChannelChat(channel: 1),
      listener: messageCompleter.complete,
    );

    await packetStream.emit(
      FromRadio(
        packet: MeshPacket(
          id: 123,
          channel: 1,
          from: 789,
          to: TO_CHANNEL,
          decoded: Data(
            portnum: PortNum.TEXT_MESSAGE_APP,
            payload: utf8.encode('abc'),
          ),
        ),
      ),
    );

    final message = await messageCompleter.future;
    expect(message.text, equals('abc'));
    expect(message.packetId, equals(123));
    expect(message.channel, equals(1));
    expect(message.from, equals(789));
    expect(message.to, equals(TO_CHANNEL));
    expect(
      message.time.difference(DateTime.now()).inSeconds.abs() < 10,
      isTrue,
    );
    verify(
      textMessageRepository.add(
        textMessage: argThat(equals(message), named: 'textMessage'),
      ),
    );
  });

  test('channel notification', () async {
    init();
    await packetStream.emit(
      FromRadio(
        packet: MeshPacket(
          id: 789,
          channel: 1,
          from: 123241,
          to: TO_CHANNEL,
          decoded: Data(
            portnum: PortNum.TEXT_MESSAGE_APP,
            payload: utf8.encode('abc'),
          ),
        ),
      ),
    );

    verify(
      mockShowNotification.showNotification(
        title: argThat(equals('ABC DEF'), named: 'title'),
        text: argThat(equals('abc'), named: 'text'),
        callbackValue:
            argThat(equals('/chat?channel=1'), named: 'callbackValue'),
      ),
    );
  });

  test('DM notification', () async {
    init();
    await packetStream.emit(
      FromRadio(
        packet: MeshPacket(
          id: 789,
          channel: 1,
          from: 123241,
          to: 90812,
          decoded: Data(
            portnum: PortNum.TEXT_MESSAGE_APP,
            payload: utf8.encode('abc'),
          ),
        ),
      ),
    );

    verify(
      mockShowNotification.showNotification(
        title: anyNamed('title'),
        text: anyNamed('text'),
        callbackValue: argThat(
          equals('/chat?dmNode=123241'),
          named: 'callbackValue',
        ),
      ),
    );
  });

  test('emoji decoding', () async {
    final textMessageReceiverService = init();
    final messageCompleter = Completer<TextMessage>();
    textMessageReceiverService.addMessageListener(
      chatType: const ChannelChat(channel: 1),
      listener: messageCompleter.complete,
    );

    await packetStream.emit(
      FromRadio(
        packet: MeshPacket(
          id: 123,
          channel: 1,
          from: 789,
          to: TO_CHANNEL,
          decoded: Data(
            portnum: PortNum.TEXT_MESSAGE_APP,
            payload: utf8.encode('abc😊'),
          ),
        ),
      ),
    );

    final message = await messageCompleter.future;
    expect(message.text, equals('abc😊'));
  });

  test(
    'channel 2 not receive channel 1 message',
    () async {
      final textMessageReceiverService = init();
      final messageCompleter = Completer<TextMessage>();
      textMessageReceiverService.addMessageListener(
        chatType: const ChannelChat(channel: 2),
        listener: messageCompleter.complete,
      );

      await packetStream.emit(
        FromRadio(
          packet: MeshPacket(
            id: 123,
            channel: 1,
            to: TO_CHANNEL,
            decoded: Data(
              portnum: PortNum.TEXT_MESSAGE_APP,
              payload: utf8.encode('abc'),
            ),
          ),
        ),
      );

      await expectLater(messageCompleter.future, doesNotComplete);
    },
  );

  test('receive DM', () async {
    final textMessageReceiverService = init();
    final messageCompleter = Completer<TextMessage>();
    textMessageReceiverService.addMessageListener(
      chatType: const DirectMessageChat(dmNode: 777),
      listener: messageCompleter.complete,
    );

    await packetStream.emit(
      FromRadio(
        packet: MeshPacket(
          id: 222,
          channel: 1,
          from: 777,
          to: 111,
          decoded: Data(
            portnum: PortNum.TEXT_MESSAGE_APP,
            payload: utf8.encode('xyz'),
          ),
        ),
      ),
    );

    final message = await messageCompleter.future;
    expect(message.text, equals('xyz'));
    expect(message.packetId, equals(222));
    expect(message.channel, equals(1));
    expect(message.from, equals(777));
    expect(message.to, equals(111));
    expect(
      message.time.difference(DateTime.now()).inSeconds.abs() < 10,
      isTrue,
    );
    verify(
      textMessageRepository.add(
        textMessage: argThat(equals(message), named: 'textMessage'),
      ),
    );
  });
}
