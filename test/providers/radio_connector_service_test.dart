import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/models/mesh_radio.dart';
import 'package:meshx/models/radio_connector_state.dart';
import 'package:meshx/providers/radio_connector_service.dart';
import 'package:meshx/providers/tcp/tcp_radio_connector.dart';
import 'package:mockito/mockito.dart';

import '../common.dart';


void main() {
  late ProviderContainer container;
  late RadioConnectorService radioConnectorService;

  setUp(() {
    container = createContainer(
      overrides: [
        tcpRadioConnectorProvider.overrideWith(MockTcpRadioConnector.new),
      ],
    );
    radioConnectorService =
        container.read(radioConnectorServiceProvider.notifier);
  });

  test('init', () {
    final state = container.read(radioConnectorServiceProvider);
    expect(state, isA<Disconnected>());
  });

  test('tcp connect', () async {
    await radioConnectorService.connect(TcpMeshRadio(address: 'address'));
    final tcpRadioConnector = container.read(tcpRadioConnectorProvider.notifier) as MockTcpRadioConnector;

    final radio = verify(tcpRadioConnector.connect(captureAny)).captured.first as TcpMeshRadio;

    expect(radio.remoteId, equals('address'));
  });
}
