import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/models/mesh_radio.dart';
import 'package:meshx/models/radio_connector_state.dart';
import 'package:meshx/providers/radio_connector_service.dart';
import 'package:meshx/providers/tcp/tcp_radio_connector.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../common.dart';
import 'radio_connector_service_test.mocks.dart';

@GenerateMocks([TcpRadioConnector])
void main() {
  late ProviderContainer container;
  late RadioConnectorService radioConnectorService;
  late MockTcpRadioConnector tcpRadioConnector;

  setUp(() {
    tcpRadioConnector = MockTcpRadioConnector();
    container = createContainer(
      overrides: [
        tcpRadioConnectorProvider.overrideWith(
          () => MockTcpRadioConnectorContainer(
            tcpRadioConnector: tcpRadioConnector,
          ),
        ),
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

    final radio = verify(tcpRadioConnector.connect(captureAny)).captured.first
        as TcpMeshRadio;

    expect(radio.remoteId, equals('address'));
  });
}
