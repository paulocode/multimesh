import 'package:freezed_annotation/freezed_annotation.dart';

import '../protobufs/generated/meshtastic/channel.pb.dart';
part 'mesh_channel.freezed.dart';

@freezed
abstract class MeshChannel with _$MeshChannel {
  const factory MeshChannel({
    required String name,
    @Default(false) bool hasBlankActualName,
    required Channel_Role role,
    required List<int> key,
    required int index,
    required bool uplinkEnabled,
    required bool downlinkEnabled,
  }) = _MeshChannel;

  const MeshChannel._();

  bool get used => role != Channel_Role.DISABLED;
}
