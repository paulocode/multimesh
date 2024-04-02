import 'package:freezed_annotation/freezed_annotation.dart';
part 'mesh_channel.freezed.dart';

@freezed
class MeshChannel with _$MeshChannel {
  const factory MeshChannel({
    required String name,
    required bool used,
    required List<int> key,
  }) = _MeshChannel;

  const MeshChannel._();
}
