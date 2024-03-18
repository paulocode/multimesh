import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/radio_connector_state.dart';
import '../services/ble/ble_radio_writer.dart';
import '../services/interfaces/radio_writer.dart';
import '../services/null/null_writer.dart';
import '../services/queued_radio_writer.dart';
import 'radio_connector_service.dart';
import 'radio_reader.dart';

part 'queued_radio_writer.g.dart';

@Riverpod(keepAlive: true)
QueuedRadioWriter queuedRadioWriter(QueuedRadioWriterRef ref) {
  final _logger = Logger();
  final queuedRadioWriter = QueuedRadioWriter();

  final connectorListener =
      ref.listen(radioConnectorServiceProvider, (_, connectorState) {
    if (connectorState is! Connected) {
      return;
    }

    late final RadioWriter radioWriter;
    switch (connectorState) {
      case BleConnected():
        radioWriter =
            BleRadioWriter(to: connectorState.bleCharacteristics.toRadio);
      case TcpConnected():
        radioWriter = NullWriter();
    }

    queuedRadioWriter.setRadioWriter(
      radioWriter,
      isNewRadio: connectorState.isNewRadio,
    );
  });

  final readerListener = ref.listen(radioReaderProvider, (_, next) {
    _logger.i('New reader');
    queuedRadioWriter.setRadioReader(next);
  });

  ref.onDispose(readerListener.close);
  ref.onDispose(connectorListener.close);

  return queuedRadioWriter;
}
