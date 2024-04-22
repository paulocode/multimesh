// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';

import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/mesh_radio.dart';
import '../models/radio_connector_state.dart';
import '../services/breadcrumb_logger.dart';
import '../services/interfaces/radio_connector.dart';
import 'ble/ble_radio_connector.dart';
import 'breadcrumb_logger.dart';
import 'tcp/tcp_radio_connector.dart';

part 'radio_connector_service.g.dart';

@Riverpod(keepAlive: true)
class RadioConnectorService extends _$RadioConnectorService
    implements RadioConnector {
  NotifierProvider<RadioConnector, RadioConnectorState>? _lastUsedConnector;
  String? _currentRadioId;
  late BreadcrumbLogger _telemetryLogger;

  @override
  RadioConnectorState build() {
    _telemetryLogger = ref.watch(breadcrumbLoggerProvider);

    if (_lastUsedConnector == null) {
      return Disconnected();
    }
    final connectorState = ref.watch(_lastUsedConnector!);
    if (connectorState is Connected) {
      final currentRadioId = _currentRadioId;
      _currentRadioId = connectorState.radioId;
      return connectorState.copyWith(
        isNewRadio: currentRadioId != connectorState.radioId,
      );
    }
    return connectorState;
  }

  @override
  Future<void> disconnect({String? errorMsg}) async {
    if (_lastUsedConnector != null) {
      await ref
          .read(_lastUsedConnector!.notifier)
          .disconnect(errorMsg: errorMsg);
      _lastUsedConnector = null;
    }
  }

  @override
  Future<void> connect(MeshRadio radio) async {
    if (_currentRadioId == radio.remoteId) {
      await Future<void>.delayed(const Duration(milliseconds: 500));
    }
    switch (radio) {
      case BleMeshRadio():
        await _telemetryLogger.i('BLE connect');
        _lastUsedConnector = bleRadioConnectorProvider;
      case TcpMeshRadio():
        await _telemetryLogger.i('TCP connect');
        _lastUsedConnector = tcpRadioConnectorProvider;
    }

    unawaited(ref.read(_lastUsedConnector!.notifier).connect(radio));
    ref.invalidateSelf();
  }
}

// coverage:ignore-start
class MockRadioConnectorService extends _$RadioConnectorService
    with Mock
    implements RadioConnectorService {}

class MockRadioConnectorServiceContainer extends _$RadioConnectorService
    with Mock
    implements RadioConnectorService {
  MockRadioConnectorServiceContainer({
    required RadioConnectorService radioConnectorService,
  }) : _radioConnectorService = radioConnectorService;

  final RadioConnectorService _radioConnectorService;

  @override
  Future<void> connect(MeshRadio radio) async {
    await _radioConnectorService.connect(radio);
  }
}
// coverage:ignore-end
