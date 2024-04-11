import 'dart:async';

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../protobufs/generated/meshtastic/mesh.pb.dart';
import '../protobufs/generated/meshtastic/portnums.pb.dart';
import 'ack_waiting_radio_writer.dart';
import 'node/node_service.dart';
import 'radio_reader.dart';
part 'traceroute.g.dart';

@riverpod
Future<List<int>> traceroute(
  TracerouteRef ref,
  int nodeNum, {
  Duration timeout = const Duration(minutes: 5),
}) async {
  final logger = Logger();
  final radioWriter = ref.watch(ackWaitingRadioWriterProvider);
  final node = ref.read(nodeServiceProvider)[nodeNum];
  final packetId = radioWriter.generatePacketId();
  final completer = Completer<List<int>>();

  ref.onDispose(() {
    if (!completer.isCompleted) {
      completer.complete([]);
    }
  });

  ref.watch(radioReaderProvider).onPacketReceived().listen((packet) {
    final decoded = packet.packet.decoded;
    if (decoded.requestId == packetId &&
        decoded.portnum == PortNum.TRACEROUTE_APP) {
      final routing = RouteDiscovery.fromBuffer(decoded.payload);
      logger.i(routing);
      if (!completer.isCompleted) {
        completer.complete(routing.route);
      }
    }
  });

  await radioWriter.sendMeshPacket(
    to: nodeNum,
    channel: node?.channel ?? 0,
    portNum: PortNum.TRACEROUTE_APP,
    priority: MeshPacket_Priority.UNSET,
    wantResponse: true,
    id: packetId,
  );

  final route = await completer.future.timeout(timeout);
  return route;
}
