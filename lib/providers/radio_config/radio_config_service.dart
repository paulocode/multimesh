import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/radio_configuration.dart';
import '../../protobufs/generated/meshtastic/config.pb.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../../services/radio_config/radio_config_uploader_service.dart';
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

    return RadioConfiguration(loraConfig: Config_LoRaConfig());
  }

  Future<void> setLoraConfig(
    Config_LoRaConfig loraConfig, {
    bool upload = true,
  }) async {
    state = state.copyWith(loraConfig: loraConfig);
    if (upload) {
      await _radioConfigUploaderService.setLoraConfig(
        nodeNum: _myNodeNum,
        loraConfig: loraConfig,
      );
    }
  }

  Future<void> setMyNodeNum(int myNodeNum) async {
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

  void setHasOwnNodeInfo() {
    state = state.copyWith(hasOwnNodeInfo: true);
  }

  void setConfigDownloaded() {
    state = state.copyWith(configDownloaded: true);
  }

  void clear() {
    ref.invalidateSelf();
  }
}
