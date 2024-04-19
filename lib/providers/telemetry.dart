import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/telemetry_state.dart';
import '../protobufs/generated/meshtastic/portnums.pb.dart';
import '../protobufs/generated/meshtastic/telemetry.pb.dart';
import 'radio_reader.dart';

part 'telemetry.g.dart';

@Riverpod(keepAlive: true)
class TelemetryReceiver extends _$TelemetryReceiver {
  @override
  TelemetryState build(int nodeNum) {
    final sub =
        ref.watch(radioReaderProvider).onPacketReceived().listen((event) {
      if (event.packet.from != nodeNum) {
        return;
      }
      final decoded = event.packet.decoded;
      if (decoded.portnum == PortNum.TELEMETRY_APP) {
        final telemetry = Telemetry.fromBuffer(decoded.payload);
        state = state.copyWith(temp: telemetry.environmentMetrics.temperature);
      }
    });

    ref.onDispose(sub.cancel);
    return const TelemetryState();
  }
}
