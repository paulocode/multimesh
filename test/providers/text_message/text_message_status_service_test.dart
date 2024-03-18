import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/models/text_message.dart';
import 'package:meshx/models/text_message_status.dart';
import 'package:meshx/protobufs/generated/meshtastic/mesh.pb.dart';
import 'package:meshx/protobufs/generated/meshtastic/portnums.pb.dart';
import 'package:meshx/providers/radio_reader.dart';
import 'package:meshx/providers/repository/text_message_repository.dart';
import 'package:meshx/providers/text_message/text_message_status_service.dart';
import 'package:meshx/repository/text_message_repository.dart';
import 'package:meshx/services/interfaces/radio_reader.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

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
  late ProviderSubscription<Future<TextMessageStatus>> statusSubscription;
  final textMessage = TextMessage(
    text: '',
    channel: 0,
    time: DateTime.now(),
    from: 0,
    to: 0,
    packetId: 123,
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
        textMessage: textMessage,
      ).future,
      (_, __) {},
    );
  });

  test('initial state', () async {
    await expectLater(
      statusSubscription.read(),
      completion(TextMessageStatus.SENDING),
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
        textMessage: okTextMessage,
      ).future,
      (_, __) {},
    );
    await expectLater(
      subscription.read(),
      completion(TextMessageStatus.OK),
    );
  });

  test('timeout', () async {
    final timedSubscription = container.listen(
      textMessageStatusServiceProvider(
        textMessage: textMessage,
        timeout: const Duration(seconds: 5),
      ).future,
      (_, __) {},
    );

    await Future<void>.delayed(const Duration(seconds: 6));
    await expectLater(
      timedSubscription.read(),
      completion(TextMessageStatus.RADIO_ERROR),
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

    await expectLater(
      statusSubscription.read(),
      completion(TextMessageStatus.OK),
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
      completion(TextMessageStatus.SENDING),
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
      completion(TextMessageStatus.MAX_RETRANSMIT),
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
      completion(TextMessageStatus.RADIO_ERROR),
    );
  });
}
