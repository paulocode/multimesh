import 'package:flutter/material.dart';

@immutable
sealed class ChatType {
  const ChatType();
}

@immutable
class DirectMessageChat extends ChatType {
  const DirectMessageChat({required this.dmNode});
  final int dmNode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DirectMessageChat &&
          runtimeType == other.runtimeType &&
          dmNode == other.dmNode;

  @override
  int get hashCode => dmNode.hashCode;
}

@immutable
class ChannelChat extends ChatType {
  const ChannelChat({required this.channel});
  final int channel;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChannelChat &&
          runtimeType == other.runtimeType &&
          channel == other.channel;

  @override
  int get hashCode => channel.hashCode;
}
