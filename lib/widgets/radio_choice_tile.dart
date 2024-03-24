import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/mesh_radio.dart';
import '../models/radio_connector_state.dart';
import '../providers/radio_connector_service.dart';
import '../providers/reconnector.dart';
import 'connection_icon.dart';

class RadioChoiceTile extends ConsumerWidget {
  const RadioChoiceTile({
    super.key,
    required MeshRadio radio,
  }) : _radio = radio;

  final MeshRadio _radio;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectorState = ref.watch(radioConnectorServiceProvider);

    return ListTile(
      leading: ConnectionIcon(_radio.remoteId),
      onTap: () async {
        if (connectorState is Connecting) {
          return;
        }
        EasyThrottle.throttle(
          'connect-throttler',
          const Duration(milliseconds: 1000),
          () async {
            ref
                .read(reconnectorServiceProvider().notifier)
                .disableReconnectUntilNextDisconnect();
            await ref.read(radioConnectorServiceProvider.notifier).disconnect();
            await ref
                .read(radioConnectorServiceProvider.notifier)
                .connect(_radio);
          },
        );
      },
      title: Text(_radio.name),
      visualDensity: const VisualDensity(vertical: -2),
    );
  }
}
