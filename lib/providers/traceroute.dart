import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../protobufs/generated/meshtastic/mesh.pb.dart';
import '../protobufs/generated/meshtastic/portnums.pb.dart';
import 'ack_waiting_radio_writer.dart';
import 'radio_reader.dart';
part 'traceroute.g.dart';

@riverpod
Future<List<int>> traceroute(TracerouteRef ref, int nodeNum) async {
  final logger = Logger();
  final radioWriter = ref.watch(ackWaitingRadioWriterProvider);
  final packetId = radioWriter.generatePacketId();
  ref.watch(radioReaderProvider).onPacketReceived().listen((packet) {
    final decoded = packet.packet.decoded;
    if (decoded.requestId == packetId) {
      final routing = Routing.fromBuffer(decoded.payload);

      logger.i(routing);
    }
  });

  await radioWriter.sendMeshPacket(
    to: nodeNum,
    portNum: PortNum.TRACEROUTE_APP,
    wantAck: true,
    payload: RouteDiscovery().writeToBuffer(),
    id: packetId,
  );

  return List<int>.empty();
}
