import 'package:sqflite/sqflite.dart';

import '../protobufs/generated/meshtastic/telemetry.pb.dart';

class TelemetryRepository {
  TelemetryRepository({required Database database}) : _database = database;

  final Database _database;

  Future<int> add({
    required Telemetry telemetry,
    required int fromNode,
    required int owner,
  }) async {
    final environmentMetrics = telemetry.environmentMetrics;
    return _database.insert(
      'telemetry',
      {
        'owner': owner,
        'fromNode': fromNode,
        'relativeHumidity': environmentMetrics.relativeHumidity,
        'temp': environmentMetrics.temperature,
        'gasResistance': environmentMetrics.gasResistance,
        'barometricPressure': environmentMetrics.barometricPressure,
        'time': telemetry.time,
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

  Future<Telemetry?> getOne({
    required int index,
    required int fromNode,
    required int owner,
  }) async {
    final result = await _database.query(
      'telemetry',
      where: 'fromNode = ? AND owner = ?',
      whereArgs: [fromNode, owner],
      offset: index,
      orderBy: 'time DESC',
      limit: 1,
    );

    if (result.isNotEmpty) {
      return _mapResult(result)[0];
    } else {
      return null;
    }
  }

  List<Telemetry> _mapResult(List<Map<String, Object?>> result) {
    return [
      for (final {
            'relativeHumidity': relativeHumidity as double?,
            'temp': temp as double?,
            'barometricPressure': barometricPressure as double?,
            'gasResistance': gasResistance as double?,
            'time': time as int,
          } in result)
        Telemetry(
          time: time,
          environmentMetrics: EnvironmentMetrics(
            relativeHumidity: relativeHumidity,
            temperature: temp,
            barometricPressure: barometricPressure,
            gasResistance: gasResistance,
          ),
        ),
    ];
  }

  Future<List<Telemetry>> get({
    required int fromNode,
    required int owner,
    int offset = 0,
    int? limit,
  }) async {
    final result = await _database.query(
      'telemetry',
      where: 'fromNode = ? AND owner = ?',
      whereArgs: [fromNode, owner],
      orderBy: 'time DESC',
      offset: offset,
      limit: limit,
    );

    return _mapResult(result);
  }
}
