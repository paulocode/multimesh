import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/mesh_radio.dart';
import '../../models/radio_connector_state.dart';
import '../interfaces/radio_connector.dart';

part 'tcp_radio_connector.g.dart';

@Riverpod(keepAlive: true)
class TcpRadioConnector extends _$TcpRadioConnector
    implements RadioConnector<TcpMeshRadio> {
  @override
  RadioConnectorState build() {
    return Disconnected();
  }

  @override
  Future<void> connect(TcpMeshRadio radio) async {}

  @override
  Future<void> disconnect(String? errorMsg) async {}
}
