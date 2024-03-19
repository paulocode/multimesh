import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/mesh_radio.dart';
import '../providers/radio_connector_service.dart';
import 'connection_icon.dart';

class RadioChoiceTile extends ConsumerWidget {
  const RadioChoiceTile({
    super.key,
    required MeshRadio radio,
  }) : _radio = radio;

  final MeshRadio _radio;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: ConnectionIcon(_radio.remoteId),
      onTap: () async {
        await ref.read(radioConnectorServiceProvider.notifier).disconnect();
        await ref.read(radioConnectorServiceProvider.notifier).connect(_radio);
      },
      title: Text(_radio.name),
      visualDensity: const VisualDensity(vertical: -2),
    );
  }
}
