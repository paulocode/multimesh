import 'dart:async';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart' hide ConnectionError, Logger;
import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';
import 'package:platform/platform.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../exceptions/mesh_radio_exception.dart';
import '../../models/mesh_radio.dart';
import '../../models/radio_connector_state.dart' as connector_state;
import '../../services/ble/ble_characteristics_finder.dart';
import '../../services/interfaces/radio_connector.dart';
import '../../services/wrap/flutter_blue_plus_mockable.dart';
import '../wrap/flutter_blue_plus_mockable.dart';
import '../wrap/local_platform.dart';
import 'ble_characteristics_finder.dart';

part 'ble_radio_connector.g.dart';

@Riverpod(keepAlive: true)
class BleRadioConnector extends _$BleRadioConnector
    implements RadioConnector<BleMeshRadio> {
  final _logger = Logger();
  late BleCharacteristicsFinder _bleCharacteristicsFinder;
  late LocalPlatform _localPlatform;
  late FlutterBluePlusMockable _flutterBluePlus;
  StreamSubscription<ConnectionStateUpdate>? _bleConnectSubscription;

  @override
  connector_state.RadioConnectorState build() {
    _bleCharacteristicsFinder = ref.watch(bleCharacteristicsFinderProvider);
    _localPlatform = ref.watch(localPlatformProvider);
    _flutterBluePlus = ref.watch(flutterBluePlusProvider);
    return connector_state.Disconnected();
  }

  @override
  Future<void> disconnect({String? errorMsg}) async {
    if (errorMsg != null) {
      _logger.e(errorMsg);
    }
    if (state is! connector_state.BleConnected) {
      return;
    }
    final deviceId = (state as connector_state.BleConnected).radio.remoteId;
    await _flutterBluePlus.disconnectDevice(deviceId);
    state = connector_state.Disconnected(errorMsg: errorMsg);
    await _bleConnectSubscription?.cancel();
  }

  @override
  Future<void> connect(BleMeshRadio radio) async {
    if (state is connector_state.Connecting) {
      return;
    }

    final device = radio.device;

    state = connector_state.Connecting(
      radio: radio,
    );

    try {
      final connectionStream = _flutterBluePlus.connectToDevice(
        id: device.id,
        timeout: const Duration(seconds: 30),
      );

      await for (final connectionState in connectionStream) {
        if (connectionState.connectionState == DeviceConnectionState.connected) {
          state = connector_state.BleConnected(
            radio: radio,
            bleCharacteristics:
                await _bleCharacteristicsFinder.findCharacteristics(device.id),
          );

          await _subscribeConnectionState(device.id);
          break;
        } else if (connectionState.connectionState == DeviceConnectionState.disconnected) {
          if (connectionState.failure != null) {
            throw MeshRadioException(msg: connectionState.failure.toString());
          }
        }
      }
    } on MeshRadioException catch (e) {
      state = connector_state.ConnectionError(msg: e.msg, radio: radio);
    } catch (e) {
      state = connector_state.ConnectionError(msg: e.toString(), radio: radio);
    }
  }

  Future<void> _subscribeConnectionState(String deviceId) async {
    await _bleConnectSubscription?.cancel();
    _bleConnectSubscription = _flutterBluePlus.connectToDevice(
      id: deviceId,
    ).listen((event) {
      if (event.connectionState == DeviceConnectionState.disconnected) {
        state = connector_state.Disconnected();
        _bleConnectSubscription?.cancel();
      }
    });
  }
}

// coverage:ignore-start
class MockBleRadioConnectorContainer extends _$BleRadioConnector
    with Mock
    implements BleRadioConnector {
  MockBleRadioConnectorContainer({required BleRadioConnector bleRadioConnector})
      : _bleRadioConnector = bleRadioConnector;

  final BleRadioConnector _bleRadioConnector;
  @override
  Future<void> connect(BleMeshRadio radio) async {
    await _bleRadioConnector.connect(radio);
  }
}
// coverage:ignore-end
