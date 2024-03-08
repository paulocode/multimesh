import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/radio_connector_state.dart';
import '../providers/ble/radio_connector.dart';
import '../providers/services/radio_config_service.dart';

class ConnectedRadio extends ConsumerWidget {
  const ConnectedRadio({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radioConfig = ref.watch(radioConfigServiceProvider);
    final radioConnectorState = ref.watch(radioConnectorProvider);
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              radius: 40,
              child: radioConfig.configDownloaded &&
                      radioConnectorState is Connected
                  ? Text(radioConfig.shortName)
                  : Icon(
                      Icons.cloud_off,
                      color: Theme.of(context).colorScheme.error,
                      size: 40,
                    ),
            ),
          ),
          if (radioConfig.configDownloaded)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(radioConfig.longName),
                Row(
                  children: [
                    const Icon(
                      Icons.radio,
                      size: 20,
                    ),
                    Text(radioConfig.hwModel.toString()),
                  ],
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.battery_charging_full_sharp,
                      size: 20,
                    ),
                    Text('Charging'),
                  ],
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.bluetooth,
                      size: 20,
                    ),
                    Text('Bluetooth'),
                  ],
                ),
              ],
            )
          else
            Text(
              'No radio connected.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          if (radioConfig.configDownloaded)
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(12),
                    ),
                    onPressed: () {
                      context.push('/radioConfig');
                    },
                    child: const Icon(
                      Icons.settings,
                      size: 54,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
