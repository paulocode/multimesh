import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multimesh/models/mesh_radio.dart';
import 'package:multimesh/models/radio_connector_state.dart';
import 'package:multimesh/providers/radio_connector_service.dart'
    hide MockRadioConnectorService;
import 'package:multimesh/providers/reconnector.dart';

import '../common.dart';
import 'reconnector_test.mocks.dart';

@GenerateMocks([TcpConnected, TcpMeshRadio, RadioConnectorService])
void main() {
  late ProviderContainer container;
  late MockTcpConnected tcpConnected;
  late MockTcpMeshRadio tcpMeshRadio;
  late MockRadioConnectorService radioConnectorService;

  setUp(() {
    tcpConnected = MockTcpConnected();
    tcpMeshRadio = MockTcpMeshRadio();
    when(tcpConnected.radio).thenReturn(tcpMeshRadio);
    radioConnectorService = MockRadioConnectorService();
    container = createContainer(
      overrides: [
        radioConnectorServiceProvider.overrideWith(
          () => MockRadioConnectorServiceContainer(
            radioConnectorService: radioConnectorService,
          ),
        ),
      ],
    );

    container.read(
      reconnectorServiceProvider(delay: const Duration(seconds: 1)).notifier,
    );
  });

  test('reconnect', () async {
    container.read(radioConnectorServiceProvider.notifier).state = tcpConnected;
    container.read(radioConnectorServiceProvider.notifier).state =
        Disconnected();
    container.read(radioConnectorServiceProvider.notifier).state = tcpConnected;

    verify(radioConnectorService.connect(tcpMeshRadio));
    await Future<void>.delayed(const Duration(seconds: 1));
  });

  test('reconnect again after failure', () async {
    when(radioConnectorService.connect(any)).thenAnswer((_) async {});
    container.read(radioConnectorServiceProvider.notifier).state = tcpConnected;
    container.read(radioConnectorServiceProvider.notifier).state =
        Disconnected();

    await Future<void>.delayed(const Duration(seconds: 3));
    container.read(radioConnectorServiceProvider.notifier).state = tcpConnected;

    verify(radioConnectorService.connect(tcpMeshRadio)).called(equals(3));
    await Future<void>.delayed(const Duration(seconds: 1));
  });

  test('stop reconnecting after success', () async {
    when(radioConnectorService.connect(any)).thenAnswer((_) async {});
    container.read(radioConnectorServiceProvider.notifier).state = tcpConnected;
    container.read(radioConnectorServiceProvider.notifier).state =
        Disconnected();

    await Future<void>.delayed(const Duration(seconds: 3));
    container.read(radioConnectorServiceProvider.notifier).state = tcpConnected;
    await Future<void>.delayed(const Duration(seconds: 3));

    verify(radioConnectorService.connect(tcpMeshRadio)).called(equals(3));
    await Future<void>.delayed(const Duration(seconds: 1));
  });

  test('dont reconnect', () async {
    container.read(radioConnectorServiceProvider.notifier).state = tcpConnected;
    container
        .read(
          reconnectorServiceProvider(delay: const Duration(seconds: 1))
              .notifier,
        )
        .disableReconnectUntilNextDisconnect();

    container.read(radioConnectorServiceProvider.notifier).state =
        Disconnected();

    verifyNever(radioConnectorService.connect(tcpMeshRadio));
  });

  test('reconnect must be reenabled after connection', () async {
    container.read(radioConnectorServiceProvider.notifier).state = tcpConnected;
    container
        .read(
          reconnectorServiceProvider(delay: const Duration(seconds: 1))
              .notifier,
        )
        .disableReconnectUntilNextDisconnect();
    container.read(radioConnectorServiceProvider.notifier).state =
        Disconnected();
    container.read(radioConnectorServiceProvider.notifier).state = tcpConnected;
    container.read(radioConnectorServiceProvider.notifier).state =
        Disconnected();

    verify(radioConnectorService.connect(tcpMeshRadio));
    await Future<void>.delayed(const Duration(seconds: 1));
  });
}
