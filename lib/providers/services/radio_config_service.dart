import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/radio_configuration.dart';
import '../../protobufs/generated/meshtastic/config.pb.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import 'radio_config_uploader_service.dart';

part 'radio_config_service.g.dart';

// when watching config state, use select() to
// prevent unnecessary rebuilds.
@Riverpod(keepAlive: true)
class RadioConfigService extends _$RadioConfigService {
  late RadioConfigUploaderService _radioConfigUploaderService;

  int get _myNodeNum {
    return state.myNodeNum;
  }

  @override
  RadioConfiguration build() {
    _radioConfigUploaderService = ref.watch(radioConfigUploaderServiceProvider);

    return const RadioConfiguration();
  }

  Future<void> setRegion(
    Config_LoRaConfig_RegionCode region, {
    bool upload = true,
  }) async {
    state = state.copyWith(region: region);
    if (upload) {
      await _radioConfigUploaderService.setRegion(
        nodeNum: _myNodeNum,
        region: region,
      );
    }
  }

  Future<void> setModemPreset(
    Config_LoRaConfig_ModemPreset modemPreset, {
    bool upload = true,
  }) async {
    state = state.copyWith(modemPreset: modemPreset);
  }

  Future<void> setMyNodeNum(
    int myNodeNum, {
    bool upload = true,
  }) async {
    state = state.copyWith(myNodeNum: myNodeNum);
  }

  Future<void> setShortName(
    String shortName, {
    bool upload = true,
  }) async {
    state = state.copyWith(shortName: shortName);
  }

  Future<void> setLongName(
    String longName, {
    bool upload = true,
  }) async {
    state = state.copyWith(longName: longName);
  }

  Future<void> setHwModel(
    HardwareModel hwModel, {
    bool upload = true,
  }) async {
    state = state.copyWith(hwModel: hwModel);
  }

  void setConfigDownloaded() {
    state = state.copyWith(configDownloaded: true);
  }

  void clear() {
    ref.invalidateSelf();
  }
}
