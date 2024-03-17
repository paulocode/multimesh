// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/mesh_radio.dart';
import '../../models/radio_connector_state.dart';
import '../ble/ble_radio_connector.dart';
import '../interfaces/radio_connector.dart';
import '../tcp/tcp_radio_connector.dart';

part 'radio_connector_service.g.dart';

@Riverpod(keepAlive: true)
class RadioConnectorService extends _$RadioConnectorService
    implements RadioConnector {
  NotifierProvider<RadioConnector, RadioConnectorState>? _lastUsedConnector;

  @override
  RadioConnectorState build() {
    if (_lastUsedConnector != null) {
      return ref.watch(_lastUsedConnector!);
    } else {
      return Disconnected();
    }
  }

  @override
  Future<void> disconnect(String? errorMsg) async {
    if (_lastUsedConnector != null) {
      await ref.read(_lastUsedConnector!.notifier).disconnect(errorMsg);
    }
  }

  @override
  Future<void> connect(MeshRadio radio) async {
    switch (radio) {
      case BleMeshRadio():
        _lastUsedConnector = bleRadioConnectorProvider;
      case TcpMeshRadio():
        _lastUsedConnector = tcpRadioConnectorProvider;
    }

    unawaited(ref.read(_lastUsedConnector!.notifier).connect(radio));
    ref.invalidateSelf();
  }
}
