import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/mesh_radio.dart';
import '../../models/radio_connector_state.dart';

abstract class RadioConnector<T extends MeshRadio>
    implements Notifier<RadioConnectorState> {
  @override
  RadioConnectorState build();

  Future<void> disconnect({String? errorMsg});

  Future<void> connect(T radio);
}
