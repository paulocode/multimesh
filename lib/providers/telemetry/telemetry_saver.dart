import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:to_csv/to_csv.dart';

import '../radio_config/radio_config_service.dart';
import '../repository/telemetry_repository.dart';
part 'telemetry_saver.g.dart';

@Riverpod(keepAlive: true)
Raw<Future<void>> telemetrySaver(TelemetrySaverRef ref, int nodeNum) async {
  final telemetryRepository = ref.watch(telemetryRepositoryProvider);
  final myNodeNum =
      ref.watch(radioConfigServiceProvider.select((value) => value.myNodeNum));
  final data =
      await telemetryRepository.get(fromNode: nodeNum, owner: myNodeNum);

  final parsedData = data.map((it) {
    final telemetry = it.telemetry;
    final environmentalMetrics = it.telemetry.environmentMetrics;
    final recordedTime =
        DateTime.fromMillisecondsSinceEpoch(telemetry.time * 1000);
    final recordedTimeString = recordedTime.year < 2000
        ? 'Unknown'
        : DateFormat.yMd().add_Hms().format(recordedTime);
    return [
      DateFormat.yMd().add_Hms().format(it.timeReceived),
      recordedTimeString,
      environmentalMetrics.temperature.toString(),
      environmentalMetrics.relativeHumidity.toString(),
      environmentalMetrics.barometricPressure.toString(),
      environmentalMetrics.gasResistance.toString(),
    ];
  }).toList();

  await myCSV(
    [
      'Time received',
      'Time recorded',
      'Temperature',
      'Relative Humidity',
      'Barometric Pressure',
      'Gas Resistance',
    ],
    parsedData,
  );
}
