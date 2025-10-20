// coverage:ignore-file
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/wrap/socket_mockable.dart';
part 'socket.g.dart';

@Riverpod(keepAlive: true)
SocketMockable socket(Ref ref) {
  return SocketMockable();
}
