import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

import '../constants/app_constants.dart';
import '../providers/telemetry/telemetry_streamer.dart';

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
    final count = telemetryListService.count;
    switch (telemetryListAsync) {
      case AsyncValue(:final valueOrNull?):
        final telemetryList = valueOrNull;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Telemetry Log'),
          ),
          body: Column(
            children: [
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Export data'),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Text(
                        '$count telemetry records',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: ListViewObserver(
                          onObserve: (resultModel) => _onListViewObserve(
                              resultModel,
                              telemetryListService,
                              telemetryList.length),
                          child: ListView.builder(
                            itemCount: telemetryList.length,
                            itemBuilder: (context, index) {
                              final telemetry = telemetryList[index];
                              final environmentMetrics =
                                  telemetry.environmentMetrics;
                              return ListTile(
                                title: Text(
                                  '${count - index} ${DateFormat.yMd().add_Hms().format(DateTime.fromMillisecondsSinceEpoch(telemetry.time * 1000))}: '
                                  '${environmentMetrics.temperature.toStringAsFixed(2)}° C, '
                                  '${environmentMetrics.relativeHumidity.toStringAsFixed(2)} RH, '
                                  '${environmentMetrics.barometricPressure.toStringAsFixed(2)} mbar, '
                                  '${environmentMetrics.gasResistance.toStringAsFixed(2)} Ω, ',
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

  void _onListViewObserve(ListViewObserveModel resultModel,
      TelemetryStreamer telemetryListService, int currentDisplayedLength) {
    final offsetToLoadNextChunk =
        ((currentDisplayedLength / BATCH_NUM_MESSAGES_TO_LOAD) - 1) *
                BATCH_NUM_MESSAGES_TO_LOAD +
            BATCH_NUM_MESSAGES_TO_LOAD * 0.75;
    final currentViewedOffset = resultModel.firstChild?.index ?? 0;
    if (currentViewedOffset > offsetToLoadNextChunk) {
      telemetryListService.loadNextChunk();
    }
  }
}
