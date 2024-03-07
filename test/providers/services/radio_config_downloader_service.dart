import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/models/radio_connector_state.dart';
import 'package:meshx/protobufs/generated/meshtastic/config.pb.dart';
import 'package:meshx/protobufs/generated/meshtastic/mesh.pb.dart';
import 'package:meshx/providers/ble/radio_reader.dart';
import 'package:meshx/providers/ble/radio_writer.dart';
import 'package:meshx/providers/services/radio_config_downloader_service.dart';
import 'package:meshx/providers/services/radio_config_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mock_stream.dart';
import 'radio_config_downloader_service.mocks.dart';

@GenerateMocks([
  RadioWriter,
  RadioReader,
  RadioConfigDownloaderService,
  RadioConfigService,
  BluetoothCharacteristic,
  BluetoothDevice,
  Connected,
  Disconnected,
])
void main() {
  late MockRadioConfigService radioConfigService;
  late MockRadioWriter radioWriter;
  late MockRadioReader radioReader;
  late MockStream<FromRadio> fromRadioStream;
  final diposers = <void Function()>[];

  setUp(() {
    radioWriter = MockRadioWriter();
    radioReader = MockRadioReader();
    radioConfigService = MockRadioConfigService();

    fromRadioStream = MockStream();
    when(radioReader.onPacketReceived()).thenAnswer((_) => fromRadioStream);

    when(radioWriter.sendWantConfig(wantConfigId: anyNamed('wantConfigId')))
        .thenAnswer((realInvocation) => Future.value());
  });

  RadioConfigDownloaderService init(RadioConnectorState radioConnectorState) =>
      RadioConfigDownloaderService(
        radioWriter: radioWriter,
        radioReader: radioReader,
        radioConnectorState: radioConnectorState,
        radioConfigServiceProvider: () => radioConfigService,
        onDispose: diposers.add,
      );

  test('init, dispose', () {
    init(MockConnected());

    for (final diposer in diposers) {
      diposer();
    }

    expect(fromRadioStream.hasListener, isFalse);
  });

  test('disconnected must not send wantConfig', () {
    init(MockDisconnected());

    verifyNever(
      radioWriter.sendWantConfig(wantConfigId: anyNamed('wantConfigId')),
    );
  });

  test('clear config upon connection', () {
    init(MockConnected());

    verify(radioConfigService.clear());
  });

  test('MyInfo packet', () async {
    init(MockConnected());

    await fromRadioStream.emit(FromRadio(myInfo: MyNodeInfo(myNodeNum: 123)));

    await untilCalled(radioConfigService.setMyNodeNum(123, upload: false))
        .timeout(const Duration(seconds: 1));
  });

  test('NodeInfo of our node', () async {
    init(MockConnected());

    await fromRadioStream.emit(FromRadio(myInfo: MyNodeInfo(myNodeNum: 123)));
    await fromRadioStream.emit(
      FromRadio(
        nodeInfo: NodeInfo(
          num: 123,
          user: User(
            shortName: 'abc',
            longName: 'abc def',
            hwModel: HardwareModel.HELTEC_V3,
          ),
        ),
      ),
    );

    verify(radioConfigService.setShortName('abc', upload: false));
    verify(radioConfigService.setLongName('abc def', upload: false));
    verify(
      radioConfigService.setHwModel(HardwareModel.HELTEC_V3, upload: false),
    );
    verify(radioConfigService.setConfigDownloaded());
  });

  test('NodeInfo of another', () async {
    init(MockConnected());

    await fromRadioStream.emit(FromRadio(myInfo: MyNodeInfo(myNodeNum: 123)));
    await fromRadioStream.emit(
      FromRadio(
        nodeInfo: NodeInfo(
          num: 456,
          user: User(
            shortName: 'abc',
            longName: 'abc def',
            hwModel: HardwareModel.HELTEC_V3,
          ),
        ),
      ),
    );

    verifyNever(
      radioConfigService.setShortName(any, upload: anyNamed('upload')),
    );
    verifyNever(radioConfigService.setLongName('abc def', upload: false));
    verifyNever(
      radioConfigService.setHwModel(HardwareModel.HELTEC_V3, upload: false),
    );
    verifyNever(radioConfigService.setConfigDownloaded());
  });

  test('Config packet', () async {
    init(MockConnected());

    await fromRadioStream.emit(FromRadio(myInfo: MyNodeInfo(myNodeNum: 123)));
    await fromRadioStream.emit(
      FromRadio(
        config: Config(
          lora: Config_LoRaConfig(
            region: Config_LoRaConfig_RegionCode.US,
          ),
        ),
      ),
    );

    verify(radioConfigService.setRegion(Config_LoRaConfig_RegionCode.US,
        upload: false));
  });
}
