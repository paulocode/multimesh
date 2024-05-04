import 'dart:async';

import 'package:logger/logger.dart';

import '../../models/timed_telemetry.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../../protobufs/generated/meshtastic/portnums.pbenum.dart';
import '../../protobufs/generated/meshtastic/telemetry.pb.dart';
import '../../repository/telemetry_repository.dart';
import '../interfaces/radio_reader.dart';

class TelemetryReceiver {
  TelemetryReceiver({
    required int myNodeNum,
    required TelemetryRepository telemetryRepository,
    required RadioReader radioReader,
    required void Function(void Function() cb) onDispose,
  })  : _myNodeNum = myNodeNum,
        _telemetryRepository = telemetryRepository,
        _radioReader = radioReader,
        _onDispose = onDispose {
    final sub = _radioReader.onPacketReceived().listen(_processPacket);
    _streamController = StreamController<MeshPacket>.broadcast();
    _onDispose(sub.cancel);
    _onDispose(_streamController.close);
  }

  final int _myNodeNum;
  final TelemetryRepository _telemetryRepository;
  final void Function(void Function() cb) _onDispose;
  final RadioReader _radioReader;
  late StreamController<MeshPacket> _streamController;
  final _logger = Logger();

  void _processPacket(FromRadio event) {
    final packet = event.packet;
    final decoded = packet.decoded;
    if (decoded.portnum != PortNum.TELEMETRY_APP) {
      return;
    }
    final telemetry = Telemetry.fromBuffer(decoded.payload);
    if (!telemetry.hasEnvironmentMetrics()) {
      // TODO: handle deviceMetrics
      return;
    }

    _logger.i(telemetry.toString());
    _streamController.add(packet);
    _telemetryRepository.add(
      timedTelemetry:
          TimedTelemetry(timeReceived: DateTime.now(), telemetry: telemetry),
      fromNode: packet.from,
      owner: _myNodeNum,
    );
  }

  StreamSubscription<MeshPacket> addTelemetryListener({
    required int nodeNum,
    required void Function(TimedTelemetry) listener,
  }) {
    return _streamController.stream
        .where((event) => event.from == nodeNum)
        .listen((event) {
      listener(
        TimedTelemetry(
          timeReceived: DateTime.now(),
          telemetry: Telemetry.fromBuffer(event.decoded.payload),
        ),
      );
    });
  }
}
