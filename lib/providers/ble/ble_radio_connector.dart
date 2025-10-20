import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';
import 'package:platform/platform.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../exceptions/mesh_radio_exception.dart';
import '../../models/mesh_radio.dart';
import '../../models/radio_connector_state.dart';
import '../../services/ble/ble_characteristics_finder.dart';
import '../../services/interfaces/radio_connector.dart';
import '../wrap/local_platform.dart';
import 'ble_characteristics_finder.dart';

part 'ble_radio_connector.g.dart';

@Riverpod(keepAlive: true)
class BleRadioConnector extends _$BleRadioConnector
    implements RadioConnector<BleMeshRadio> {
  final _logger = Logger();
  late BleCharacteristicsFinder _bleCharacteristicsFinder;
  late LocalPlatform _localPlatform;
  StreamSubscription<BluetoothConnectionState>? _bleConnectSubscription;

  @override
  RadioConnectorState build() {
    _bleCharacteristicsFinder = ref.watch(bleCharacteristicsFinderProvider);
    _localPlatform = ref.watch(localPlatformProvider);
    return Disconnected();
  }

  @override
  Future<void> disconnect({String? errorMsg}) async {
    if (errorMsg != null) {
      _logger.e(errorMsg);
    }
    if (state is! BleConnected) {
      return;
    }
    final device = (state as BleConnected).device;
    await device.disconnect();
    state = Disconnected(errorMsg: errorMsg);
    await _bleConnectSubscription?.cancel();
  }

  @override
  Future<void> connect(BleMeshRadio radio) async {
    if (state is Connecting) {
      return;
    }

    final device = radio.device;

    state = Connecting(
      radio: radio,
    );

    try {
      await device.connect(
        license: License.free,
      );
      if (_localPlatform.isAndroid) {
        await device.createBond();
      }

      state = BleConnected(
        radio: radio,
        bleCharacteristics:
            await _bleCharacteristicsFinder.findCharacteristics(device),
      );

      await _subscribeConnectionState(device);
    } on MeshRadioException catch (e) {
      state = ConnectionError(msg: e.msg, radio: radio);
    } on FlutterBluePlusException catch (e) {
      state = ConnectionError(msg: e.description, radio: radio);
    } catch (e) {
      state = ConnectionError(msg: 'Unknown error', radio: radio);
    }
  }

  Future<void> _subscribeConnectionState(BluetoothDevice device) async {
    await _bleConnectSubscription?.cancel();
    _bleConnectSubscription = device.connectionState.listen((event) {
      if (event == BluetoothConnectionState.disconnected) {
        state = Disconnected();
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
