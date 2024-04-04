import 'package:freezed_annotation/freezed_annotation.dart';

import '../protobufs/generated/meshtastic/config.pb.dart';
import '../protobufs/generated/meshtastic/mesh.pb.dart';
import '../protobufs/generated/meshtastic/mesh.pbserver.dart';

part 'radio_configuration.freezed.dart';

@freezed
class RadioConfiguration with _$RadioConfiguration {
  const factory RadioConfiguration({
    @Default(0) int myNodeNum,
    required Config_LoRaConfig loraConfig,
    required Config_BluetoothConfig bluetoothConfig,
    required NodeInfo myNodeInfo,
    @Default(false) bool hasOwnNodeInfo,
    @Default(false) bool configDownloaded,
  }) = _RadioConfiguration;

  const RadioConfiguration._();
}
