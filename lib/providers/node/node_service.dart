import 'dart:collection';

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/mesh_node.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../../protobufs/generated/meshtastic/mesh.pbserver.dart';
import '../../protobufs/generated/meshtastic/portnums.pb.dart';
import '../../services/interfaces/radio_reader.dart';
import '../radio_reader.dart';

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

  void _processPacket(FromRadio fromRadio) {
    late final MeshNode meshNode;
    if (fromRadio.whichPayloadVariant() == FromRadio_PayloadVariant.nodeInfo) {
      final nodeInfo = fromRadio.nodeInfo;
      meshNode = _createNode(
        channel: nodeInfo.channel,
        nodeNum: nodeInfo.num,
        user: nodeInfo.user,
        batteryLevel: nodeInfo.deviceMetrics.batteryLevel,
      );
    } else if (fromRadio.packet.decoded.portnum == PortNum.NODEINFO_APP) {
      final packet = fromRadio.packet;
      final user = User.fromBuffer(packet.decoded.payload);
      _logger.i(user);
      meshNode = _createNode(
        channel: packet.channel,
        nodeNum: packet.from,
        user: user,
        batteryLevel: null,
      );
    } else {
      return;
    }

    state = {...state, meshNode.nodeNum: meshNode};

    _logger.i('Added node');
  }

  MeshNode _createNode({
    required int channel,
    required int nodeNum,
    required User user,
    required int? batteryLevel,
  }) {
    if (user.id.trim().isEmpty) {
      final nodeNumHex = nodeNum.toRadixString(16).padLeft(4, '0');
      final shortName = nodeNumHex.substring(nodeNumHex.length - 4);
      return MeshNode(
        nodeNum: nodeNum,
        longName: '???? $shortName',
        shortName: shortName,
        channel: channel,
        id: user.id,
        lastSeen: DateTime.now(),
      );
    } else {
      return MeshNode(
        nodeNum: nodeNum,
        longName: user.longName,
        shortName: user.shortName,
        channel: channel,
        id: user.id,
        batteryLevel: batteryLevel ?? state[nodeNum]?.batteryLevel,
        hwModel: user.hwModel.toString(),
        lastSeen: DateTime.now(),
      );
    }
  }

  void notifyHasUnreadMessages(int nodeNum) {
    final node = state[nodeNum];
    if (node != null) {
      state = {...state, nodeNum: node.copyWith(hasUnreadMessages: true)};
    }
  }

  void unsetHasUnreadMessages(int nodeNum) {
    final node = state[nodeNum];
    if (node != null) {
      state = {...state, nodeNum: node.copyWith(hasUnreadMessages: false)};
    }
  }
}
