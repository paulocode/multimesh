import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/radio_connector_state.dart';
import '../protobufs/generated/meshtastic/config.pb.dart';
import '../providers/ble/radio_connector.dart';
import '../providers/services/radio_config_service.dart';

class RadioConfigScreen extends ConsumerStatefulWidget {
  const RadioConfigScreen({super.key});

  @override
  ConsumerState<RadioConfigScreen> createState() => _RadioConfigScreenState();
}

class _RadioConfigScreenState extends ConsumerState<RadioConfigScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final radioConfig = ref.watch(radioConfigServiceProvider);
    final radioConnectorState = ref.watch(radioConnectorProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('${radioConfig.longName} ⚙️'),
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          enabled: false,
                          initialValue: radioConfig.longName,
                          decoration: const InputDecoration(
                            label: Text('Radio Name'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                          value: Config_LoRaConfig_RegionCode.values
                              .indexOf(radioConfig.region),
                          items: [
                            for (final region
                                in Config_LoRaConfig_RegionCode.values)
                              DropdownMenuItem(
                                value: region.value,
                                child: Text(region.name),
                              ),
                          ],
                          onChanged: (value) {
                            ref
                                .read(radioConfigServiceProvider.notifier)
                                .setRegion(
                                  Config_LoRaConfig_RegionCode.values[value!],
                                );
                          },
                          decoration:
                              const InputDecoration(label: Text('Region')),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton.icon(
              onPressed: null,
              label: const Text('Save'),
              icon: const Icon(Icons.save),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                  onPressed: null,
                  label: const Text('Power Off'),
                  icon: const Icon(Icons.power_settings_new_rounded),
                ),
                OutlinedButton.icon(
                  onPressed: null,
                  label: const Text('Reboot'),
                  icon: const Icon(Icons.restart_alt),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
