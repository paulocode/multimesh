// coverage:ignore-file
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/ack_waiting_radio_writer.dart';
import 'radio_config/radio_config_service.dart';
import 'radio_reader.dart';
import 'radio_writer.dart';

part 'ack_waiting_radio_writer.g.dart';

@Riverpod(keepAlive: true)
AckWaitingRadioWriter ackWaitingRadioWriter(AckWaitingRadioWriterRef ref) {
  return AckWaitingRadioWriter(
    hopLimitProvider: () =>
        ref.read(radioConfigServiceProvider).loraConfig.hopLimit,
    radioReader: ref.watch(radioReaderProvider),
    radioWriter: ref.watch(radioWriterProvider),
  );
}
