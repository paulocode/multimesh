import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:protobuf/protobuf.dart';

import '../../constants/telemetry_intervals.dart';
import '../../models/radio_connector_state.dart';
import '../../protobufs/generated/meshtastic/module_config.pb.dart';
import '../../providers/radio_config/radio_config_service.dart';
import '../../providers/radio_config/radio_config_uploader_service.dart';
import '../../providers/radio_connector_service.dart';
import '../../widgets/app_bar_connection_indicator.dart';
import '../utils/confirmation_dialog.dart';
import '../utils/snackbar_message.dart';

class TelemetryConfigScreen extends ConsumerStatefulWidget {
  const TelemetryConfigScreen({super.key});

  @override
  ConsumerState<TelemetryConfigScreen> createState() =>
      _TelemetryConfigScreenState();
}

class _TelemetryConfigScreenState extends ConsumerState<TelemetryConfigScreen> {
  late ModuleConfig_TelemetryConfig _telemetryConfig;
  final _formKey = GlobalKey<FormState>();
  final _logger = Logger();

  @override
  void initState() {
    _telemetryConfig =
        ref.read(radioConfigServiceProvider).telemetryConfig.deepCopy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final prevTelemetryConfig = ref.watch(
      radioConfigServiceProvider.select((value) => value.telemetryConfig),
    );

    final radioConnectorState = ref.watch(radioConnectorServiceProvider);
    return Scaffold(
      appBar: const AppBarWithConnectionIndicator(title: 'Telemetry ⚙️'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Sensor Enabled'),
                  value: _telemetryConfig.environmentMeasurementEnabled,
                  onChanged: (value) {
                    setState(() {
                      _telemetryConfig.environmentMeasurementEnabled = value;
                    });
                  },
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Show on device screen'),
                  value: _telemetryConfig.environmentScreenEnabled,
                  onChanged: (value) {
                    setState(() {
                      _telemetryConfig.environmentScreenEnabled = value;
                    });
                  },
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Display Fahrenheit'),
                  value: _telemetryConfig.environmentDisplayFahrenheit,
                  onChanged: (value) {
                    setState(() {
                      _telemetryConfig.environmentDisplayFahrenheit = value;
                    });
                  },
                ),
                const Divider(),
                const SizedBox(height: 8),
                Text(
                  'Update intervals',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                DropdownButtonFormField(
                  value: _fromSeconds(_telemetryConfig.deviceUpdateInterval),
                  decoration:
                      const InputDecoration(label: Text('Device Metrics')),
                  items: [
                    for (var i = 0; i < TelemetryIntervals.values.length; i++)
                      DropdownMenuItem(
                        value: TelemetryIntervals.values[i],
                        child: Text(TelemetryIntervals.values[i].displayName),
                      ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _telemetryConfig.deviceUpdateInterval = value!.seconds;
                    });
                  },
                ),
                const SizedBox(height: 4),
                DropdownButtonFormField(
                  value:
                      _fromSeconds(_telemetryConfig.environmentUpdateInterval),
                  decoration:
                      const InputDecoration(label: Text('Sensor metrics')),
                  items: [
                    for (var i = 0; i < TelemetryIntervals.values.length; i++)
                      DropdownMenuItem(
                        value: TelemetryIntervals.values[i],
                        child: Text(TelemetryIntervals.values[i].displayName),
                      ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _telemetryConfig.environmentUpdateInterval =
                          value!.seconds;
                    });
                  },
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: radioConnectorState is Connected &&
                          prevTelemetryConfig != _telemetryConfig
                      ? () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          // device will reset after setting lora config
                          // so we do not have to update local config here.
                          final confirmed = await showConfirmationDialog(
                            context,
                            'Save may reboot device. Continue?',
                          );
                          if (!confirmed) {
                            return;
                          }
                          // TODO: add error handling
                          await ref
                              .read(radioConfigUploaderServiceProvider)
                              .uploadTelemetryConfig(
                                telemetryConfig: _telemetryConfig,
                              );
                          ref
                              .read(radioConfigServiceProvider.notifier)
                              .setTelemetryConfig(_telemetryConfig.deepCopy());
                          showSnackBarMessage(
                            context, // ignore: use_build_context_synchronously
                            'Saved',
                          );
                        }
                      : null,
                  label: const Text('Save'),
                  icon: const Icon(Icons.power_settings_new_rounded),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TelemetryIntervals _fromSeconds(int seconds) {
    return TelemetryIntervals.values.firstWhere(
      (element) => element.seconds == seconds,
      orElse: () {
        _logger.i('Unsupported preset seconds: $seconds');
        return TelemetryIntervals.t15m;
      },
    );
  }
}
