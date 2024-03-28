import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multimesh/exceptions/mesh_radio_exception.dart';
import 'package:multimesh/models/radio_connector_state.dart';
import 'package:multimesh/protobufs/generated/meshtastic/config.pb.dart';
import 'package:multimesh/protobufs/generated/meshtastic/mesh.pb.dart';
import 'package:multimesh/providers/radio_config/radio_config_service.dart'
    hide MockRadioConfigService;
import 'package:multimesh/providers/radio_connector_service.dart'
    hide MockRadioConnectorService;
import 'package:multimesh/services/interfaces/radio_reader.dart';
import 'package:multimesh/services/queued_radio_writer.dart';
import 'package:multimesh/services/radio_config/radio_config_downloader_service.dart';

import '../../mock_stream.dart';
import 'radio_config_downloader_service_test.mocks.dart';

@GenerateMocks([
  QueuedRadioWriter,
  RadioReader,
  RadioConfigDownloaderService,
  RadioConfigService,
  BluetoothCharacteristic,
  BluetoothDevice,
  BleConnected,
  Disconnected,
  RadioConnectorService,
])
void main() {
  late MockRadioConfigService radioConfigService;
  late MockQueuedRadioWriter radioWriter;
  late MockRadioReader radioReader;
  late MockRadioConnectorService radioConnectorService;
  late MockStream<FromRadio> fromRadioStream;
  final diposers = <void Function()>[];

  setUp(() {
    radioWriter = MockQueuedRadioWriter();
    radioReader = MockRadioReader();
    radioConfigService = MockRadioConfigService();
    radioConnectorService = MockRadioConnectorService();

    fromRadioStream = MockStream();
    when(radioReader.onPacketReceived()).thenAnswer((_) => fromRadioStream);

    when(radioWriter.sendWantConfig(wantConfigId: anyNamed('wantConfigId')))
        .thenAnswer((realInvocation) => Future<void>.value());

    when(radioConnectorService.disconnect()).thenAnswer((_) async {});
  });

  RadioConfigDownloaderService init(RadioConnectorState radioConnectorState) =>
      RadioConfigDownloaderService(
        radioWriter: radioWriter,
        radioReader: radioReader,
        radioConnectorState: radioConnectorState,
        radioConfigServiceProvider: () => radioConfigService,
        disconnect: (msg) {
          radioConnectorService.disconnect(errorMsg: msg);
        },
        onDispose: diposers.add,
      );

  test('init, dispose', () {
    init(MockBleConnected());

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
    init(MockBleConnected());

    verify(radioConfigService.clear());
  });

  test('MyInfo packet', () async {
    init(MockBleConnected());

    await fromRadioStream.emit(FromRadio(myInfo: MyNodeInfo(myNodeNum: 123)));

    await untilCalled(radioConfigService.setMyNodeNum(123))
        .timeout(const Duration(seconds: 1));
  });

  test('error after wantConfig', () async {
    when(radioWriter.sendWantConfig(wantConfigId: anyNamed('wantConfigId')))
        .thenThrow(Exception());

    init(MockBleConnected());

    verify(radioConnectorService.disconnect());
  });

  test('error after wantConfig but with message', () async {
    when(radioWriter.sendWantConfig(wantConfigId: anyNamed('wantConfigId')))
        .thenThrow(const MeshRadioException(msg: '404'));

    init(MockBleConnected());

    verify(radioConnectorService.disconnect(errorMsg: '404'));
  });

  test('configId response', () async {
    init(MockBleConnected());

    final configId = verify(
      radioWriter.sendWantConfig(
        wantConfigId: captureAnyNamed('wantConfigId'),
      ),
    ).captured[0] as int;

    await fromRadioStream.emit(FromRadio(configCompleteId: configId));

    verify(radioConfigService.setConfigDownloaded());
  });

  test('wrong configId response', () async {
    init(MockBleConnected());

    final configId = verify(
      radioWriter.sendWantConfig(
        wantConfigId: captureAnyNamed('wantConfigId'),
      ),
    ).captured[0] as int;

    await fromRadioStream.emit(FromRadio(configCompleteId: configId + 1));

    verify(radioWriter.sendWantConfig(wantConfigId: anyNamed('wantConfigId')));
    verifyNever(radioConfigService.setConfigDownloaded());
  });

  test('NodeInfo of our node', () async {
    init(MockBleConnected());
    final nodeInfo = NodeInfo(
      num: 123,
      user: User(
        shortName: 'abc',
        longName: 'abc def',
        hwModel: HardwareModel.HELTEC_V3,
      ),
    );
    await fromRadioStream.emit(FromRadio(myInfo: MyNodeInfo(myNodeNum: 123)));
    await fromRadioStream.emit(
      FromRadio(
        nodeInfo: nodeInfo,
      ),
    );

    final capturedNodeInfo =
        verify(radioConfigService.setMyNodeInfo(captureAny)).captured.first
            as NodeInfo;
    expect(nodeInfo, equals(capturedNodeInfo));
    verify(radioConfigService.setHasOwnNodeInfo());
  });

  test('NodeInfo of another', () async {
    init(MockBleConnected());

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
      radioConfigService.setMyNodeInfo(any),
    );
    verifyNever(radioConfigService.setHasOwnNodeInfo());
  });

  test('LoraConfig packet', () async {
    init(MockBleConnected());
    final loraConfig = Config_LoRaConfig();
    await fromRadioStream.emit(FromRadio(myInfo: MyNodeInfo(myNodeNum: 123)));
    await fromRadioStream.emit(
      FromRadio(
        config: Config(
          lora: loraConfig,
        ),
      ),
    );

    verify(
      radioConfigService.setLoraConfig(loraConfig),
    );
  });
}
