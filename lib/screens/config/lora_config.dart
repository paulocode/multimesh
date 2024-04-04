import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:protobuf/protobuf.dart';

import '../../constants/meshtastic_constants.dart';
import '../../models/radio_connector_state.dart';
import '../../protobufs/generated/meshtastic/config.pb.dart';
import '../../providers/radio_config/radio_config_service.dart';
import '../../providers/radio_config/radio_config_uploader_service.dart';
import '../../providers/radio_connector_service.dart';
import 'confirmation_dialog.dart';

class LoraConfigScreen extends ConsumerStatefulWidget {
  const LoraConfigScreen({super.key});

  @override
  ConsumerState<LoraConfigScreen> createState() => _LoraConfigScreenState();
}

class _LoraConfigScreenState extends ConsumerState<LoraConfigScreen> {
  late Config_LoRaConfig _loraConfig;

  @override
  void initState() {
    _loraConfig = ref.read(radioConfigServiceProvider).loraConfig.deepCopy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final prevLoraConfig = ref
        .watch(radioConfigServiceProvider.select((value) => value.loraConfig));

    final radioConnectorState = ref.watch(radioConnectorServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoRa ⚙️'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: radioConnectorState is Connected
                ? Icon(
                    Icons.cloud_done_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : Icon(
                    Icons.cloud_off,
                    color: Theme.of(context).colorScheme.error,
                  ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              DropdownButtonFormField(
                value: Config_LoRaConfig_RegionCode.values
                    .indexOf(_loraConfig.region),
                items: [
                  for (final region in Config_LoRaConfig_RegionCode.values)
                    DropdownMenuItem(
                      value: region.value,
                      child: Text(region.name),
                    ),
                ],
                onChanged: radioConnectorState is Connected
                    ? (value) {
                        setState(() {
                          _loraConfig.region = Config_LoRaConfig_RegionCode
                              .values[value! as int];
                        });
                      }
                    : null,
                decoration: const InputDecoration(label: Text('Region')),
              ),
              DropdownButtonFormField(
                value: Config_LoRaConfig_ModemPreset.values
                    .indexOf(_loraConfig.modemPreset),
                items: [
                  for (final preset in Config_LoRaConfig_ModemPreset.values)
                    DropdownMenuItem(
                      value: preset.value,
                      child: Text(preset.name),
                    ),
                ],
                onChanged: radioConnectorState is Connected
                    ? (value) {
                        setState(() {
                          _loraConfig.modemPreset =
                              Config_LoRaConfig_ModemPreset
                                  .values[value! as int];
                        });
                      }
                    : null,
                decoration: const InputDecoration(label: Text('Region')),
              ),
              DropdownButtonFormField(
                value: _loraConfig.hopLimit,
                items: [
                  for (var i = 0; i <= MESHTASTIC_MAX_HOPS; i++)
                    DropdownMenuItem(
                      value: i,
                      child: Text(i.toString()),
                    ),
                ],
                onChanged: radioConnectorState is Connected
                    ? (value) {
                        setState(() {
                          _loraConfig.hopLimit = value! as int;
                        });
                      }
                    : null,
                decoration: const InputDecoration(label: Text('Hops')),
              ),
              const SizedBox(
                height: 16,
              ),
              SwitchListTile(
                title: const Text('Transmit enabled'),
                value: _loraConfig.txEnabled,
                onChanged: (value) {
                  setState(() {
                    _loraConfig.txEnabled = value;
                  });
                },
              ),
              OutlinedButton.icon(
                onPressed: radioConnectorState is Connected &&
                        prevLoraConfig != _loraConfig
                    ? () async {
                        // device will reset after setting lora config
                        // so we do not have to update local config here.
                        final confirmed = await showConfirmationDialog(
                          context,
                          'Save will reboot device. Continue?',
                        );
                        if (!confirmed) {
                          return;
                        }
                        // TODO: add error handling
                        await ref
                            .read(radioConfigUploaderServiceProvider)
                            .uploadLoraConfig(
                              loraConfig: _loraConfig,
                            );
                        if (context.mounted) {
                          context.go('/');
                        }
                      }
                    : null,
                label: const Text('Save'),
                icon: const Icon(Icons.power_settings_new_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
