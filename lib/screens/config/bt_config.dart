import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:protobuf/protobuf.dart';

import '../../models/radio_connector_state.dart';
import '../../protobufs/generated/meshtastic/config.pb.dart';
import '../../providers/radio_config/radio_config_service.dart';
import '../../providers/radio_config/radio_config_uploader_service.dart';
import '../../providers/radio_connector_service.dart';
import '../../widgets/app_bar_connection_indicator.dart';
import 'confirmation_dialog.dart';

class BtConfigScreen extends ConsumerStatefulWidget {
  const BtConfigScreen({super.key});

  @override
  ConsumerState<BtConfigScreen> createState() => _BtConfigScreenState();
}

class _BtConfigScreenState extends ConsumerState<BtConfigScreen> {
  late Config_BluetoothConfig _bluetoothConfig;

  @override
  void initState() {
    _bluetoothConfig =
        ref.read(radioConfigServiceProvider).bluetoothConfig.deepCopy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final prevBluetoothConfig = ref.watch(
      radioConfigServiceProvider.select((value) => value.bluetoothConfig),
    );

    final radioConnectorState = ref.watch(radioConnectorServiceProvider);
    const pairingModes = Config_BluetoothConfig_PairingMode.values;
    return Scaffold(
      appBar: const AppBarWithConnectionIndicator(title: 'Bluetooth ⚙️'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Enabled'),
                value: true,
                onChanged: (value) {},
              ),
              DropdownButtonFormField(
                value: pairingModes[0],
                decoration: const InputDecoration(label: Text('Pin type')),
                items: [
                  for (var i = 0; i < pairingModes.length; i++)
                    DropdownMenuItem(
                      value: pairingModes[i],
                      child: Text(pairingModes[i].name),
                    ),
                ],
                onChanged: (value) {},
              ),
              TextFormField(
                textInputAction: TextInputAction.done,
                onChanged: (_) {},
                onSaved: (value) {},
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Input PIN';
                  }
                  if (value.length != 6) {
                    return 'PIN must be six digits';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  alignLabelWithHint: true,
                  labelText: 'PIN',
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: radioConnectorState is Connected &&
                        prevBluetoothConfig != _bluetoothConfig
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
                            .uploadBluetoothConfig(
                              bluetoothConfig: _bluetoothConfig,
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
