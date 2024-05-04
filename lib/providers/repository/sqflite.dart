// coverage:ignore-file
import 'dart:async';

import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../wrap/local_platform.dart';

part 'sqflite.g.dart';

@Riverpod(keepAlive: true)
Future<Database> sqflite(
  SqfliteRef ref,
) async {
  final logger = Logger();
  final localPlatform = ref.read(localPlatformProvider);
  final isDesktop = localPlatform.isWindows || localPlatform.isLinux;
  if (isDesktop) {
    databaseFactory = databaseFactoryFfi;
    sqfliteFfiInit();
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      logger.i('DB Updating to version 2');
      await db.execute('ALTER TABLE text_messages ADD COLUMN owner INTEGER;');
    }
    if (oldVersion < 3) {
      logger.i('DB Updating to version 3');
      await db.execute(
        'ALTER TABLE text_messages ADD COLUMN routingError INTEGER;',
      );
    }
    if (oldVersion < 4) {
      logger.i('DB Updating to version 4');
      await db.execute(
        'CREATE TABLE telemetry (id INTEGER PRIMARY KEY AUTOINCREMENT, owner INTEGER, fromNode INTEGER, '
        'temp REAL, relativeHumidity REAL, barometricPressure REAL, gasResistance REAL, receivedTime INTEGER, '
        'recordedTime INTEGER, iaq INTEGER);',
      );
    }
  }

  return openDatabase(
    join(await getDatabasesPath(), 'meshx.db'),
    onCreate: (db, version) async {
      await db.execute(
        'CREATE TABLE text_messages (id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'text TEXT, toNode INTEGER, fromNode INTEGER, channel INTEGER, '
        'time INTEGER, state INTEGER, packetId INTEGER);',
      );
      _onUpgrade(db, 1, version);
    },
    onUpgrade: _onUpgrade,
    version: DATABASE_VERSION,
  );
}

const DATABASE_VERSION = 4;
