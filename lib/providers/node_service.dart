import 'dart:collection';

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/mesh_node.dart';
import '../protobufs/generated/meshtastic/mesh.pb.dart';
import '../protobufs/generated/meshtastic/mesh.pbserver.dart';
import '../protobufs/generated/meshtastic/portnums.pb.dart';
import '../services/interfaces/radio_reader.dart';
import 'radio_reader.dart';

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
    late final User user;
    late final int nodeNum;
    late final int channel;
    late final String hwModel;
    late final int? batteryLevel;
    if (fromRadio.whichPayloadVariant() == FromRadio_PayloadVariant.nodeInfo) {
      final nodeInfo = fromRadio.nodeInfo;
      nodeNum = nodeInfo.num;
      user = nodeInfo.user;
      channel = nodeInfo.channel;
      batteryLevel = nodeInfo.deviceMetrics.batteryLevel;
      hwModel = nodeInfo.user.hwModel.toString();
    } else if (fromRadio.packet.decoded.portnum == PortNum.NODEINFO_APP) {
      final packet = fromRadio.packet;
      nodeNum = packet.from;
      user = User.fromBuffer(packet.decoded.payload);
      _logger.i(user);
      channel = packet.channel;
      batteryLevel = null;
      hwModel = user.hwModel.toString();
    } else {
      return;
    }

    late final MeshNode meshNode;

    if (user.id.trim().isEmpty) {
      final nodeNumHex = nodeNum.toRadixString(16).padLeft(4, '0');
      final shortName = nodeNumHex.substring(nodeNumHex.length - 4);
      meshNode = MeshNode(
        nodeNum: nodeNum,
        longName: '???? $shortName',
        shortName: shortName,
        channel: channel,
        id: user.id,
        batteryLevel: batteryLevel,
      );
    } else {
      meshNode = MeshNode(
        nodeNum: nodeNum,
        longName: user.longName,
        shortName: user.shortName,
        channel: channel,
        id: user.id,
        batteryLevel: batteryLevel,
        hwModel: hwModel,
      );
    }

    state = {...state, nodeNum: meshNode};

    _logger.i('Added node');
  }
}
