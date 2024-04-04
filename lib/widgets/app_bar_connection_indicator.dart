import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/radio_connector_state.dart';
import '../providers/radio_connector_service.dart';

class AppBarWithConnectionIndicator extends ConsumerWidget
    implements PreferredSizeWidget {
  const AppBarWithConnectionIndicator({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radioConnectorState = ref.watch(radioConnectorServiceProvider);
    return AppBar(
      title: Text(title),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
