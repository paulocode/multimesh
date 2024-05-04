import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/radio_connector_state.dart';
import '../providers/breadcrumb_logger.dart';
import '../providers/radio_connector_service.dart';
import 'channel_list.dart';
import 'config/confirmation_dialog.dart';
import 'map.dart';
import 'nodes.dart';
import 'radio_connection.dart';

class TabParent extends ConsumerStatefulWidget {
  const TabParent({
    super.key,
  });

  @override
  ConsumerState<TabParent> createState() => _TabParentState();
}

class _TabParentState extends ConsumerState<TabParent> {
  final _logger = Logger();

  @override
  void initState() {
    _confirmTelemetryFromUser();
    super.initState();
  }

  Future<void> _confirmTelemetryFromUser() async {
    final breadcrumbLogger = ref.read(breadcrumbLoggerProvider);
    if (!breadcrumbLogger.canUploadLogs()) {
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('telemetryEnabled')) {
      final enabled = prefs.getBool('telemetryEnabled') ?? false;
      _logger.i('telemetry enabled $enabled');
      await ref.read(breadcrumbLoggerProvider).setEnabled(enabled);
    } else {
      SchedulerBinding.instance.addPostFrameCallback((_) async {
        final telemetryEnabled = await showConfirmationDialog(
          context,
          'Upload anonymized crash data?\nThis can be later changed in settings.',
          title: 'Logs Uploader',
          positive: 'Enable',
        );
        await prefs.setBool('telemetryEnabled', telemetryEnabled);
        await ref.read(breadcrumbLoggerProvider).setEnabled(telemetryEnabled);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final radioConnectorState = ref.watch(radioConnectorServiceProvider);
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
                      Icons.cloud_off,
                      color: Theme.of(context).colorScheme.error,
                    ),
            ),
          ],
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset('assets/meshx.png'),
          ),
          title: const Row(
            children: [
              Text('Meshtastic'),
              Text(
                '®',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
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
