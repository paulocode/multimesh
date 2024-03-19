import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/radio_connector_state.dart';
import '../providers/radio_config/radio_config_service.dart';
import '../providers/radio_connector_service.dart';

class ConnectionIcon extends ConsumerWidget {
  const ConnectionIcon(this._radioId, {super.key});

  final String _radioId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radioConfig = ref.watch(radioConfigServiceProvider);
    final radioConnectorState = ref.watch(radioConnectorServiceProvider);

    if (radioConnectorState is WithRadioId &&
        radioConnectorState.radioId != _radioId) {
      return const SizedBox(
        width: 1,
      );
    }

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
        if (!radioConfig.configDownloaded) {
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
}
