import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/protobufs/generated/meshtastic/mesh.pb.dart';
import 'package:meshx/protobufs/generated/meshtastic/portnums.pb.dart';
import 'package:meshx/providers/node_service.dart';
import 'package:meshx/providers/radio_reader.dart';
import 'package:meshx/services/interfaces/radio_reader.dart';
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
          channel: 3,
          num: 123,
          user: User(
            id: '!123',
            longName: 'XYZ node',
            shortName: 'XYZ',
          ),
        ),
      ),
    );

    final nodes = container.read(nodeServiceProvider);
    expect(nodes[123]?.nodeNum, equals(123));
    expect(nodes[123]?.shortName, equals('XYZ'));
    expect(nodes[123]?.longName, equals('XYZ node'));
    expect(nodes[123]?.channel, equals(3));
  });

  test('add node from NODEINFO_APP', () async {
    await stream.emit(
      FromRadio(
        packet: MeshPacket(
          channel: 1,
          from: 123,
          decoded: Data(
            portnum: PortNum.NODEINFO_APP,
            payload: User(
              id: '!123',
              longName: 'XYZ node',
              shortName: 'XYZ',
            ).writeToBuffer(),
          ),
        ),
      ),
    );

    final nodes = container.read(nodeServiceProvider);
    expect(nodes[123]?.nodeNum, equals(123));
    expect(nodes[123]?.shortName, equals('XYZ'));
    expect(nodes[123]?.longName, equals('XYZ node'));
    expect(nodes[123]?.channel, equals(1));
  });

  test('add node from NODEINFO_APP, replace old node if same nodenum',
      () async {
    await stream.emit(
      FromRadio(
        packet: MeshPacket(
          channel: 1,
          from: 123,
          decoded: Data(
            portnum: PortNum.NODEINFO_APP,
            payload: User(
              id: '!123',
              shortName: 'XYZ',
            ).writeToBuffer(),
          ),
        ),
      ),
    );

    await stream.emit(
      FromRadio(
        packet: MeshPacket(
          channel: 1,
          from: 123,
          decoded: Data(
            portnum: PortNum.NODEINFO_APP,
            payload: User(
              id: '!123',
              shortName: 'ABC',
            ).writeToBuffer(),
          ),
        ),
      ),
    );

    final nodes = container.read(nodeServiceProvider);
    expect(nodes[123]?.nodeNum, equals(123));
    expect(nodes[123]?.shortName, equals('ABC'));
  });

  test('blank node', () async {
    await stream.emit(
      FromRadio(
        nodeInfo: NodeInfo(
          num: 123,
          channel: 2,
        ),
      ),
    );

    final nodes = container.read(nodeServiceProvider);
    expect(nodes[123]?.nodeNum, equals(123));
    expect(nodes[123]?.shortName, equals('007b'));
    expect(nodes[123]?.longName, equals('Meshtastic 007b'));
    expect(nodes[123]?.channel, equals(2));
  });

  test('add 2 nodes', () async {
    await stream.emit(
      FromRadio(
        nodeInfo: NodeInfo(
          channel: 1,
          num: 123,
          user: User(
            id: '!123',
            longName: 'XYZ node',
            shortName: 'XYZ',
          ),
        ),
      ),
    );

    await stream.emit(
      FromRadio(
        nodeInfo: NodeInfo(
          channel: 2,
          num: 456,
          user: User(
            id: '!123',
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
    expect(nodes[123]?.channel, equals(1));
    expect(nodes[456]?.nodeNum, equals(456));
    expect(nodes[456]?.shortName, equals('UVW'));
    expect(nodes[456]?.longName, equals('UVW node'));
    expect(nodes[456]?.channel, equals(2));
  });
}
