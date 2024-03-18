import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../repository/text_message_repository.dart';
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
