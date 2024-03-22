import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/models/ble_characteristics.dart';
import 'package:meshx/models/radio_connector_state.dart';
import 'package:meshx/providers/radio_connector_service.dart';
import 'package:meshx/providers/radio_reader.dart';
import 'package:meshx/services/ble/ble_radio_reader.dart';
import 'package:meshx/services/null/null_reader.dart';
import 'package:meshx/services/tcp/tcp_radio_reader.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../common.dart';
import '../mock_stream.dart';
import 'radio_reader_test.mocks.dart';

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

    final state = container.read(radioReaderProvider);

    expect(state, isA<NullReader>());
  });

  test('rebuild on connect state', () {
    container.read(radioConnectorServiceProvider.notifier).state = TcpConnected(
      socket: MockSocket(),
      recvStream: MockStream(),
      radioId: 'radioId',
    );
    final state1 = container.read(radioReaderProvider);
    container.read(radioConnectorServiceProvider.notifier).state =
        Disconnected();
    container.read(radioConnectorServiceProvider.notifier).state = TcpConnected(
      socket: MockSocket(),
      recvStream: MockStream(),
      radioId: 'radioId',
    );
    final state2 = container.read(radioReaderProvider);

    expect(state1, isNot(equals(state2)));
  });

  test(' dont rebuild on disconnect state', () {
    container.read(radioConnectorServiceProvider.notifier).state = TcpConnected(
      socket: MockSocket(),
      recvStream: MockStream(),
      radioId: 'radioId',
    );
    final state1 = container.read(radioReaderProvider);
    container.read(radioConnectorServiceProvider.notifier).state =
        Disconnected();
    final state2 = container.read(radioReaderProvider);

    expect(state1, equals(state2));
  });

  test('tcp connection', () {
    container.read(radioConnectorServiceProvider.notifier).state = TcpConnected(
      socket: MockSocket(),
      recvStream: MockStream(),
      radioId: 'radioId',
    );

    final state = container.read(radioReaderProvider);

    expect(state, isA<TcpRadioReader>());
  });

  test('ble connection', () {
    final toRadio = MockBluetoothCharacteristic();
    final fromNum = MockBluetoothCharacteristic();
    final bleCharacteristics = MockBleCharacteristics();
    final connectorState = MockBleConnected();
    when(connectorState.bleCharacteristics).thenReturn(bleCharacteristics);
    when(bleCharacteristics.toRadio).thenReturn(toRadio);
    when(bleCharacteristics.fromNum).thenReturn(fromNum);
    when(fromNum.onValueReceived).thenAnswer((_) => MockStream());
    when(fromNum.setNotifyValue(true)).thenAnswer((_) => Future.value(true));

    container.read(radioConnectorServiceProvider.notifier).state =
        connectorState;

    final state = container.read(radioReaderProvider);

    expect(state, isA<BleRadioReader>());
  });
}
