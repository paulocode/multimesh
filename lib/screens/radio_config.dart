import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/radio_connector_state.dart';
import '../providers/radio_config/radio_config_service.dart';
import '../providers/radio_connector_service.dart';

class RadioConfigScreen extends ConsumerWidget {
  const RadioConfigScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radioConfig = ref.watch(radioConfigServiceProvider);
    final longName = radioConfig.configDownloaded
        ? '${radioConfig.myNodeInfo.user.longName} ⚙️'
        : 'Settings';
    final radioConnectorState = ref.watch(radioConnectorServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(longName),
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Column(
                children: [
                  Card(
                    child: ListTile(
                      style: ListTileStyle.list,
                      onTap: radioConnectorState is Connected
                          ? () {
                              context.push('/channelQrScanner');
                            }
                          : null,
                      title: const Text('Channels (Scan QR)'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: radioConnectorState is Connected
                          ? () {
                              context.push('/loraConfig');
                            }
                          : null,
                      title: const Text('LoRa'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {},
                      title: const Text('User'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {},
                      title: const Text('Bluetooth'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {},
                      title: const Text('Device'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {},
                      title: const Text('Display'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {},
                      title: const Text('Network'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {},
                      title: const Text('Position'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () {},
                      title: const Text('Power'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
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
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  textAlign: TextAlign.justify,
                  'Meshtastic® is a registered trademark of Meshtastic LLC.'
                  ' Meshtastic software components are released under '
                  'various licenses, see GitHub for details. No warranty '
                  'is provided - use at your own risk.',
                ),
              ),
              // ignore: do_not_use_environment
              const Text(String.fromEnvironment('GIT_HASH')),
            ],
          ),
        ),
      ),
    );
  }
}
