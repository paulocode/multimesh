import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/radio_configuration.dart';
import '../../protobufs/generated/meshtastic/config.pb.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';

part 'radio_config_service.g.dart';

// when watching config state, use select() to
// prevent unnecessary rebuilds.
@Riverpod(keepAlive: true)
class RadioConfigService extends _$RadioConfigService {
  @override
  RadioConfiguration build() {
    return RadioConfiguration(
      loraConfig: Config_LoRaConfig(),
      myNodeInfo: NodeInfo(),
    );
  }

  void setLoraConfig(
    Config_LoRaConfig loraConfig,
  ) {
    state = state.copyWith(loraConfig: loraConfig);
  }

  void setMyNodeInfo(NodeInfo myNodeInfo) {
    state = state.copyWith(myNodeInfo: myNodeInfo);
  }

  void setMyNodeNum(int myNodeNum) {
    state = state.copyWith(myNodeNum: myNodeNum);
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

// coverage:ignore-start
class MockRadioConfigService extends _$RadioConfigService
    with Mock
    implements RadioConfigService {}
// coverage:ignore-end
