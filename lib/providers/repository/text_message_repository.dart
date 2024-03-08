import 'dart:async';
import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

import '../../constants/ble_constants.dart';
import '../../models/text_message.dart';
import '../../models/text_message_status.dart';
import 'sqflite.dart';

part 'text_message_repository.g.dart';

@Riverpod(keepAlive: true)
TextMessageRepository textMessageRepository(
  TextMessageRepositoryRef ref,
) {
  return TextMessageRepository(
    database: ref.watch(sqfliteProvider).requireValue,
  );
}

class TextMessageRepository {
  TextMessageRepository({required Database database}) : _database = database {
    //_createDummyData();
  }

  final Database _database;

  Future<List<List<TextMessage>>> getByNodeNum() async {
    return [];
  }

  Future<int> add({
    required TextMessage textMessage,
  }) async {
    return _database.insert(
      'text_messages',
      {
        'packetId': textMessage.packetId,
        'text': textMessage.text,
        'toNode': textMessage.to,
        'fromNode': textMessage.from,
        'channel': textMessage.channel,
        'time': textMessage.time.millisecondsSinceEpoch,
        'state': textMessage.state.index,
      },
    );
  }

  Future<void> updateStatusByPacketId({
    required TextMessageStatus status,
    required int packetId,
  }) async {
    await _database.update(
      'text_messages',
      {'state': status.index},
      where: 'packetId = ?',
      whereArgs: [packetId],
    );
    return;
  }

  Future<TextMessage> getByPacketId({
    required int packetId,
  }) async {
    final result = await _database.query(
      'text_messages',
      where: 'packetId = ?',
      whereArgs: [packetId],
      orderBy: 'id ASC',
    );

    return [
      for (final {
            'packetId': packetId as int,
            'text': text as String,
            'toNode': to as int,
            'fromNode': from as int,
            'channel': channel as int,
            'time': time as int,
            'state': state as int
          } in result)
        TextMessage(
          packetId: packetId,
          text: text,
          from: from,
          to: to,
          channel: channel,
          time: DateTime.fromMillisecondsSinceEpoch(time),
          state: TextMessageStatus.values[state],
        ),
    ].last;
  }

  Future<List<TextMessage>> getBy({
    required int nodeNum,
    required int channel,
    required int limit,
    int offset = 0,
  }) async {
    final result = await _database.query(
      'text_messages',
      where: '(toNode = ? OR toNode = ?) AND channel = ?',
      whereArgs: [nodeNum, TO_CHANNEL, channel],
      offset: offset,
      orderBy: 'id ASC',
      limit: limit,
    );

    return [
      for (final {
            'packetId': packetId as int,
            'text': text as String,
            'toNode': to as int,
            'fromNode': from as int,
            'channel': channel as int,
            'time': time as int,
            'state': state as int
          } in result)
        TextMessage(
          packetId: packetId,
          text: text,
          from: from,
          to: to,
          channel: channel,
          time: DateTime.fromMillisecondsSinceEpoch(time),
          state: TextMessageStatus.values[state],
        ),
    ];
  }

  Future<int> count({required int channel, required int nodeNum}) async {
    final result = await _database.rawQuery(
      'SELECT COUNT(*) FROM text_messages WHERE (toNode = ? OR toNode = ?) AND channel = ?',
      [nodeNum, TO_CHANNEL, channel],
    );

    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<void> _createDummyData() async {
    final messagesExist = await count(channel: 0, nodeNum: 3806486552) > 0;
    if (messagesExist) {
      return;
    }
    final random = Random();
    final msSinceEpoch = DateTime.now().millisecondsSinceEpoch;
    for (var i = 0; i < 1000; i++) {
      await add(
        textMessage: TextMessage(
          packetId: random.nextInt(0xffffffff),
          text: ('a' * random.nextInt(250)) + i.toString(),
          from: random.nextBool() ? 3806486552 : 3620505567,
          to: TO_CHANNEL,
          channel: 0,
          time: DateTime.fromMillisecondsSinceEpoch(
            (msSinceEpoch - 1000 * 1000 * 60) + i * 1000 * 60,
          ),
        ),
      );
    }
  }
}
