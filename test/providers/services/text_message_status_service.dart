import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/models/text_message.dart';
import 'package:meshx/models/text_message_status.dart';
import 'package:meshx/protobufs/generated/meshtastic/mesh.pb.dart';
import 'package:meshx/providers/ble/radio_reader.dart';
import 'package:meshx/providers/repository/text_message_repository.dart';
import 'package:meshx/providers/services/text_message_status_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../common.dart';
import '../../mock_stream.dart';
import 'text_message_status_service.mocks.dart';

@GenerateMocks([
  TextMessageRepository,
  RadioReader,
])
void main() {
  late ProviderContainer container;
  late MockTextMessageRepository textMessageRepository;
  late MockRadioReader radioReader;
  late MockStream<FromRadio> mockStream;

  setUp(() {
    textMessageRepository = MockTextMessageRepository();
    when(textMessageRepository.getByPacketId(packetId: 123)).thenAnswer(
      (realInvocation) => Future.value(
        TextMessage(
          text: '',
          channel: 0,
          time: DateTime.now(),
          from: 0,
          to: 0,
          packetId: 123,
        ),
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
  });

  test('initial state', () async {
    await expectLater(
      container.read(textMessageStatusServiceProvider(packetId: 123).future),
      completion(TextMessageStatus.SENDING),
    );
  });

  test('timeout', () async {
    final sub = container.listen(
      textMessageStatusServiceProvider(
        packetId: 123,
        timeout: const Duration(seconds: 5),
      ),
      (_, __) {},
    );

    await Future<void>.delayed(const Duration(seconds: 6));
    await expectLater(
      container.read(
        textMessageStatusServiceProvider(
          packetId: 123,
          timeout: const Duration(seconds: 5),
        ).future,
      ),
      completion(TextMessageStatus.RADIO_ERROR),
    );
  });
}
