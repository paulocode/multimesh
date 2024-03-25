import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multimesh/models/ble_characteristics.dart';
import 'package:multimesh/models/mesh_radio.dart';
import 'package:multimesh/models/radio_connector_state.dart';
import 'package:multimesh/providers/radio_connector_service.dart';
import 'package:multimesh/providers/radio_writer.dart';
import 'package:multimesh/services/ble/ble_radio_writer.dart';
import 'package:multimesh/services/null/null_writer.dart';
import 'package:multimesh/services/tcp/tcp_radio_writer.dart';

import '../common.dart';
import '../mock_stream.dart';
import 'radio_writer_test.mocks.dart';

@GenerateMocks(
  [BluetoothCharacteristic, Socket, BleConnected, BleCharacteristics],
)
void main() {
  late ProviderContainer container;

  setUp(() {
    container = createContainer(
      overrides: [
        radioConnectorServiceProvider
            .overrideWith(MockRadioConnectorService.new),
      ],
    );
  });

  test('disconnected', () {
    container.read(radioConnectorServiceProvider.notifier).state =
        Disconnected();

    final state = container.read(radioWriterProvider);

    expect(state, isA<NullWriter>());
  });

  test('tcp connection', () {
    final socket = MockSocket(); // ignore: close_sinks
    container.read(radioConnectorServiceProvider.notifier).state = TcpConnected(
      socket: socket,
      recvStream: MockStream(),
      radio: TcpMeshRadio(address: 'address'),
    );

    final state = container.read(radioWriterProvider);

    expect(state, isA<TcpRadioWriter>());
  });

  test('ble connection', () {
    final toRadio = MockBluetoothCharacteristic();
    final bleCharacteristics = MockBleCharacteristics();
    final connectorState = MockBleConnected();
    when(connectorState.bleCharacteristics).thenReturn(bleCharacteristics);
    when(bleCharacteristics.toRadio).thenReturn(toRadio);
    container.read(radioConnectorServiceProvider.notifier).state =
        connectorState;

    final state = container.read(radioWriterProvider);

    expect(state, isA<BleRadioWriter>());
  });
}
