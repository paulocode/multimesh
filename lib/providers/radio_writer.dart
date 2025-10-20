import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/radio_connector_state.dart';
import '../services/ble/ble_radio_writer.dart';
import '../services/interfaces/radio_writer.dart';
import '../services/null/null_writer.dart';
import '../services/tcp/tcp_radio_writer.dart';
import 'radio_connector_service.dart';

part 'radio_writer.g.dart';

@Riverpod(keepAlive: true)
RadioWriter radioWriter(Ref ref) {
  // it is safe to rebuild for every connector state
  // since this provider is abstracted by queuedRadioWriterProvider,
  // preserving offline view mode
  final connectorState = ref.watch(radioConnectorServiceProvider);
  late final RadioWriter radioWriter;
  switch (connectorState) {
    case BleConnected():
      radioWriter = BleRadioWriter(connectorState);
    case TcpConnected():
      radioWriter = TcpRadioWriter(connectorState);
    case _:
      radioWriter = NullWriter();
  }

  return radioWriter;
}
