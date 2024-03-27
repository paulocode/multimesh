import 'package:sqflite/sqflite.dart';

import '../models/text_message.dart';
import '../models/text_message_status.dart';

class TextMessageRepository {
  TextMessageRepository({required Database database}) : _database = database;

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
        'owner': textMessage.owner,
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

    return _mapResult(result).last;
  }

  Future<List<TextMessage>> getDirectMessagesBy({
    required int myNodeNum,
    required int otherNodeNum,
    required int limit,
    int offset = 0,
    required int owner,
  }) async {
    final result = await _database.query(
      'text_messages',
      where:
          '((toNode = ? AND fromNode = ?) OR (toNode = ? AND fromNode = ?)) AND owner = ?',
      whereArgs: [myNodeNum, otherNodeNum, otherNodeNum, myNodeNum, owner],
      offset: offset,
      orderBy: 'id ASC',
      limit: limit,
    );

    return _mapResult(result);
  }

  Future<List<TextMessage>> getBy({
    required int toNode,
    required int channel,
    required int limit,
    int offset = 0,
    required int owner,
  }) async {
    final result = await _database.query(
      'text_messages',
      where: 'toNode = ? AND channel = ? AND owner = ?',
      whereArgs: [toNode, channel, owner],
      offset: offset,
      orderBy: 'id ASC',
      limit: limit,
    );

    return _mapResult(result);
  }

  Future<int> countDirectMessagesBy({
    required int myNodeNum,
    required int otherNodeNum,
    required int owner,
  }) async {
    final result = await _database.rawQuery(
      'SELECT COUNT(*) FROM text_messages WHERE ((toNode = ? AND fromNode = ?) OR (toNode = ? AND fromNode = ?)) AND owner = ?',
      [myNodeNum, otherNodeNum, otherNodeNum, myNodeNum, owner],
    );

    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<int> count({
    required int channel,
    required int toNode,
    required int owner,
  }) async {
    final result = await _database.rawQuery(
      'SELECT COUNT(*) FROM text_messages WHERE toNode = ? AND channel = ? AND owner = ?',
      [toNode, channel, owner],
    );

    return Sqflite.firstIntValue(result) ?? 0;
  }

  List<TextMessage> _mapResult(List<Map<String, Object?>> result) {
    return [
      for (final {
            'packetId': packetId as int,
            'text': text as String,
            'toNode': to as int,
            'fromNode': from as int,
            'channel': channel as int,
            'time': time as int,
            'state': state as int,
            'owner': owner as int
          } in result)
        TextMessage(
          packetId: packetId,
          text: text,
          from: from,
          to: to,
          channel: channel,
          time: DateTime.fromMillisecondsSinceEpoch(time),
          state: TextMessageStatus.values[state],
          owner: owner,
        ),
    ];
  }
}
