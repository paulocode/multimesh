import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/radio_connector_state.dart';
import '../interfaces/radio_reader.dart';
import '../services/radio_connector_service.dart';
import 'ble_radio_reader.dart';
import 'null_reader.dart';

part 'radio_reader.g.dart';

@Riverpod(keepAlive: true)
RadioReader radioReader(RadioReaderRef ref) {
  final sub = ref.listen(radioConnectorServiceProvider, (_, next) {
    if (next is Connected) {
      ref.invalidateSelf();
    }
  });
  ref.onDispose(sub.close);

  final connectorState = sub.read();
  switch (connectorState) {
    case BleConnected():
      return BleRadioReader(
        radioConnectorState: sub.read(),
        onDispose: ref.onDispose,
      );
    case TcpConnected():
      return NullReader(onDispose: ref.onDispose);
    case _:
      return NullReader(onDispose: ref.onDispose);
  }
}
