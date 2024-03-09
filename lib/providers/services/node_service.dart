import 'dart:collection';

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/mesh_node.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../ble/radio_reader.dart';

part 'node_service.g.dart';

@Riverpod(keepAlive: true)
class NodeService extends _$NodeService {
  late RadioReader _radioReader;
  final _logger = Logger();

  @override
  Map<int, MeshNode> build() {
    _radioReader = ref.watch(radioReaderProvider);
    final subscription = _radioReader.onPacketReceived().listen(_processPacket);
    ref.onDispose(subscription.cancel);
    return SplayTreeMap<int, MeshNode>();
  }

  void _processPacket(FromRadio packet) {
    if (packet.whichPayloadVariant() == FromRadio_PayloadVariant.nodeInfo) {
      final node = packet.nodeInfo;
      final user = node.user;
      final meshNode = MeshNode(
        nodeNum: node.num,
        longName: user.longName,
        shortName: user.shortName,
        channel: node.channel,
      );
      state = {node.num: meshNode, ...state};
      _logger.i('Added node');
    }
  }
}
