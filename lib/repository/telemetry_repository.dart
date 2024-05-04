import 'package:sqflite/sqflite.dart';

import '../models/timed_telemetry.dart';
import '../protobufs/generated/meshtastic/telemetry.pb.dart';

class TelemetryRepository {
  TelemetryRepository({required Database database}) : _database = database;

  final Database _database;

  Future<int> add({
    required TimedTelemetry timedTelemetry,
    required int fromNode,
    required int owner,
  }) async {
    final environmentMetrics = timedTelemetry.telemetry.environmentMetrics;
    return _database.insert(
      'telemetry',
      {
        'owner': owner,
        'fromNode': fromNode,
        'relativeHumidity': environmentMetrics.relativeHumidity,
        'temp': environmentMetrics.temperature,
        'gasResistance': environmentMetrics.gasResistance,
        'barometricPressure': environmentMetrics.barometricPressure,
        'receivedTime':
            timedTelemetry.timeReceived.millisecondsSinceEpoch ~/ 1000,
        'recordedTime': timedTelemetry.telemetry.time,
      },
    );
  }

  Future<int> count({
    required int fromNode,
    required int owner,
  }) async {
    final result = await _database.rawQuery(
      'SELECT COUNT(*) FROM telemetry WHERE fromNode = ? AND owner = ?',
      [fromNode, owner],
    );

    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<TimedTelemetry?> getOne({
    required int index,
    required int fromNode,
    required int owner,
  }) async {
    final result = await _database.query(
      'telemetry',
      where: 'fromNode = ? AND owner = ?',
      whereArgs: [fromNode, owner],
      offset: index,
      orderBy: 'id ASC',
      limit: 1,
    );

    if (result.isNotEmpty) {
      return _mapResult(result)[0];
    } else {
      return null;
    }
  }

  List<TimedTelemetry> _mapResult(List<Map<String, Object?>> result) {
    return [
      for (final {
            'relativeHumidity': relativeHumidity as double?,
            'temp': temp as double?,
            'barometricPressure': barometricPressure as double?,
            'gasResistance': gasResistance as double?,
            'receivedTime': receivedTime as int,
            'recordedTime': recordedTime as int,
          } in result)
        TimedTelemetry(
          timeReceived:
              DateTime.fromMillisecondsSinceEpoch(receivedTime * 1000),
          telemetry: Telemetry(
            time: recordedTime,
            environmentMetrics: EnvironmentMetrics(
              relativeHumidity: relativeHumidity,
              temperature: temp,
              barometricPressure: barometricPressure,
              gasResistance: gasResistance,
            ),
          ),
        ),
    ];
  }

  Future<List<TimedTelemetry>> get({
    required int fromNode,
    required int owner,
    int offset = 0,
    int? limit,
  }) async {
    final result = await _database.query(
      'telemetry',
      where: 'fromNode = ? AND owner = ?',
      whereArgs: [fromNode, owner],
      orderBy: 'id ASC',
      offset: offset,
      limit: limit,
    );

    return _mapResult(result);
  }

  Future<void> delete({required int fromNode, required int owner}) async {
    await _database.delete(
      'telemetry',
      where: 'fromNode = ? AND owner = ?',
      whereArgs: [fromNode, owner],
    );
  }
}
