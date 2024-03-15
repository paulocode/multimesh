import 'dart:math';

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/radio_connector_state.dart';
import '../../protobufs/generated/meshtastic/config.pb.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../ble/radio_connector.dart';
import '../ble/radio_reader.dart';
import '../ble/radio_writer.dart';
import 'radio_config_service.dart';

part 'radio_config_downloader_service.g.dart';

@Riverpod(keepAlive: true)
RadioConfigDownloaderService radioConfigDownloaderService(
  RadioConfigDownloaderServiceRef ref,
) {
  final sub = ref.listen(radioConnectorProvider, (_, next) {
    if (next is Connected) {
      ref.invalidateSelf();
    }
  });
  return RadioConfigDownloaderService(
    radioWriter: ref.watch(radioWriterProvider),
    radioReader: ref.watch(radioReaderProvider),
    radioConnectorState: sub.read(),
    // riverpod requires us to read the notifier
    radioConfigServiceProvider: () =>
        ref.read(radioConfigServiceProvider.notifier),
    onDispose: ref.onDispose,
  );
}

class RadioConfigDownloaderService {
  RadioConfigDownloaderService({
    required QueuedRadioWriter radioWriter,
    required RadioReader radioReader,
    required RadioConnectorState radioConnectorState,
    required RadioConfigService Function() radioConfigServiceProvider,
    required void Function(void Function() cb) onDispose,
  })  : _radioWriter = radioWriter,
        _radioReader = radioReader,
        _radioConfigServiceProvider = radioConfigServiceProvider,
        _radioConnectorState = radioConnectorState {
    if (_radioConnectorState is Connected) {
      _myNodeNum = 0;
      _radioConfigServiceProvider().clear();
      _requestConfig();
    }
    final subscription = _radioReader.onPacketReceived().listen(_processPacket);
    onDispose(subscription.cancel);
  }

  final QueuedRadioWriter _radioWriter;
  final RadioReader _radioReader;
  final RadioConnectorState _radioConnectorState;
  final RadioConfigService Function() _radioConfigServiceProvider;
  final _random = Random();
  final _logger = Logger();
  int _myNodeNum = 0;
  int _wantConfigId = 0;

  RadioConfigService get _radioConfigService {
    return _radioConfigServiceProvider();
  }

  Future<void> _requestConfig() async {
    _wantConfigId = _random.nextInt(0xffffffff);
    await _radioWriter.sendWantConfig(
      wantConfigId: _wantConfigId,
    );
    _radioReader.forceRead();
  }

  Future<void> _processPacket(FromRadio packet) async {
    final payloadVariant = packet.whichPayloadVariant();
    switch (payloadVariant) {
      case FromRadio_PayloadVariant.myInfo:
        await _processMyInfo(packet.myInfo);
      case FromRadio_PayloadVariant.nodeInfo:
        await _processNodeInfo(packet.nodeInfo);
      case FromRadio_PayloadVariant.config:
        await _processConfigPacket(packet.config);
      case FromRadio_PayloadVariant.configCompleteId:
        await _processConfigCompleteId(packet.configCompleteId);
      case _:
        break;
    }
  }

  Future<void> _processMyInfo(MyNodeInfo myInfo) async {
    _myNodeNum = myInfo.myNodeNum;
    await _radioConfigService.setMyNodeNum(myInfo.myNodeNum);
  }

  Future<void> _processConfigPacket(Config config) async {
    final payloadVariant = config.whichPayloadVariant();
    if (payloadVariant == Config_PayloadVariant.lora) {
      final lora = config.lora;
      await _radioConfigService.setRegion(lora.region, upload: false);
      await _radioConfigService.setModemPreset(lora.modemPreset, upload: false);
    }
  }

  Future<void> _processNodeInfo(NodeInfo nodeInfo) async {
    if (_myNodeNum == 0) {
      _logger.w('myNodeNum = 0 but received nodeInfo');
    }
    if (_myNodeNum != nodeInfo.num) {
      return;
    }
    final user = nodeInfo.user;
    await _radioConfigService.setShortName(user.shortName, upload: false);
    await _radioConfigService.setLongName(user.longName, upload: false);
    await _radioConfigService.setHwModel(user.hwModel, upload: false);
  }

  Future<void> _processConfigCompleteId(int configCompleteId) async {
    if (configCompleteId == _wantConfigId) {
      _radioConfigService.setConfigDownloaded();
    } else {
      _logger.i('Stale configCompleteId');
      await _requestConfig();
    }
  }
}
