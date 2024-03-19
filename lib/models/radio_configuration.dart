import 'package:freezed_annotation/freezed_annotation.dart';

import '../protobufs/generated/meshtastic/config.pb.dart';
import '../protobufs/generated/meshtastic/mesh.pb.dart';

part 'radio_configuration.freezed.dart';

@freezed
class RadioConfiguration with _$RadioConfiguration {
  const factory RadioConfiguration({
    @Default('') String shortName,
    @Default('') String longName,
    @Default(0) int myNodeNum,
    @Default(HardwareModel.UNSET) HardwareModel hwModel,
    @Default(Config_LoRaConfig_RegionCode.UNSET)
    Config_LoRaConfig_RegionCode region,
    @Default(Config_LoRaConfig_ModemPreset.LONG_FAST)
    Config_LoRaConfig_ModemPreset modemPreset,
    @Default(false) bool hasOwnNodeInfo,
    @Default(false) bool configDownloaded,
  }) = _RadioConfiguration;

  const RadioConfiguration._();
}
