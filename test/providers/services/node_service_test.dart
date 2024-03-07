import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/protobufs/generated/meshtastic/mesh.pb.dart';
import 'package:meshx/providers/ble/radio_reader.dart';
import 'package:meshx/providers/services/node_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../common.dart';
import '../../mock_stream.dart';
import 'node_service_test.mocks.dart';

@GenerateMocks([
  RadioReader,
])
void main() {
  late ProviderContainer container;
  late MockRadioReader radioReader;
  late MockStream<FromRadio> stream;

  setUp(() {
    stream = MockStream();
    radioReader = MockRadioReader();
    when(radioReader.onPacketReceived()).thenAnswer((_) => stream);
    container = createContainer(
      overrides: [radioReaderProvider.overrideWith((ref) => radioReader)],
    );
    // eagerly initialize to start accepting packets
    container.read(nodeServiceProvider);
  });

  test('nodes initially empty', () async {
    final nodes = container.read(nodeServiceProvider);

    expect(nodes, isEmpty);
  });

  test('add node', () async {
    await stream.emit(
      FromRadio(
        nodeInfo: NodeInfo(
          num: 123,
          user: User(
            longName: 'XYZ node',
            shortName: 'XYZ',
          ),
        ),
      ),
    );

    final nodes = container.read(nodeServiceProvider);
    await expectLater(nodes[123]?.nodeNum, equals(123));
    expect(nodes[123]?.shortName, equals('XYZ'));
    expect(nodes[123]?.longName, equals('XYZ node'));
  });

  test('add 2 nodes', () async {
    await stream.emit(
      FromRadio(
        nodeInfo: NodeInfo(
          num: 123,
          user: User(
            longName: 'XYZ node',
            shortName: 'XYZ',
          ),
        ),
      ),
    );

    await stream.emit(
      FromRadio(
        nodeInfo: NodeInfo(
          num: 456,
          user: User(
            longName: 'UVW node',
            shortName: 'UVW',
          ),
        ),
      ),
    );

    final nodes = container.read(nodeServiceProvider);
    expect(nodes[123]?.nodeNum, equals(123));
    expect(nodes[123]?.shortName, equals('XYZ'));
    expect(nodes[123]?.longName, equals('XYZ node'));
    expect(nodes[456]?.nodeNum, equals(456));
    expect(nodes[456]?.shortName, equals('UVW'));
    expect(nodes[456]?.longName, equals('UVW node'));
  });
}
