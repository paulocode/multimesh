// coverage:ignore-file
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/radio_config/radio_config_uploader_service.dart';
import '../ack_waiting_radio_writer.dart';
import 'radio_config_service.dart';

part 'radio_config_uploader_service.g.dart';

@Riverpod(keepAlive: true)
RadioConfigUploaderService radioConfigUploaderService(
  Ref ref,
) {
  return RadioConfigUploaderService(
    radioWriter: ref.watch(ackWaitingRadioWriterProvider),
    myNodeNum: ref
        .watch(radioConfigServiceProvider.select((value) => value.myNodeNum)),
  );
}
