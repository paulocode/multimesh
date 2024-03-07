import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/radio_connector_state.dart';
import '../providers/ble/radio_connector.dart';
import 'channel_list.dart';
import 'map.dart';
import 'nodes.dart';
import 'radio_connection.dart';

class TabParent extends ConsumerWidget {
  const TabParent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radioConnectorState = ref.watch(radioConnectorProvider);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: radioConnectorState is Connected
                  ? Icon(
                      Icons.cloud_done_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : Icon(
                      Icons.cloud_off_outlined,
                      color: Theme.of(context).colorScheme.error,
                    ),
            ),
          ],
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset('assets/meshx.png'),
          ),
          title: const Text('Meshtastic'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.radio)),
              Tab(icon: Icon(Icons.message)),
              Tab(icon: Icon(Icons.map)),
              Tab(icon: Icon(Icons.connect_without_contact)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            RadioConnectionScreen(),
            ChannelListScreen(),
            MapScreen(),
            NodesScreen(),
          ],
        ),
      ),
    );
  }
}
