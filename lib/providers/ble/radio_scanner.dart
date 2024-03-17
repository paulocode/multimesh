import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../exceptions/mesh_radio_exception.dart';
import '../../models/mesh_radio.dart';
import '../../models/radio_scan_state.dart';
import '../wrap/flutter_blue_plus_mockable.dart';
import 'ble_permissions_requester.dart';

part 'radio_scanner.g.dart';

@Riverpod(keepAlive: true)
class RadioScanner extends _$RadioScanner {
  late FlutterBluePlusMockable _flutterBluePlus;
  late BlePermissionsRequester _blePermissionsRequester;
  final _logger = Logger();

  @override
  RadioScanState build() {
    _flutterBluePlus = ref.watch(flutterBluePlusProvider);
    _blePermissionsRequester = ref.watch(blePermissionsRequesterProvider);
    return const RadioScanState();
  }

  Future<void> scan() async {
    state = state.copyWith(scanning: true);
    if (!await _blePermissionsRequester.request()) {
      state = state.copyWith(scanning: false);
      return;
    }
    await _scanAndShowDevices();
    await _flutterBluePlus.isScanning.where((isScanning) => !isScanning).first;
    state = state.copyWith(scanning: false);
  }

  Future<void> _scanAndShowDevices() async {
    final devices = await _createListFromSystemDevices();
    state = state.copyWith(meshRadios: devices);
    final subscription = _flutterBluePlus.scanResults.listen(
      (results) async {
        _addUniqueResults(devices, results);
      },
      onError: (e) {
        _logger.e(e.toString());
        state = state.copyWith(scanning: false);
        throw const MeshRadioException(msg: 'Scanning failed');
      },
    );
    _flutterBluePlus.cancelWhenScanComplete(subscription);
    await _flutterBluePlus.startScan(
      timeout: const Duration(seconds: 15),
    );
  }

  void _addUniqueResults(List<MeshRadio> devices, List<ScanResult> results) {
    final newDevices = results
        .where(
          (e) => e.advertisementData.advName.trim().isNotEmpty,
        )
        .map((e) => MeshRadio(device: e.device));
    final uniqueNewDevices = newDevices.where(
      (newDevice) => devices
          .where(
            (existingDevice) => existingDevice.remoteId == newDevice.remoteId,
          )
          .isEmpty,
    );
    devices.addAll(uniqueNewDevices);

    state = state.copyWith(meshRadios: devices);
  }

  Future<List<MeshRadio>> _createListFromSystemDevices() async {
    final systemDevices = await _flutterBluePlus.systemDevices;
    return List<MeshRadio>.from(
      systemDevices
          .where((element) => element.advName.trim().isNotEmpty)
          .map((e) => MeshRadio(device: e)),
    );
  }
}
