// coverage:ignore-file
import 'dart:async';

import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../wrap/local_platform.dart';

part 'sqflite.g.dart';

@Riverpod(keepAlive: true)
Future<Database> sqflite(
  SqfliteRef ref,
) async {
  final localPlatform = ref.read(localPlatformProvider);
  if (localPlatform.isWindows || localPlatform.isLinux) {
    sqfliteFfiInit();
  }
  return openDatabase(
    join(await getDatabasesPath(), 'meshx.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE text_messages (id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'text TEXT, toNode INTEGER, fromNode INTEGER, channel INTEGER, '
        'time INTEGER, state INTEGER, packetId INTEGER)',
      );
    },
    onUpgrade: (db, oldVersion, newVersion) {
      if (newVersion > 1) {
        db.execute('ALTER TABLE text_messages ADD COLUMN owner INTEGER;');
      }
    },
    version: 2,
  );
}
