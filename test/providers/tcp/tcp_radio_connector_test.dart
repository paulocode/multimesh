import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/constants/meshtastic_constants.dart';
import 'package:meshx/models/mesh_radio.dart';
import 'package:meshx/models/radio_connector_state.dart';
import 'package:meshx/providers/tcp/tcp_radio_connector.dart';
import 'package:meshx/providers/wrap/socket.dart';
import 'package:meshx/services/wrap/socket_mockable.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../common.dart';
import 'tcp_radio_connector_test.mocks.dart';

@GenerateMocks([SocketMockable, Socket, StreamSubscription])
void main() {
  late ProviderContainer container;
  late TcpRadioConnector tcpRadioConnector;
  late MockSocketMockable socketMockable;
  late MockStreamSubscription<Uint8List> socketListener;
  late MockSocket socket; // ignore: close_sinks
  setUp(() {
    socketMockable = MockSocketMockable();
    socket = MockSocket();
    socketListener = MockStreamSubscription();
    when(
      socket.listen(
        any,
        onError: anyNamed('onError'),
        onDone: anyNamed('onDone'),
      ),
    ).thenReturn(socketListener);
    when(socket.close()).thenAnswer((_) => Future.value());
    when(socket.asBroadcastStream()).thenAnswer((_) => socket);
    container = createContainer(
      overrides: [
        socketProvider.overrideWith((ref) => socketMockable),
      ],
    );

    tcpRadioConnector = container.read(tcpRadioConnectorProvider.notifier);
  });

  test('initial state', () async {
    final state = container.read(tcpRadioConnectorProvider);
    expect(state, isInstanceOf<Disconnected>());
  });

  test('connecting', () async {
    when(socketMockable.connect('address', 4403, timeout: anyNamed('timeout')))
        .thenAnswer((_) => Future.value(socket));

    unawaited(tcpRadioConnector.connect(TcpMeshRadio(address: 'address')));

    await untilCalled(
      socketMockable.connect(any, any, timeout: anyNamed('timeout')),
    );
    final state = container.read(tcpRadioConnectorProvider);
    expect(state, isInstanceOf<Connecting>());
  });

  test('connected', () async {
    when(socketMockable.connect('address', 4403, timeout: anyNamed('timeout')))
        .thenAnswer((_) => Future.value(socket));

    await tcpRadioConnector.connect(TcpMeshRadio(address: 'address'));

    final state = container.read(tcpRadioConnectorProvider);
    expect(state, isInstanceOf<Connected>());
  });

  test('dispose after connection', () async {
    when(socketMockable.connect('address', 4403, timeout: anyNamed('timeout')))
        .thenAnswer((_) => Future.value(socket));

    await tcpRadioConnector.connect(TcpMeshRadio(address: 'address'));

    container.dispose();
    verify(socket.close());
  });

  test('wake up bytes', () async {
    when(socketMockable.connect('address', 4403, timeout: anyNamed('timeout')))
        .thenAnswer((_) => Future.value(socket));

    await tcpRadioConnector.connect(TcpMeshRadio(address: 'address'));

    verify(
      socket.add([
        MESHTASTIC_STREAM_START1,
        MESHTASTIC_STREAM_START1,
        MESHTASTIC_STREAM_START1,
        MESHTASTIC_STREAM_START1,
      ]),
    );
  });

  test('connection error', () async {
    when(socketMockable.connect('address', 4403, timeout: anyNamed('timeout')))
        .thenThrow(const SocketException('404'));

    await tcpRadioConnector.connect(TcpMeshRadio(address: 'address'));
    final state = container.read(tcpRadioConnectorProvider) as ConnectionError;
    expect(state.msg, equals('404'));
    expect(state.radioId, equals('address'));
  });

  test('unknown error', () async {
    when(socketMockable.connect('address', 4403, timeout: anyNamed('timeout')))
        .thenThrow(Exception('404'));

    await tcpRadioConnector.connect(TcpMeshRadio(address: 'address'));
    final state = container.read(tcpRadioConnectorProvider) as ConnectionError;
    expect(state.msg, 'Unknown error');
    expect(state.radioId, equals('address'));
  });

  test('disconnect', () async {
    when(socketMockable.connect('address', 4403, timeout: anyNamed('timeout')))
        .thenAnswer((_) => Future.value(socket));
    await tcpRadioConnector.connect(TcpMeshRadio(address: 'address'));

    await tcpRadioConnector.disconnect();

    final state = container.read(tcpRadioConnectorProvider);
    expect(state, isInstanceOf<Disconnected>());
    verify(socket.close());
    verify(socketListener.cancel());
  });

  test('socket error', () async {
    final completer = Completer<void Function(dynamic)>();
    when(socketMockable.connect('address', 4403, timeout: anyNamed('timeout')))
        .thenAnswer((_) => Future.value(socket));
    when(
      socket.listen(
        any,
        onError: anyNamed('onError'),
        onDone: anyNamed('onDone'),
      ),
    ).thenAnswer((realInvocation) {
      final callback = realInvocation.namedArguments[const Symbol('onError')];
      completer.complete(
        callback as void Function(dynamic),
      );
      return socketListener;
    });

    await tcpRadioConnector.connect(TcpMeshRadio(address: 'address'));
    final callback = await completer.future.timeout(const Duration(seconds: 1));
    callback(dynamic);

    await untilCalled(socket.close());
    await container.pump();
    final state = container.read(tcpRadioConnectorProvider);
    expect(state, isInstanceOf<Disconnected>());
    verify(socketListener.cancel());
  });

  test('socket done', () async {
    final completer = Completer<void Function()>();
    when(socketMockable.connect('address', 4403, timeout: anyNamed('timeout')))
        .thenAnswer((_) => Future.value(socket));
    when(
      socket.listen(
        any,
        onError: anyNamed('onError'),
        onDone: anyNamed('onDone'),
      ),
    ).thenAnswer((realInvocation) {
      final callback = realInvocation.namedArguments[const Symbol('onDone')];
      completer.complete(
        callback as void Function(),
      );
      return socketListener;
    });

    await tcpRadioConnector.connect(TcpMeshRadio(address: 'address'));
    final callback = await completer.future.timeout(const Duration(seconds: 1));
    callback();

    await untilCalled(socket.close());
    await container.pump();
    final state = container.read(tcpRadioConnectorProvider);
    verify(socketListener.cancel());
    expect(state, isInstanceOf<Disconnected>());
  });

  test('connect with existing connection', () async {
    when(socketMockable.connect('address', 4403, timeout: anyNamed('timeout')))
        .thenAnswer((_) => Future.value(socket));

    await tcpRadioConnector.connect(TcpMeshRadio(address: 'address'));
    await tcpRadioConnector.connect(TcpMeshRadio(address: 'address'));

    final state = container.read(tcpRadioConnectorProvider);
    expect(state, isInstanceOf<Connected>());
    verifyNever(socket.close());
    verifyNever(socketListener.cancel());
  });
}
