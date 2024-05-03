import 'dart:async';

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/telemetry_state.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../../protobufs/generated/meshtastic/portnums.pb.dart';
import '../../protobufs/generated/meshtastic/telemetry.pb.dart';
import '../../repository/telemetry_repository.dart';
import '../../services/interfaces/radio_reader.dart';
import '../radio_config/radio_config_service.dart';
import '../radio_reader.dart';
import '../repository/telemetry_repository.dart';
part 'telemetry_receiver.g.dart';

@Riverpod(keepAlive: true)
TelemetryReceiver telemetryReceiver(TelemetryReceiverRef ref) {
  return TelemetryReceiver(
    myNodeNum: ref
        .watch(radioConfigServiceProvider.select((value) => value.myNodeNum)),
    telemetryRepository: ref.watch(telemetryRepositoryProvider),
    radioReader: ref.watch(radioReaderProvider),
    onDispose: ref.onDispose,
  );
}

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
    _onDispose(sub.cancel);
  }

  final int _myNodeNum;
  final TelemetryRepository _telemetryRepository;
  final void Function(void Function() cb) _onDispose;
  final RadioReader _radioReader;
  final _streamController = StreamController<MeshPacket>.broadcast();
  final _logger = Logger();

  void _processPacket(FromRadio event) {
    final packet = event.packet;
    final decoded = packet.decoded;
    if (decoded.portnum == PortNum.TELEMETRY_APP) {
      final telemetry = Telemetry.fromBuffer(decoded.payload);
      telemetry.time = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      packet.decoded.payload = telemetry.writeToBuffer();
      _logger.i(telemetry.toString());
      _streamController.add(packet);
      _telemetryRepository.add(
        telemetry: telemetry,
        fromNode: packet.from,
        owner: _myNodeNum,
      );
    }
  }

  StreamSubscription<MeshPacket> addTelemetryListener({
    required int nodeNum,
    required void Function(Telemetry) listener,
  }) {
    return _streamController.stream
        .where((event) => event.from == nodeNum)
        .listen((event) {
      listener(Telemetry.fromBuffer(event.decoded.payload));
    });
  }
}

@Riverpod(keepAlive: true)
class TelemetryLatestStreamer extends _$TelemetryLatestStreamer {
  late TelemetryRepository _telemetryRepository;
  late int _myNodeNum;
  late int _nodeNum;

  @override
  TelemetryState build({required int nodeNum}) {
    final sub = ref
        .watch(telemetryReceiverProvider)
        .addTelemetryListener(nodeNum: nodeNum, listener: _processTelemetry);
    _myNodeNum = ref
        .watch(radioConfigServiceProvider.select((value) => value.myNodeNum));
    _telemetryRepository = ref.watch(telemetryRepositoryProvider);
    _nodeNum = nodeNum;
    ref.onDispose(sub.cancel);
    _loadFirstTelemetry();
    return const TelemetryState();
  }

  void _processTelemetry(Telemetry telemetry) {
    final environmentMetrics = telemetry.environmentMetrics;
    if (environmentMetrics.hasTemperature()) {
      state = state.copyWith(temp: telemetry.environmentMetrics.temperature);
    }
    if (environmentMetrics.hasRelativeHumidity()) {
      state = state.copyWith(
        relativeHumidity: telemetry.environmentMetrics.relativeHumidity,
      );
    }
    if (environmentMetrics.hasBarometricPressure()) {
      state = state.copyWith(
        barometricPressure: telemetry.environmentMetrics.barometricPressure,
      );
    }
    if (environmentMetrics.hasGasResistance()) {
      state = state.copyWith(
        gasResistance: telemetry.environmentMetrics.gasResistance,
      );
    }
  }

  Future<void> _loadFirstTelemetry() async {
    final telemetry = await _telemetryRepository.getOne(
      index: 0,
      fromNode: _nodeNum,
      owner: _myNodeNum,
    );
    if (telemetry != null) {
      _processTelemetry(telemetry);
    }
  }
}
