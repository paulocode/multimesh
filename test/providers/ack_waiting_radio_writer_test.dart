import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multimesh/models/mesh_radio.dart';
import 'package:multimesh/models/radio_connector_state.dart';
import 'package:multimesh/providers/ack_waiting_radio_writer.dart';
import 'package:multimesh/providers/radio_connector_service.dart';
import 'package:multimesh/providers/radio_reader.dart';
import 'package:multimesh/providers/radio_writer.dart';
import 'package:multimesh/services/interfaces/radio_reader.dart';
import 'package:multimesh/services/interfaces/radio_writer.dart';
import 'package:multimesh/services/null/null_reader.dart';
import 'package:multimesh/services/null/null_writer.dart';

import '../common.dart';
import '../mock_stream.dart';

import 'ack_waiting_radio_writer_test.mocks.dart';

@GenerateMocks([Socket, RadioWriter, RadioReader])
void main() {
  group('tests for returned writer', () {
    late ProviderContainer container;
    setUp(() {
      container = createContainer(
        overrides: [
          radioConnectorServiceProvider
              .overrideWith(MockRadioConnectorService.new),
          radioWriterProvider.overrideWith((_) => NullWriter()),
          radioReaderProvider
              .overrideWith((_) => NullReader(onDispose: (_) {})),
        ],
      );
    });
    test('init', () {
      container.read(ackWaitingRadioWriterProvider);
    });

    test('new connection & new radio', () {
      final writer = container.read(ackWaitingRadioWriterProvider);
      container.read(radioConnectorServiceProvider.notifier).state =
          TcpConnected(
        socket: MockSocket(),
        recvStream: MockStream(),
        radio: TcpMeshRadio(address: 'address'),
        isNewRadio: true,
      );

      final newWriter = container.read(ackWaitingRadioWriterProvider);

      expect(writer, isNot(equals(newWriter)));
    });

    test('new connection but same radio', () {
      final writer = container.read(ackWaitingRadioWriterProvider);
      container.read(radioConnectorServiceProvider.notifier).state =
          TcpConnected(
        socket: MockSocket(),
        recvStream: MockStream(),
        radio: TcpMeshRadio(address: 'address'),
        isNewRadio: false, // ignore: avoid_redundant_argument_values
      );

      final newWriter = container.read(ackWaitingRadioWriterProvider);
      expect(writer, equals(newWriter));
    });
  });

  group('test for listeners that mutate the writer', () {
    late ProviderContainer container;
    late MockRadioReader radioReader;
    setUp(() {
      container = createContainer(
        overrides: [
          radioConnectorServiceProvider
              .overrideWith(MockRadioConnectorService.new),
          radioWriterProvider.overrideWith((_) {
            return MockRadioWriter();
          }),
          radioReaderProvider.overrideWith((_) {
            radioReader = MockRadioReader();
            when(radioReader.onPacketReceived())
                .thenAnswer((_) => MockStream());
            return radioReader;
          }),
        ],
      );
    });

    test('new reader', () {
      container.read(ackWaitingRadioWriterProvider);
      container.invalidate(radioReaderProvider);
      final newReader = container.read(radioReaderProvider);
      verify(newReader.onPacketReceived());
    });

    test('new writer', () async {
      container.read(ackWaitingRadioWriterProvider);
      container.invalidate(radioWriterProvider);
      await container
          .read(ackWaitingRadioWriterProvider)
          .sendWantConfig(wantConfigId: 123);
      final newWriter = container.read(radioWriterProvider) as MockRadioWriter;
      verify(newWriter.write(any));
    });
  });
}
