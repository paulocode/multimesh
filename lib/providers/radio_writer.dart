import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/radio_connector_state.dart';
import '../services/ble/ble_radio_writer.dart';
import '../services/interfaces/radio_writer.dart';
import '../services/null/null_writer.dart';
import '../services/tcp/tcp_radio_writer.dart';
import 'radio_connector_service.dart';

part 'radio_writer.g.dart';

@Riverpod(keepAlive: true)
RadioWriter radioWriter(RadioWriterRef ref) {
  final connectorState = ref.watch(radioConnectorServiceProvider);
  late final RadioWriter radioWriter;
  switch (connectorState) {
    case BleConnected():
      radioWriter =
          BleRadioWriter(to: connectorState.bleCharacteristics.toRadio);
    case TcpConnected():
      radioWriter = TcpRadioWriter(socket: connectorState.socket);
    case _:
      radioWriter = NullWriter();
  }

  return radioWriter;
}
