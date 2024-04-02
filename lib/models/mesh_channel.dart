import 'package:freezed_annotation/freezed_annotation.dart';

import '../protobufs/generated/meshtastic/channel.pb.dart';
part 'mesh_channel.freezed.dart';

@freezed
class MeshChannel with _$MeshChannel {
  const factory MeshChannel({
    required String name,
    required Channel_Role role,
    required List<int> key,
    required int index,
  }) = _MeshChannel;

  const MeshChannel._();

  bool get used => role != Channel_Role.DISABLED;
}
