import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/meshtastic_constants.dart';
import '../../models/mesh_channel.dart';
import '../../protobufs/generated/meshtastic/channel.pb.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../ble/radio_reader.dart';
import 'radio_config_service.dart';

part 'channel_service.g.dart';

@Riverpod(keepAlive: true)
class ChannelService extends _$ChannelService {
  final _logger = Logger();

  @override
  List<MeshChannel> build() {
    final subscription = ref
        .watch(radioReaderProvider)
        .onPacketReceived()
        .listen(_processPacket);
    ref.onDispose(subscription.cancel);
    return List<MeshChannel>.generate(
      MESHTASTIC_MAX_CHANNELS,
      (index) => MeshChannel(name: 'DISABLED', used: false),
    );
  }

  void _processPacket(FromRadio packet) {
    if (packet.whichPayloadVariant() == FromRadio_PayloadVariant.channel) {
      final channel = packet.channel;
      if (channel.index < 0) {
        return;
      }
      final channelName = channel.settings.name.isEmpty
          ? ref.read(radioConfigServiceProvider).modemPreset.toString()
          : channel.settings.name;
      final meshChannel = MeshChannel(
        name: channelName,
        used: channel.role != Channel_Role.DISABLED,
      );
      state = [
        ...state.sublist(0, channel.index),
        meshChannel,
        ...state.sublist(channel.index + 1),
      ];
      _logger.i('Added channel');
    }
  }

  bool validateQr(String? qrValue) {
    return qrValue?.startsWith('https://meshtastic.org/e/#') ?? false;
  }
}
