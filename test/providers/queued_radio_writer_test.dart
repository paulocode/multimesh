import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multimesh/models/mesh_radio.dart';
import 'package:multimesh/models/radio_connector_state.dart';
import 'package:multimesh/providers/queued_radio_writer.dart';
import 'package:multimesh/providers/radio_connector_service.dart';
import 'package:multimesh/providers/radio_reader.dart';
import 'package:multimesh/providers/radio_writer.dart';
import 'package:multimesh/services/interfaces/radio_reader.dart';
import 'package:multimesh/services/interfaces/radio_writer.dart';
import 'package:multimesh/services/null/null_reader.dart';
import 'package:multimesh/services/null/null_writer.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../common.dart';
import '../mock_stream.dart';
import 'queued_radio_writer_test.mocks.dart';

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
      container.read(queuedRadioWriterProvider);
    });

    test('new connection & new radio', () {
      final writer = container.read(queuedRadioWriterProvider);
      container.read(radioConnectorServiceProvider.notifier).state =
          TcpConnected(
        socket: MockSocket(),
        recvStream: MockStream(),
        radio: TcpMeshRadio(address: 'address'),
        isNewRadio: true,
      );

      final newWriter = container.read(queuedRadioWriterProvider);

      expect(writer, isNot(equals(newWriter)));
    });

    test('new connection but same radio', () {
      final writer = container.read(queuedRadioWriterProvider);
      container.read(radioConnectorServiceProvider.notifier).state =
          TcpConnected(
        socket: MockSocket(),
        recvStream: MockStream(),
        radio: TcpMeshRadio(address: 'address'),
        isNewRadio: false, // ignore: avoid_redundant_argument_values
      );

      final newWriter = container.read(queuedRadioWriterProvider);
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
      container.read(queuedRadioWriterProvider);
      container.invalidate(radioReaderProvider);
      final newReader = container.read(radioReaderProvider);
      verify(newReader.onPacketReceived());
    });

    test('new writer', () async {
      container.read(queuedRadioWriterProvider);
      container.invalidate(radioWriterProvider);
      await container
          .read(queuedRadioWriterProvider)
          .sendWantConfig(wantConfigId: 123);
      final newWriter = container.read(radioWriterProvider) as MockRadioWriter;
      verify(newWriter.write(any));
    });
  });
}
