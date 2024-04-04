import 'dart:async';
import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/meshtastic_constants.dart';
import '../models/mesh_channel.dart';
import '../protobufs/generated/meshtastic/admin.pb.dart';
import '../protobufs/generated/meshtastic/apponly.pb.dart';
import '../protobufs/generated/meshtastic/channel.pb.dart';
import '../protobufs/generated/meshtastic/config.pb.dart';
import '../protobufs/generated/meshtastic/mesh.pb.dart';
import '../protobufs/generated/meshtastic/portnums.pb.dart';
import '../services/ack_waiting_radio_writer.dart';
import 'ack_waiting_radio_writer.dart';
import 'radio_config/radio_config_service.dart';
import 'radio_reader.dart';

part 'channel_service.g.dart';

@Riverpod(keepAlive: true)
class ChannelService extends _$ChannelService {
  final _logger = Logger();
  late AckWaitingRadioWriter _radioWriter;
  late int _myNodeNum;

  @override
  List<MeshChannel> build() {
    final subscription = ref
        .watch(radioReaderProvider)
        .onPacketReceived()
        .listen(_processPacket);

    _radioWriter = ref.watch(ackWaitingRadioWriterProvider);
    _myNodeNum = ref
        .watch(radioConfigServiceProvider.select((value) => value.myNodeNum));

    ref.onDispose(subscription.cancel);
    return List<MeshChannel>.generate(
      MESHTASTIC_MAX_CHANNELS,
      (index) => MeshChannel(
        name: 'DISABLED',
        role: Channel_Role.DISABLED,
        key: [],
        index: index,
        uplinkEnabled: false,
        downlinkEnabled: false,
      ),
    );
  }

  void _processPacket(FromRadio packet) {
    if (packet.whichPayloadVariant() == FromRadio_PayloadVariant.channel) {
      final channel = packet.channel;
      if (channel.index < 0) {
        return;
      }
      final channelName = channel.settings.name.isEmpty
          ? ref
              .read(radioConfigServiceProvider)
              .loraConfig
              .modemPreset
              .toString()
          : channel.settings.name;
      final meshChannel = MeshChannel(
        name: channelName,
        role: channel.role,
        key: channel.settings.psk,
        index: channel.index,
        uplinkEnabled: channel.settings.uplinkEnabled,
        downlinkEnabled: channel.settings.downlinkEnabled,
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
    return qrValue?.startsWith(MESHTASTIC_PREFIX_URL) ?? false;
  }

  Future<void> processQr(String? qrValue) async {
    if (!validateQr(qrValue)) {
      return;
    }

    final split = qrValue!.split('#');
    if (split.length < 2) {
      return;
    }

    final base64Value = split[1];
    late final String divBy4Len;
    if (base64Value.length % 4 != 0) {
      divBy4Len = split[1] + ('=' * (4 - (split[1].length % 4)));
    } else {
      divBy4Len = base64Value;
    }

    final bytes = base64Url.decode(divBy4Len);
    final channelSet = ChannelSet.fromBuffer(bytes);
    _logger.i(channelSet);

    final settings = channelSet.settings;
    for (var i = 0; i < MESHTASTIC_MAX_CHANNELS; i++) {
      late final AdminMessage adminMessage;
      if (i < settings.length) {
        final setting = settings[i];
        adminMessage = AdminMessage(
          setChannel: Channel(
            settings: setting,
            index: i,
            role: i == 0 ? Channel_Role.PRIMARY : Channel_Role.SECONDARY,
          ),
        );
      } else {
        adminMessage = AdminMessage(
          setChannel: Channel(
            index: i,
            settings: ChannelSettings(),
            role: Channel_Role.DISABLED,
          ),
        );
      }

      await _radioWriter.sendMeshPacket(
        to: _myNodeNum,
        portNum: PortNum.ADMIN_APP,
        payload: adminMessage.writeToBuffer(),
      );
    }

    final adminMessage =
        AdminMessage(setConfig: Config(lora: channelSet.loraConfig));
    await _radioWriter.sendMeshPacket(
      to: _myNodeNum,
      portNum: PortNum.ADMIN_APP,
      payload: adminMessage.writeToBuffer(),
    );
  }

  Future<void> updateChannel(MeshChannel channel) async {
    final adminMessage = AdminMessage(
      setChannel: Channel(
        index: channel.index,
        settings: ChannelSettings(
          psk: channel.key,
          name: channel.name,
          uplinkEnabled: channel.uplinkEnabled,
          downlinkEnabled: channel.downlinkEnabled,
        ),
        role: channel.role,
      ),
    );
    await _radioWriter.sendMeshPacket(
      to: _myNodeNum,
      portNum: PortNum.ADMIN_APP,
      payload: adminMessage.writeToBuffer(),
    );
    state = [
      ...state.sublist(0, channel.index),
      channel,
      ...state.sublist(channel.index + 1),
    ];
  }

  String generateUrl() {
    final channelSet = ChannelSet();
    for (var i = 0; i < MESHTASTIC_MAX_CHANNELS; i++) {
      final channel = state[i];
      if (channel.role != Channel_Role.DISABLED) {
        channelSet.settings.add(
          ChannelSettings(
            psk: channel.key,
            name: channel.name,
            uplinkEnabled: channel.uplinkEnabled,
            downlinkEnabled: channel.downlinkEnabled,
          ),
        );
      }
    }

    channelSet.loraConfig = ref.read(radioConfigServiceProvider).loraConfig;
    return MESHTASTIC_PREFIX_URL +
        base64.encode(channelSet.writeToBuffer()).replaceAll('=', '');
  }
}
