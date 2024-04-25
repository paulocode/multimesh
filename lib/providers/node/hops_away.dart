import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../radio_reader.dart';
part 'hops_away.g.dart';

@Riverpod(keepAlive: true)
class HopsAway extends _$HopsAway {
  @override
  int? build(int nodeNum) {
    final sub =
        ref.watch(radioReaderProvider).onPacketReceived().listen((event) {
      final packet = event.packet;
      if (packet.from == nodeNum &&
          packet.hasHopLimit() &&
          packet.hasHopStart()) {
        state = (packet.hopStart - packet.hopLimit).abs();
      }
    });
    ref.onDispose(sub.cancel);
    return null;
  }
}
