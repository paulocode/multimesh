import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/app_constants.dart';
import '../../models/timed_telemetry.dart';
import '../../repository/telemetry_repository.dart';
import '../../services/telemetry/telemetry_receiver.dart';
import '../radio_config/radio_config_service.dart';
import '../repository/telemetry_repository.dart';
import 'telemetry_receiver.dart';

part 'telemetry_streamer.g.dart';

@riverpod
class TelemetryStreamer extends _$TelemetryStreamer {
  List<TimedTelemetry> _currentStreamState = [];
  late StreamController<List<TimedTelemetry>> _streamController;
  late int _nodeNum;
  late int _myNodeNum;
  late TelemetryRepository _telemetryRepository;
  late TelemetryReceiver _telemetryReceiver;
  int _count = 0;

  @override
  Stream<List<TimedTelemetry>> build({
    required int nodeNum,
  }) {
    _nodeNum = nodeNum;
    _myNodeNum = ref
        .watch(radioConfigServiceProvider.select((value) => value.myNodeNum));
    _telemetryRepository = ref.watch(telemetryRepositoryProvider);
    _telemetryReceiver = ref.watch(telemetryReceiverProvider);

    _streamController = StreamController.broadcast();
    ref.onDispose(_streamController.close);

    final sub = _telemetryReceiver.addTelemetryListener(
      nodeNum: nodeNum,
      listener: _processTelemetry,
    );
    ref.onDispose(sub.cancel);

    _loadInitial();
    return _streamController.stream;
  }

  void _processTelemetry(TimedTelemetry timedTelemetry) {
    _currentStreamState = [timedTelemetry, ..._currentStreamState];
    _count++;
    _streamController.add(_currentStreamState);
  }

  Future<void> _loadInitial() async {
    _currentStreamState = await _telemetryRepository.get(
      fromNode: _nodeNum,
      owner: _myNodeNum,
      limit: BATCH_NUM_MESSAGES_TO_LOAD,
    );
    _count =
        await _telemetryRepository.count(fromNode: _nodeNum, owner: _myNodeNum);
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

  // ignore: avoid_public_notifier_properties
  int get count => _count;

  Future<void> clear() async {
    await _telemetryRepository.delete(
      fromNode: _nodeNum,
      owner: _myNodeNum,
    );
    _count = 0;
    _currentStreamState.clear();
    _streamController.add(_currentStreamState);
  }
}
