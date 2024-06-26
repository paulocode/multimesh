import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multimesh/models/text_message.dart';
import 'package:multimesh/models/text_message_status.dart';
import 'package:multimesh/protobufs/generated/meshtastic/mesh.pb.dart';
import 'package:multimesh/protobufs/generated/meshtastic/portnums.pb.dart';
import 'package:multimesh/providers/radio_reader.dart';
import 'package:multimesh/providers/repository/text_message_repository.dart';
import 'package:multimesh/providers/text_message/text_message_status_service.dart';
import 'package:multimesh/repository/text_message_repository.dart';
import 'package:multimesh/services/interfaces/radio_reader.dart';

import '../../common.dart';
import '../../mock_stream.dart';
import 'text_message_status_service_test.mocks.dart';

@GenerateMocks([
  TextMessageRepository,
  RadioReader,
])
void main() {
  late ProviderContainer container;
  late MockTextMessageRepository textMessageRepository;
  late MockRadioReader radioReader;
  late MockStream<FromRadio> mockStream;
  late ProviderSubscription<Future<TextMessage>> statusSubscription;
  final textMessage = TextMessage(
    text: '',
    channel: 0,
    time: DateTime.now(),
    from: 0,
    to: 0,
    packetId: 123,
    owner: 0,
  );

  setUp(() {
    textMessageRepository = MockTextMessageRepository();
    when(textMessageRepository.getByPacketId(packetId: 123)).thenAnswer(
      (realInvocation) => Future.value(
        textMessage,
      ),
    );
    mockStream = MockStream<FromRadio>();
    radioReader = MockRadioReader();
    when(radioReader.onPacketReceived()).thenAnswer((_) => mockStream);
    container = createContainer(
      overrides: [
        textMessageRepositoryProvider
            .overrideWith((ref) => textMessageRepository),
        radioReaderProvider.overrideWith((ref) => radioReader),
      ],
    );
    statusSubscription = container.listen(
      textMessageStatusServiceProvider(
        packetId: textMessage.packetId,
      ).future,
      (_, __) {},
    );
  });

  test('initial state', () async {
    await expectLater(
      statusSubscription.read(),
      completion(
        stateEquals(TextMessageStatus.SENDING),
      ),
    );
  });

  test('finished states must return the same state', () async {
    final okTextMessage =
        textMessage.copyWith(packetId: 456, state: TextMessageStatus.OK);
    when(textMessageRepository.getByPacketId(packetId: 456)).thenAnswer(
      (realInvocation) => Future.value(
        okTextMessage,
      ),
    );

    final subscription = container.listen(
      textMessageStatusServiceProvider(
        packetId: okTextMessage.packetId,
      ).future,
      (_, __) {},
    );
    await expectLater(
      subscription.read(),
      completion(
        stateEquals(TextMessageStatus.OK),
      ),
    );
  });

  test('timeout', () async {
    final timedSubscription = container.listen(
      textMessageStatusServiceProvider(
        packetId: textMessage.packetId,
        timeout: const Duration(seconds: 5),
      ).future,
      (_, __) {},
    );

    await Future<void>.delayed(const Duration(seconds: 6));
    await expectLater(
      timedSubscription.read(),
      completion(
        stateEquals(TextMessageStatus.RADIO_ERROR),
      ),
    );
  });

  test('recvd by radio', () async {
    await untilCalled(radioReader.onPacketReceived())
        .timeout(const Duration(seconds: 1));
    await mockStream.emit(
      FromRadio(
        queueStatus: QueueStatus(meshPacketId: 123),
      ),
    );

    await expectLater(
      statusSubscription.read(),
      completion(
        stateEquals(TextMessageStatus.RECVD_BY_RADIO),
      ),
    );
  });

  test('acknowledged', () async {
    await untilCalled(radioReader.onPacketReceived())
        .timeout(const Duration(seconds: 1));
    await mockStream.emit(
      FromRadio(
        packet: MeshPacket(
          decoded: Data(
            requestId: 123,
            portnum: PortNum.ROUTING_APP,
            payload: Routing(
              errorReason: Routing_Error.NONE,
            ).writeToBuffer(),
          ),
        ),
      ),
    );

    verify(
      textMessageRepository.updateStatusByPacketId(
        status: TextMessageStatus.OK,
        packetId: 123,
      ),
    );
  });

  test('ignore acknowledge of different packet', () async {
    await untilCalled(radioReader.onPacketReceived())
        .timeout(const Duration(seconds: 1));
    await mockStream.emit(
      FromRadio(
        packet: MeshPacket(
          decoded: Data(
            requestId: 1234,
            portnum: PortNum.ROUTING_APP,
            payload: Routing(
              errorReason: Routing_Error.NONE,
            ).writeToBuffer(),
          ),
        ),
      ),
    );

    await expectLater(
      statusSubscription.read(),
      completion(
        stateEquals(TextMessageStatus.SENDING),
      ),
    );
  });

  test('max retransmit', () async {
    await untilCalled(radioReader.onPacketReceived())
        .timeout(const Duration(seconds: 1));
    await mockStream.emit(
      FromRadio(
        packet: MeshPacket(
          decoded: Data(
            requestId: 123,
            portnum: PortNum.ROUTING_APP,
            payload: Routing(
              errorReason: Routing_Error.MAX_RETRANSMIT,
            ).writeToBuffer(),
          ),
        ),
      ),
    );

    await expectLater(
      statusSubscription.read(),
      completion(
        stateEquals(TextMessageStatus.RADIO_ERROR),
      ),
    );
  });

  test('all other error cases', () async {
    await untilCalled(radioReader.onPacketReceived())
        .timeout(const Duration(seconds: 1));
    await mockStream.emit(
      FromRadio(
        packet: MeshPacket(
          decoded: Data(
            requestId: 123,
            portnum: PortNum.ROUTING_APP,
            payload: Routing(
              errorReason: Routing_Error.BAD_REQUEST,
            ).writeToBuffer(),
          ),
        ),
      ),
    );

    await expectLater(
      statusSubscription.read(),
      completion(
        stateEquals(TextMessageStatus.RADIO_ERROR),
      ),
    );
  });
}

Matcher stateEquals(TextMessageStatus expected) =>
    predicate<TextMessage>((s) => s.state == expected);
