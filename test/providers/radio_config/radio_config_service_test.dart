import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meshx/protobufs/generated/meshtastic/config.pb.dart';
import 'package:meshx/providers/radio_config/radio_config_service.dart';
import 'package:meshx/providers/radio_config/radio_config_uploader_service.dart';
import 'package:meshx/services/radio_config/radio_config_uploader_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../common.dart';
import 'radio_config_service_test.mocks.dart';

@GenerateMocks([RadioConfigUploaderService])
void main() {
  late ProviderContainer container;
  late MockRadioConfigUploaderService uploader;

  setUp(() {
    container = createContainer(
      overrides: [
        radioConfigUploaderServiceProvider
            .overrideWith((_) => uploader = MockRadioConfigUploaderService()),
      ],
    );
  });

  test('set lora config', () {
    final loraConfig = Config_LoRaConfig();
    container
        .read(radioConfigServiceProvider.notifier)
        .setLoraConfig(loraConfig, upload: false);

    expect(container.read(radioConfigServiceProvider).loraConfig, loraConfig);
  });

  test('upload lora config', () {
    final configService = container.read(radioConfigServiceProvider.notifier);
    final loraConfig = Config_LoRaConfig();
    configService.setLoraConfig(loraConfig);

    verify(
      uploader.setLoraConfig(
        nodeNum: anyNamed('nodeNum'),
        loraConfig: loraConfig,
      ),
    );
  });
}
