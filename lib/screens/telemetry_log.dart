import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

import '../constants/app_constants.dart';
import '../providers/radio_config/radio_config_service.dart';
import '../providers/telemetry/telemetry_saver.dart';
import '../providers/telemetry/telemetry_streamer.dart';
import '../utils/extensions.dart';
import '../widgets/app_bar_connection_indicator.dart';
import 'config/confirmation_dialog.dart';

class TelemetryLogScreen extends ConsumerWidget {
  const TelemetryLogScreen({
    super.key,
    required this.nodeNum,
  });

  final int nodeNum;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final telemetryListAsync =
        ref.watch(telemetryStreamerProvider(nodeNum: nodeNum));
    final telemetryListService =
        ref.watch(telemetryStreamerProvider(nodeNum: nodeNum).notifier);
    final displayFahrenheit = ref.watch(
      radioConfigServiceProvider.select(
        (value) => value.telemetryConfig.environmentDisplayFahrenheit,
      ),
    );
    final count = telemetryListService.count;
    switch (telemetryListAsync) {
      case AsyncValue(:final valueOrNull?):
        final telemetryList = valueOrNull;
        return Scaffold(
          appBar: const AppBarWithConnectionIndicator(
            title: 'Telemetry Log',
          ),
          body: Column(
            children: [
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () async {
                      await ref.read(telemetrySaverProvider(nodeNum));
                    },
                    child: const Text('Export data'),
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      final response = await showConfirmationDialog(
                        context,
                        'Delete telemetry data?',
                      );
                      if (response) {
                        await telemetryListService.clear();
                      }
                    },
                    child: const Text('Clear data'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Text(
                        '$count telemetry record(s)',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: ListViewObserver(
                          onObserve: (resultModel) => _onListViewObserve(
                            resultModel,
                            telemetryListService,
                            telemetryList.length,
                          ),
                          child: ListView.builder(
                            itemCount: telemetryList.length,
                            itemBuilder: (context, index) {
                              final timedTelemetry = telemetryList[index];
                              final environmentMetrics =
                                  timedTelemetry.telemetry.environmentMetrics;
                              final recordTime =
                                  DateTime.fromMillisecondsSinceEpoch(
                                timedTelemetry.telemetry.time * 1000,
                              );
                              final recordTimeString = recordTime.year < 2000
                                  ? DateFormat.yMd()
                                      .add_Hms()
                                      .format(timedTelemetry.timeReceived)
                                  : DateFormat.yMd()
                                      .add_Hms()
                                      .format(recordTime);

                              final temp = displayFahrenheit
                                  ? '${environmentMetrics.temperature.cToF().toStringAsFixed(2)}° F'
                                  : '${environmentMetrics.temperature.toStringAsFixed(2)}° C';

                              return ListTile(
                                title: Text(
                                  '${count - index} $recordTimeString: '
                                  '$temp, '
                                  '${environmentMetrics.relativeHumidity.toStringAsFixed(2)} RH, '
                                  '${environmentMetrics.barometricPressure.toStringAsFixed(2)} mbar, '
                                  '${environmentMetrics.gasResistance.toStringAsFixed(2)} Ω, '
                                  '${environmentMetrics.iaq} iaq',
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      case _:
        return const Center(child: CircularProgressIndicator());
    }
  }

  void _onListViewObserve(
    ListViewObserveModel resultModel,
    TelemetryStreamer telemetryListService,
    int currentDisplayedLength,
  ) {
    final offsetToLoadNextChunk =
        ((currentDisplayedLength / BATCH_NUM_MESSAGES_TO_LOAD) - 1) *
                BATCH_NUM_MESSAGES_TO_LOAD +
            BATCH_NUM_MESSAGES_TO_LOAD * 0.75;
    final currentViewedOffset = resultModel.firstChild?.index ?? 0;
    if (currentViewedOffset > offsetToLoadNextChunk &&
        telemetryListService.count > currentDisplayedLength) {
      EasyThrottle.throttle(
        'load-older-telemetry-throttler',
        const Duration(milliseconds: 200),
        telemetryListService.loadNextChunk,
      );
    }
  }
}
