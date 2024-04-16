import 'dart:async';

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/traceroute_response.dart';
import '../protobufs/generated/meshtastic/mesh.pb.dart';
import '../protobufs/generated/meshtastic/portnums.pb.dart';
import 'ack_waiting_radio_writer.dart';
import 'node/node_service.dart';
import 'radio_reader.dart';
part 'traceroute.g.dart';

@riverpod
class Traceroute extends _$Traceroute {
  @override
  TracerouteResponse build(int nodeNum) {
    final logger = Logger();
    final radioWriter = ref.watch(ackWaitingRadioWriterProvider);
    final node = ref.read(nodeServiceProvider)[nodeNum];
    final packetId = radioWriter.generatePacketId();

    final listener =
        ref.watch(radioReaderProvider).onPacketReceived().listen((packet) {
      final decoded = packet.packet.decoded;
      if (decoded.requestId == packetId &&
          decoded.portnum == PortNum.TRACEROUTE_APP) {
        final routing = RouteDiscovery.fromBuffer(decoded.payload);
        logger.i(routing);
        state =
            state.copyWith(successTime: DateTime.now(), route: routing.route);
      }
    });

    ref.onDispose(listener.cancel);

    radioWriter.sendMeshPacket(
      to: nodeNum,
      channel: node?.channel ?? 0,
      portNum: PortNum.TRACEROUTE_APP,
      priority: MeshPacket_Priority.UNSET,
      wantResponse: true,
      id: packetId,
    );

    final link = ref.keepAlive();
    final timer = Timer(const Duration(minutes: 10), link.close);

    ref.onDispose(timer.cancel);

    return TracerouteResponse(attemptTime: DateTime.now());
  }
}
