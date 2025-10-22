import 'dart:async';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart' hide ConnectionError, Logger;
import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../exceptions/mesh_radio_exception.dart';
import '../../models/mesh_radio.dart';
import '../../models/radio_connector_state.dart' as connector_state;
import '../../services/ble/ble_characteristics_finder.dart';
import '../../services/interfaces/radio_connector.dart';
import '../../services/wrap/flutter_blue_plus_mockable.dart';
import '../wrap/flutter_blue_plus_mockable.dart';
import 'ble_characteristics_finder.dart';

part 'ble_radio_connector.g.dart';

@Riverpod(keepAlive: true)
class BleRadioConnector extends _$BleRadioConnector
    implements RadioConnector<BleMeshRadio> {
  final _logger = Logger();
  late BleCharacteristicsFinder _bleCharacteristicsFinder;
  late FlutterBluePlusMockable _flutterBluePlus;
  StreamSubscription<ConnectionStateUpdate>? _bleConnectSubscription;
  String? _currentDeviceId;

  @override
  connector_state.RadioConnectorState build() {
    _bleCharacteristicsFinder = ref.watch(bleCharacteristicsFinderProvider);
    _flutterBluePlus = ref.watch(flutterBluePlusProvider);
    return connector_state.Disconnected();
  }

  @override
  Future<void> disconnect({String? errorMsg}) async {
    if (errorMsg != null) {
      _logger.e(errorMsg);
    }
    
    // Cancel existing connection subscription
    await _bleConnectSubscription?.cancel();
    _bleConnectSubscription = null;
    _currentDeviceId = null;
    
    if (state is! connector_state.BleConnected) {
      state = connector_state.Disconnected(errorMsg: errorMsg);
      return;
    }
    
    final deviceId = (state as connector_state.BleConnected).radio.remoteId;
    await _flutterBluePlus.disconnectDevice(deviceId);
    state = connector_state.Disconnected(errorMsg: errorMsg);
  }

  @override
  Future<void> connect(BleMeshRadio radio) async {
    if (state is connector_state.Connecting) {
      return;
    }

    final device = radio.device;

    // Disconnect from any existing connection first
    if (_currentDeviceId != null && _currentDeviceId != device.id) {
      await disconnect();
    }

    state = connector_state.Connecting(
      radio: radio,
    );

    try {
      // Cancel any existing subscription before creating new one
      await _bleConnectSubscription?.cancel();
      
      final connectionStream = _flutterBluePlus.connectToDevice(
        id: device.id,
        timeout: const Duration(seconds: 30),
      );

      // Store the subscription so we can monitor connection state
      _bleConnectSubscription = connectionStream.listen(
        (connectionState) async {
          if (connectionState.connectionState == DeviceConnectionState.connected) {
            // Only discover services if we're not already connected
            if (state is! connector_state.BleConnected) {
              try {
                final characteristics = await _bleCharacteristicsFinder.findCharacteristics(device.id);
                _currentDeviceId = device.id;
                state = connector_state.BleConnected(
                  radio: radio,
                  bleCharacteristics: characteristics,
                );
              } catch (e) {
                _logger.e('Failed to discover services: $e');
                await disconnect(errorMsg: e.toString());
              }
            }
          } else if (connectionState.connectionState == DeviceConnectionState.disconnected) {
            if (state is! connector_state.Disconnected) {
              state = connector_state.Disconnected();
              _currentDeviceId = null;
            }
            if (connectionState.failure != null) {
              _logger.e('Connection failed: ${connectionState.failure}');
            }
          }
        },
        onError: (Object error) {
          _logger.e('Connection error: $error');
          if (error is Exception) {
            state = connector_state.ConnectionError(msg: error.toString(), radio: radio);
          } else {
            state = connector_state.ConnectionError(msg: 'Connection failed', radio: radio);
          }
        },
      );
    } on MeshRadioException catch (e) {
      await _bleConnectSubscription?.cancel();
      _bleConnectSubscription = null;
      state = connector_state.ConnectionError(msg: e.msg, radio: radio);
    } catch (e) {
      await _bleConnectSubscription?.cancel();
      _bleConnectSubscription = null;
      state = connector_state.ConnectionError(msg: e.toString(), radio: radio);
    }
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
