import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/radio_connector_state.dart';
import '../providers/breadcrumb_logger.dart';
import '../providers/radio_config/radio_config_service.dart';
import '../providers/radio_config/radio_config_uploader_service.dart';
import '../providers/radio_connector_service.dart';
import '../widgets/app_bar_connection_indicator.dart';
import 'config/confirmation_dialog.dart';

class RadioConfigScreen extends ConsumerStatefulWidget {
  const RadioConfigScreen({super.key});

  @override
  ConsumerState<RadioConfigScreen> createState() => _RadioConfigScreenState();
}

class _RadioConfigScreenState extends ConsumerState<RadioConfigScreen> {
  late SharedPreferences prefs;
  bool _telemetryEnabled = false;
  String version = '';
  String buildNumber = '';
  // ignore: do_not_use_environment
  final hash = const String.fromEnvironment('GIT_HASH');
  final _logger = Logger();

  @override
  void initState() {
    getPrefs();
    getVersion();
    _telemetryEnabled = ref.read(breadcrumbLoggerProvider).isEnabled();
    _logger.i('telemetry enabled $_telemetryEnabled');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final radioConfig = ref.watch(radioConfigServiceProvider);
    final telemetryLogger = ref.watch(breadcrumbLoggerProvider);
    final radioConfigUploader = ref.watch(radioConfigUploaderServiceProvider);
    final longName = radioConfig.configDownloaded
        ? '${radioConfig.myNodeInfo.user.longName} ⚙️'
        : 'Settings';
    final radioConnectorState = ref.watch(radioConnectorServiceProvider);
    return Scaffold(
      appBar: AppBarWithConnectionIndicator(title: longName),
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
                              context.push('/channelsConfig');
                            }
                          : null,
                      title: const Text('Channels'),
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
                      onTap: radioConnectorState is Connected
                          ? () {
                              context.push('/userConfig');
                            }
                          : null,
                      title: const Text('User'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: radioConnectorState is Connected
                          ? () {
                              context.push('/btConfig');
                            }
                          : null,
                      title: const Text('Bluetooth'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  ),
                  const Card(
                    child: ListTile(
                      title: Text('Device'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                  const Card(
                    child: ListTile(
                      title: Text('Display'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                  const Card(
                    child: ListTile(
                      title: Text('Network'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                  const Card(
                    child: ListTile(
                      title: Text('Position'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                  const Card(
                    child: ListTile(
                      title: Text('Power'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              if (telemetryLogger.canUploadLogs())
                SwitchListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  title: const Text('Upload anonymized crash logs'),
                  value: _telemetryEnabled,
                  onChanged: (value) async {
                    await prefs.setBool('telemetryEnabled', value);
                    await telemetryLogger.setEnabled(_telemetryEnabled);
                    setState(() {
                      _telemetryEnabled = value;
                    });
                  },
                ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton.icon(
                    onPressed: () async {
                      final confirmed = await showConfirmationDialog(
                        context,
                        'Shutdown device?',
                      );
                      if (!confirmed) {
                        return;
                      }
                      await radioConfigUploader.sendShutdown();
                      if (context.mounted) {
                        context.go('/');
                      }
                    },
                    label: const Text('Power Off'),
                    icon: const Icon(Icons.power_settings_new_rounded),
                  ),
                  OutlinedButton.icon(
                    onPressed: () async {
                      final confirmed = await showConfirmationDialog(
                        context,
                        'Reboot device?',
                      );
                      if (!confirmed) {
                        return;
                      }
                      await radioConfigUploader.sendReboot();
                      if (context.mounted) {
                        context.go('/');
                      }
                    },
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
              Text('$version-$buildNumber-$hash'),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> getVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    });
  }
}
