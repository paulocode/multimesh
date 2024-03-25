import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multimesh/models/mesh_radio.dart';
import 'package:multimesh/models/radio_connector_state.dart';
import 'package:multimesh/providers/ble/ble_radio_connector.dart';
import 'package:multimesh/providers/radio_connector_service.dart';
import 'package:multimesh/providers/tcp/tcp_radio_connector.dart';

import '../common.dart';
import '../mock_stream.dart';
import 'radio_connector_service_test.mocks.dart';

@GenerateMocks(
  [TcpRadioConnector, BleRadioConnector, BluetoothDevice, Socket],
)
void main() {
  late ProviderContainer container;
  late RadioConnectorService radioConnectorService;
  late MockTcpRadioConnector tcpRadioConnector;
  late MockBleRadioConnector bleRadioConnector;

  setUp(() {
    tcpRadioConnector = MockTcpRadioConnector();
    bleRadioConnector = MockBleRadioConnector();
    container = createContainer(
      overrides: [
        tcpRadioConnectorProvider.overrideWith(
          () => MockTcpRadioConnectorContainer(
            tcpRadioConnector: tcpRadioConnector,
          ),
        ),
        bleRadioConnectorProvider.overrideWith(
          () => MockBleRadioConnectorContainer(
            bleRadioConnector: bleRadioConnector,
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
    final radio = TcpMeshRadio(address: 'address');

    await radioConnectorService.connect(radio);

    final capturedRadio = verify(tcpRadioConnector.connect(captureAny))
        .captured
        .first as TcpMeshRadio;
    expect(radio, equals(capturedRadio));
  });

  test('ble connect', () async {
    final device = MockBluetoothDevice();
    when(device.remoteId).thenReturn(const DeviceIdentifier('device'));
    final radio = BleMeshRadio(device: device);

    await radioConnectorService.connect(radio);

    final capturedRadio = verify(bleRadioConnector.connect(captureAny))
        .captured
        .first as BleMeshRadio;
    expect(radio, equals(capturedRadio));
  });

  test('same radio reconnect', () async {
    when(tcpRadioConnector.disconnect()).thenAnswer((realInvocation) async {
      container.read(tcpRadioConnectorProvider.notifier).state = Disconnected();
    });
    when(tcpRadioConnector.connect(any)).thenAnswer((realInvocation) async {
      final radio = realInvocation.positionalArguments[0] as TcpMeshRadio;
      container.read(tcpRadioConnectorProvider.notifier).state = TcpConnected(
        socket: MockSocket(),
        recvStream: MockStream<List<int>>(),
        radio: radio,
      );
    });

    // radioConnectorService will rebuild at each step so keep it them here
    await container
        .read(radioConnectorServiceProvider.notifier)
        .connect(TcpMeshRadio(address: 'address1'));
    await container.read(radioConnectorServiceProvider.notifier).disconnect();
    await container
        .read(radioConnectorServiceProvider.notifier)
        .connect(TcpMeshRadio(address: 'address1'));

    final state = container.read(radioConnectorServiceProvider) as Connected;
    expect(state.isNewRadio, isFalse);
  });

  test('different radio reconnect', () async {
    when(tcpRadioConnector.disconnect()).thenAnswer((_) async {
      container.read(tcpRadioConnectorProvider.notifier).state = Disconnected();
    });
    when(tcpRadioConnector.connect(any)).thenAnswer((realInvocation) async {
      final radio = realInvocation.positionalArguments[0] as TcpMeshRadio;
      container.read(tcpRadioConnectorProvider.notifier).state = TcpConnected(
        socket: MockSocket(),
        recvStream: MockStream<List<int>>(),
        radio: radio,
      );
    });

    // radioConnectorService will rebuild at each step so keep reading it here
    await container
        .read(radioConnectorServiceProvider.notifier)
        .connect(TcpMeshRadio(address: 'address1'));
    await container.read(radioConnectorServiceProvider.notifier).disconnect();
    await container
        .read(radioConnectorServiceProvider.notifier)
        .connect(TcpMeshRadio(address: 'address2'));

    final state = container.read(radioConnectorServiceProvider) as Connected;
    expect(state.isNewRadio, isTrue);
  });

  test('reflect state of selected connector', () async {
    when(tcpRadioConnector.connect(any)).thenAnswer((_) async {});
    container.read(tcpRadioConnectorProvider.notifier).state = Disconnected();

    // radioConnectorService will rebuild at each step so keep reading it here
    await container
        .read(radioConnectorServiceProvider.notifier)
        .connect(TcpMeshRadio(address: 'address'));
    container.read(tcpRadioConnectorProvider.notifier).state =
        Connecting(radio: TcpMeshRadio(address: 'address'));
    expect(
      container.read(tcpRadioConnectorProvider),
      isInstanceOf<Connecting>(),
    );
    container.read(tcpRadioConnectorProvider.notifier).state = TcpConnected(
      socket: MockSocket(),
      recvStream: MockStream<List<int>>(),
      radio: TcpMeshRadio(address: 'address'),
    );
    expect(
      container.read(tcpRadioConnectorProvider),
      isInstanceOf<TcpConnected>(),
    );
    container.read(tcpRadioConnectorProvider.notifier).state = Disconnected();
    expect(
      container.read(tcpRadioConnectorProvider),
      isInstanceOf<Disconnected>(),
    );
  });

  test('disconnect must forward call', () async {
    when(tcpRadioConnector.connect(any)).thenAnswer((_) async {});
    when(tcpRadioConnector.disconnect()).thenAnswer((_) async {});
    await radioConnectorService.connect(TcpMeshRadio(address: 'address'));

    await radioConnectorService.disconnect(errorMsg: 'abc');

    verify(tcpRadioConnector.disconnect(errorMsg: 'abc'));
  });
}
