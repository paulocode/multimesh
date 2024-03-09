import 'package:flutter/material.dart';

@immutable
sealed class ChatType {
  const ChatType({required this.channel});
  final int channel;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatType &&
          runtimeType == other.runtimeType &&
          channel == other.channel;

  @override
  int get hashCode => channel.hashCode;
}

@immutable
class DirectMessageChat extends ChatType {
  const DirectMessageChat({required this.dmNode, required super.channel});
  final int dmNode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is DirectMessageChat &&
          runtimeType == other.runtimeType &&
          dmNode == other.dmNode;

  @override
  int get hashCode => super.hashCode ^ dmNode.hashCode;
}

@immutable
class ChannelChat extends ChatType {
  const ChannelChat({required super.channel});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is ChannelChat &&
          runtimeType == other.runtimeType;
}
