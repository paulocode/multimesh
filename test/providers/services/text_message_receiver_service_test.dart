import 'dart:async';
import 'dart:convert';

import 'package:meshx/constants/ble_constants.dart';
import 'package:meshx/models/chat_type.dart';
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

import '../../mock_stream.dart';
import 'text_message_receiver_service_test.mocks.dart';

@GenerateMocks([
  TextMessageRepository,
  RadioReader,
])
void main() {
  late MockTextMessageRepository textMessageRepository;
  late MockRadioReader radioReader;
  late MockStream<FromRadio> packetStream;

  setUp(() {
    packetStream = MockStream();
    textMessageRepository = MockTextMessageRepository();
    when(textMessageRepository.add(textMessage: anyNamed('textMessage')))
        .thenAnswer((realInvocation) => Future.value(456));
    radioReader = MockRadioReader();
    when(radioReader.onPacketReceived()).thenAnswer((_) => packetStream);
  });

  TextMessageReceiverService init({bool configDownloaded = true}) {
    return TextMessageReceiverService(
      textMessageRepository: textMessageRepository,
      radioReader: radioReader,
      // TODO
      nodes: {},
      configDownloaded: configDownloaded,
      myNodeNum: 111,
      // TODO
      showNotification: (title, text, callbackValue) async {},
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
}
