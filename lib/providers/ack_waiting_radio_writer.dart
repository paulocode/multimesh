import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/radio_connector_state.dart';
import '../services/queued_radio_writer.dart';
import 'radio_config/radio_config_service.dart';
import 'radio_connector_service.dart';
import 'radio_reader.dart';
import 'radio_writer.dart';

part 'ack_waiting_radio_writer.g.dart';

@Riverpod(keepAlive: true)
AckWaitingRadioWriter ackWaitingRadioWriter(AckWaitingRadioWriterRef ref) {
  final queuedRadioWriter = AckWaitingRadioWriter(
    hopLimitProvider: () =>
        ref.read(radioConfigServiceProvider).loraConfig.hopLimit,
  );
  final logger = Logger();
  ref.onDispose(queuedRadioWriter.dispose);

  ref.listen(radioConnectorServiceProvider, (_, connectorState) {
    if (connectorState is! Connected) {
      return;
    }

    if (connectorState.isNewRadio) {
      logger.i('new radio');
      ref.invalidateSelf();
    } else {
      logger.i('reconnected to previous radio');
    }
  });

  ref.listen(radioWriterProvider, fireImmediately: true, (_, next) {
    queuedRadioWriter.setRadioWriter(
      next,
    );
  });

  ref.listen(radioReaderProvider, fireImmediately: true, (_, next) {
    queuedRadioWriter.setRadioReader(next);
  });

  return queuedRadioWriter;
}
