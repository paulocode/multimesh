import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/mesh_radio.dart';
import '../models/radio_connector_state.dart';
import '../providers/radio_config/radio_config_service.dart';
import '../providers/radio_connector_service.dart';

class RadioChoiceTile extends ConsumerWidget {
  const RadioChoiceTile({
    super.key,
    required MeshRadio radio,
  }) : _radio = radio;

  final MeshRadio _radio;

  Widget _connectionIcon(
    BuildContext context,
    RadioConnectorState radioConnectorState,
    bool configDownloaded,
  ) {
    const loadingIndicator = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            strokeWidth: 3,
          ),
        ),
      ],
    );

    switch (radioConnectorState) {
      case Connected():
        if (!configDownloaded) {
          return loadingIndicator;
        } else {
          return Icon(
            Icons.circle,
            color: Theme.of(context).colorScheme.primary,
          );
        }
      case ConnectionError():
        return Icon(
          Icons.circle,
          color: Theme.of(context).colorScheme.error,
        );
      case Connecting():
        return loadingIndicator;
      default:
        return const SizedBox(
          height: 1,
        );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radioConnectorState = ref.watch(radioConnectorServiceProvider);
    final radioConfig = ref.watch(radioConfigServiceProvider);
    final showConnectionIcon = radioConnectorState is WithRadioId &&
        radioConnectorState.radioId == _radio.remoteId;

    return ListTile(
      leading: showConnectionIcon
          ? _connectionIcon(
              context,
              radioConnectorState,
              radioConfig.configDownloaded,
            )
          : const SizedBox(height: 1),
      onTap: () async {
        await ref.read(radioConnectorServiceProvider.notifier).disconnect();
        await ref.read(radioConnectorServiceProvider.notifier).connect(_radio);
        if (radioConnectorState is ConnectionError && context.mounted) {
          final snackBar = SnackBar(
            backgroundColor: Theme.of(context).colorScheme.error,
            content: Text(
              radioConnectorState.msg,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onError),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      title: Text(_radio.name),
      visualDensity: const VisualDensity(vertical: -2),
    );
  }
}
