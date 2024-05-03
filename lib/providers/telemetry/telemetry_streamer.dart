import 'dart:async';

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/app_constants.dart';
import '../../protobufs/generated/meshtastic/telemetry.pb.dart';
import '../../repository/telemetry_repository.dart';
import '../radio_config/radio_config_service.dart';
import '../repository/telemetry_repository.dart';
import 'telemetry_receiver.dart';

part 'telemetry_streamer.g.dart';

@riverpod
class TelemetryStreamer extends _$TelemetryStreamer {
  List<Telemetry> _currentStreamState = [];
  final _streamController = StreamController<List<Telemetry>>.broadcast();
  late int _nodeNum;
  late int _myNodeNum;
  late TelemetryRepository _telemetryRepository;
  late TelemetryReceiver _telemetryReceiver;
  final _logger = Logger();
  int _count = 0;

  @override
  Stream<List<Telemetry>> build({
    required int nodeNum,
  }) {
    _nodeNum = nodeNum;
    _myNodeNum = ref
        .watch(radioConfigServiceProvider.select((value) => value.myNodeNum));
    _telemetryRepository = ref.watch(telemetryRepositoryProvider);
    _telemetryReceiver = ref.watch(telemetryReceiverProvider);

    final sub = _telemetryReceiver.addTelemetryListener(
      nodeNum: nodeNum,
      listener: _processTelemetry,
    );

    ref.onDispose(sub.cancel);
    ref.onDispose(_streamController.close);
    _loadInitial();
    return _streamController.stream;
  }

  void _processTelemetry(Telemetry telemetry) {
    _currentStreamState = [telemetry, ..._currentStreamState];
    _count++;
    _streamController.add(_currentStreamState);
  }

  Future<void> _loadInitial() async {
    _currentStreamState = await _telemetryRepository.get(
      fromNode: _nodeNum,
      owner: _myNodeNum,
      limit: BATCH_NUM_MESSAGES_TO_LOAD,
    );
    _count = await _telemetryRepository.count(fromNode: _nodeNum, owner: _myNodeNum);
    _streamController.add(_currentStreamState);
  }

  Future<void> loadNextChunk() async {
    final oldTelemetry = await _telemetryRepository.get(
      fromNode: _nodeNum,
      owner: _myNodeNum,
      offset: _currentStreamState.length,
      limit: BATCH_NUM_MESSAGES_TO_LOAD,
    );

    _currentStreamState = [..._currentStreamState, ...oldTelemetry];
    _streamController.add(_currentStreamState);
  }

  int get count => _count;
}
