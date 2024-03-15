import 'package:flutter/material.dart';

import '../constants/ble_constants.dart';

@immutable
sealed class ChatType {
  const ChatType({required this.toNode, required this.channel});
  final int toNode;
  final int channel;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatType &&
          runtimeType == other.runtimeType &&
          toNode == other.toNode &&
          channel == other.channel;

  @override
  int get hashCode => toNode.hashCode ^ channel.hashCode;
}

@immutable
class DirectMessageChat extends ChatType {
  const DirectMessageChat({required int dmNode})
      : super(toNode: dmNode, channel: 0);
}

@immutable
class ChannelChat extends ChatType {
  const ChannelChat({super.toNode = TO_BROADCAST, required super.channel});
}
