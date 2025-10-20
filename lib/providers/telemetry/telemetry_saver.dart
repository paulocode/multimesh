import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:csv/csv.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../utils/extensions.dart';
import '../radio_config/radio_config_service.dart';
import '../repository/telemetry_repository.dart';
import '../wrap/local_platform.dart';

part 'telemetry_saver.g.dart';

@riverpod
Raw<Future<void>> telemetrySaver(Ref ref, int nodeNum) async {
  final telemetryRepository = ref.watch(telemetryRepositoryProvider);
  final myNodeNum =
      ref.watch(radioConfigServiceProvider.select((value) => value.myNodeNum));
  final displayFahrenheit = ref.watch(
    radioConfigServiceProvider
        .select((value) => value.telemetryConfig.environmentDisplayFahrenheit),
  );

  final data =
      await telemetryRepository.get(fromNode: nodeNum, owner: myNodeNum);

  final csvBodyData = data.map((it) {
    final telemetry = it.telemetry;
    final environmentalMetrics = it.telemetry.environmentMetrics;
    final recordedTime =
        DateTime.fromMillisecondsSinceEpoch(telemetry.time * 1000);
    final recordedTimeString = recordedTime.year < 2000
        ? 'Unknown'
        : DateFormat.yMd().add_Hms().format(recordedTime);
    final temp = displayFahrenheit
        ? environmentalMetrics.temperature.cToF()
        : environmentalMetrics.temperature;
    return [
      DateFormat.yMd().add_Hms().format(it.timeReceived),
      recordedTimeString,
      temp.toString(),
      environmentalMetrics.relativeHumidity.toString(),
      environmentalMetrics.barometricPressure.toString(),
      environmentalMetrics.gasResistance.toString(),
      environmentalMetrics.iaq.toString(),
    ];
  }).toList();

  final nodeNumHex = nodeNum.toRadixString(16).padLeft(4, '0');
  final nodeNumHexLastFour = nodeNumHex.substring(nodeNumHex.length - 4);
  final formattedDate =
      DateFormat('MM-dd-yyyy-HH-mm-ss').format(DateTime.now());
  var filename = 'Telemetry-$nodeNumHexLastFour-$formattedDate';

  if (ref.read(localPlatformProvider).isWindows) {
    filename += '.';
  }

  final headerRow = [
    'Time received',
    'Time recorded',
    'Temperature ${displayFahrenheit ? 'F' : 'C'}',
    'Relative Humidity',
    'Barometric Pressure',
    'Gas Resistance',
    'IAQ',
  ];

  final csvData =
      const ListToCsvConverter().convert([headerRow, ...csvBodyData]);
  final bytes = Uint8List.fromList(utf8.encode(csvData));
  const type = MimeType.csv;
  await FileSaver.instance
      .saveAs(name: filename, bytes: bytes, fileExtension: 'csv', mimeType: type);
}
