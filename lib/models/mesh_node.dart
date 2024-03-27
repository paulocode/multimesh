import 'package:freezed_annotation/freezed_annotation.dart';
part 'mesh_node.freezed.dart';

@freezed
class MeshNode with _$MeshNode {
  const factory MeshNode({
    required int nodeNum,
    required String longName,
    String? hwModel,
    required String shortName,
    required int channel,
    required String id,
    int? batteryLevel,
    required DateTime lastSeen,
    @Default(false) bool hasUnreadMessages,
  }) = _MeshNode;

  const MeshNode._();
}
