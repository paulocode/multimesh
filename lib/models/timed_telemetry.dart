import '../protobufs/generated/meshtastic/telemetry.pb.dart';

class TimedTelemetry {
  TimedTelemetry({required this.timeReceived, required this.telemetry});

  final DateTime timeReceived;
  final Telemetry telemetry;
}
