//
//  Generated code. Do not modify.
//  source: meshtastic/telemetry.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use telemetrySensorTypeDescriptor instead')
const TelemetrySensorType$json = {
  '1': 'TelemetrySensorType',
  '2': [
    {'1': 'SENSOR_UNSET', '2': 0},
    {'1': 'BME280', '2': 1},
    {'1': 'BME680', '2': 2},
    {'1': 'MCP9808', '2': 3},
    {'1': 'INA260', '2': 4},
    {'1': 'INA219', '2': 5},
    {'1': 'BMP280', '2': 6},
    {'1': 'SHTC3', '2': 7},
    {'1': 'LPS22', '2': 8},
    {'1': 'QMC6310', '2': 9},
    {'1': 'QMI8658', '2': 10},
    {'1': 'QMC5883L', '2': 11},
    {'1': 'SHT31', '2': 12},
    {'1': 'PMSA003I', '2': 13},
    {'1': 'INA3221', '2': 14},
    {'1': 'BMP085', '2': 15},
  ],
};

/// Descriptor for `TelemetrySensorType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List telemetrySensorTypeDescriptor = $convert.base64Decode(
    'ChNUZWxlbWV0cnlTZW5zb3JUeXBlEhAKDFNFTlNPUl9VTlNFVBAAEgoKBkJNRTI4MBABEgoKBk'
    'JNRTY4MBACEgsKB01DUDk4MDgQAxIKCgZJTkEyNjAQBBIKCgZJTkEyMTkQBRIKCgZCTVAyODAQ'
    'BhIJCgVTSFRDMxAHEgkKBUxQUzIyEAgSCwoHUU1DNjMxMBAJEgsKB1FNSTg2NTgQChIMCghRTU'
    'M1ODgzTBALEgkKBVNIVDMxEAwSDAoIUE1TQTAwM0kQDRILCgdJTkEzMjIxEA4SCgoGQk1QMDg1'
    'EA8=');

@$core.Deprecated('Use deviceMetricsDescriptor instead')
const DeviceMetrics$json = {
  '1': 'DeviceMetrics',
  '2': [
    {'1': 'battery_level', '3': 1, '4': 1, '5': 13, '10': 'batteryLevel'},
    {'1': 'voltage', '3': 2, '4': 1, '5': 2, '10': 'voltage'},
    {
      '1': 'channel_utilization',
      '3': 3,
      '4': 1,
      '5': 2,
      '10': 'channelUtilization'
    },
    {'1': 'air_util_tx', '3': 4, '4': 1, '5': 2, '10': 'airUtilTx'},
    {'1': 'uptime_seconds', '3': 5, '4': 1, '5': 13, '10': 'uptimeSeconds'},
  ],
};

/// Descriptor for `DeviceMetrics`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceMetricsDescriptor = $convert.base64Decode(
    'Cg1EZXZpY2VNZXRyaWNzEiMKDWJhdHRlcnlfbGV2ZWwYASABKA1SDGJhdHRlcnlMZXZlbBIYCg'
    'd2b2x0YWdlGAIgASgCUgd2b2x0YWdlEi8KE2NoYW5uZWxfdXRpbGl6YXRpb24YAyABKAJSEmNo'
    'YW5uZWxVdGlsaXphdGlvbhIeCgthaXJfdXRpbF90eBgEIAEoAlIJYWlyVXRpbFR4EiUKDnVwdG'
    'ltZV9zZWNvbmRzGAUgASgNUg11cHRpbWVTZWNvbmRz');

@$core.Deprecated('Use environmentMetricsDescriptor instead')
const EnvironmentMetrics$json = {
  '1': 'EnvironmentMetrics',
  '2': [
    {'1': 'temperature', '3': 1, '4': 1, '5': 2, '10': 'temperature'},
    {
      '1': 'relative_humidity',
      '3': 2,
      '4': 1,
      '5': 2,
      '10': 'relativeHumidity'
    },
    {
      '1': 'barometric_pressure',
      '3': 3,
      '4': 1,
      '5': 2,
      '10': 'barometricPressure'
    },
    {'1': 'gas_resistance', '3': 4, '4': 1, '5': 2, '10': 'gasResistance'},
    {'1': 'voltage', '3': 5, '4': 1, '5': 2, '10': 'voltage'},
    {'1': 'current', '3': 6, '4': 1, '5': 2, '10': 'current'},
    {'1': 'iaq', '3': 7, '4': 1, '5': 13, '10': 'iaq'},
  ],
};

/// Descriptor for `EnvironmentMetrics`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List environmentMetricsDescriptor = $convert.base64Decode(
    'ChJFbnZpcm9ubWVudE1ldHJpY3MSIAoLdGVtcGVyYXR1cmUYASABKAJSC3RlbXBlcmF0dXJlEi'
    'sKEXJlbGF0aXZlX2h1bWlkaXR5GAIgASgCUhByZWxhdGl2ZUh1bWlkaXR5Ei8KE2Jhcm9tZXRy'
    'aWNfcHJlc3N1cmUYAyABKAJSEmJhcm9tZXRyaWNQcmVzc3VyZRIlCg5nYXNfcmVzaXN0YW5jZR'
    'gEIAEoAlINZ2FzUmVzaXN0YW5jZRIYCgd2b2x0YWdlGAUgASgCUgd2b2x0YWdlEhgKB2N1cnJl'
    'bnQYBiABKAJSB2N1cnJlbnQSEAoDaWFxGAcgASgNUgNpYXE=');

@$core.Deprecated('Use powerMetricsDescriptor instead')
const PowerMetrics$json = {
  '1': 'PowerMetrics',
  '2': [
    {'1': 'ch1_voltage', '3': 1, '4': 1, '5': 2, '10': 'ch1Voltage'},
    {'1': 'ch1_current', '3': 2, '4': 1, '5': 2, '10': 'ch1Current'},
    {'1': 'ch2_voltage', '3': 3, '4': 1, '5': 2, '10': 'ch2Voltage'},
    {'1': 'ch2_current', '3': 4, '4': 1, '5': 2, '10': 'ch2Current'},
    {'1': 'ch3_voltage', '3': 5, '4': 1, '5': 2, '10': 'ch3Voltage'},
    {'1': 'ch3_current', '3': 6, '4': 1, '5': 2, '10': 'ch3Current'},
  ],
};

/// Descriptor for `PowerMetrics`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List powerMetricsDescriptor = $convert.base64Decode(
    'CgxQb3dlck1ldHJpY3MSHwoLY2gxX3ZvbHRhZ2UYASABKAJSCmNoMVZvbHRhZ2USHwoLY2gxX2'
    'N1cnJlbnQYAiABKAJSCmNoMUN1cnJlbnQSHwoLY2gyX3ZvbHRhZ2UYAyABKAJSCmNoMlZvbHRh'
    'Z2USHwoLY2gyX2N1cnJlbnQYBCABKAJSCmNoMkN1cnJlbnQSHwoLY2gzX3ZvbHRhZ2UYBSABKA'
    'JSCmNoM1ZvbHRhZ2USHwoLY2gzX2N1cnJlbnQYBiABKAJSCmNoM0N1cnJlbnQ=');

@$core.Deprecated('Use airQualityMetricsDescriptor instead')
const AirQualityMetrics$json = {
  '1': 'AirQualityMetrics',
  '2': [
    {'1': 'pm10_standard', '3': 1, '4': 1, '5': 13, '10': 'pm10Standard'},
    {'1': 'pm25_standard', '3': 2, '4': 1, '5': 13, '10': 'pm25Standard'},
    {'1': 'pm100_standard', '3': 3, '4': 1, '5': 13, '10': 'pm100Standard'},
    {
      '1': 'pm10_environmental',
      '3': 4,
      '4': 1,
      '5': 13,
      '10': 'pm10Environmental'
    },
    {
      '1': 'pm25_environmental',
      '3': 5,
      '4': 1,
      '5': 13,
      '10': 'pm25Environmental'
    },
    {
      '1': 'pm100_environmental',
      '3': 6,
      '4': 1,
      '5': 13,
      '10': 'pm100Environmental'
    },
    {'1': 'particles_03um', '3': 7, '4': 1, '5': 13, '10': 'particles03um'},
    {'1': 'particles_05um', '3': 8, '4': 1, '5': 13, '10': 'particles05um'},
    {'1': 'particles_10um', '3': 9, '4': 1, '5': 13, '10': 'particles10um'},
    {'1': 'particles_25um', '3': 10, '4': 1, '5': 13, '10': 'particles25um'},
    {'1': 'particles_50um', '3': 11, '4': 1, '5': 13, '10': 'particles50um'},
    {'1': 'particles_100um', '3': 12, '4': 1, '5': 13, '10': 'particles100um'},
  ],
};

/// Descriptor for `AirQualityMetrics`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List airQualityMetricsDescriptor = $convert.base64Decode(
    'ChFBaXJRdWFsaXR5TWV0cmljcxIjCg1wbTEwX3N0YW5kYXJkGAEgASgNUgxwbTEwU3RhbmRhcm'
    'QSIwoNcG0yNV9zdGFuZGFyZBgCIAEoDVIMcG0yNVN0YW5kYXJkEiUKDnBtMTAwX3N0YW5kYXJk'
    'GAMgASgNUg1wbTEwMFN0YW5kYXJkEi0KEnBtMTBfZW52aXJvbm1lbnRhbBgEIAEoDVIRcG0xME'
    'Vudmlyb25tZW50YWwSLQoScG0yNV9lbnZpcm9ubWVudGFsGAUgASgNUhFwbTI1RW52aXJvbm1l'
    'bnRhbBIvChNwbTEwMF9lbnZpcm9ubWVudGFsGAYgASgNUhJwbTEwMEVudmlyb25tZW50YWwSJQ'
    'oOcGFydGljbGVzXzAzdW0YByABKA1SDXBhcnRpY2xlczAzdW0SJQoOcGFydGljbGVzXzA1dW0Y'
    'CCABKA1SDXBhcnRpY2xlczA1dW0SJQoOcGFydGljbGVzXzEwdW0YCSABKA1SDXBhcnRpY2xlcz'
    'EwdW0SJQoOcGFydGljbGVzXzI1dW0YCiABKA1SDXBhcnRpY2xlczI1dW0SJQoOcGFydGljbGVz'
    'XzUwdW0YCyABKA1SDXBhcnRpY2xlczUwdW0SJwoPcGFydGljbGVzXzEwMHVtGAwgASgNUg5wYX'
    'J0aWNsZXMxMDB1bQ==');

@$core.Deprecated('Use telemetryDescriptor instead')
const Telemetry$json = {
  '1': 'Telemetry',
  '2': [
    {'1': 'time', '3': 1, '4': 1, '5': 7, '10': 'time'},
    {
      '1': 'device_metrics',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.DeviceMetrics',
      '9': 0,
      '10': 'deviceMetrics'
    },
    {
      '1': 'environment_metrics',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.EnvironmentMetrics',
      '9': 0,
      '10': 'environmentMetrics'
    },
    {
      '1': 'air_quality_metrics',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.AirQualityMetrics',
      '9': 0,
      '10': 'airQualityMetrics'
    },
    {
      '1': 'power_metrics',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.PowerMetrics',
      '9': 0,
      '10': 'powerMetrics'
    },
  ],
  '8': [
    {'1': 'variant'},
  ],
};

/// Descriptor for `Telemetry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List telemetryDescriptor = $convert.base64Decode(
    'CglUZWxlbWV0cnkSEgoEdGltZRgBIAEoB1IEdGltZRJCCg5kZXZpY2VfbWV0cmljcxgCIAEoCz'
    'IZLm1lc2h0YXN0aWMuRGV2aWNlTWV0cmljc0gAUg1kZXZpY2VNZXRyaWNzElEKE2Vudmlyb25t'
    'ZW50X21ldHJpY3MYAyABKAsyHi5tZXNodGFzdGljLkVudmlyb25tZW50TWV0cmljc0gAUhJlbn'
    'Zpcm9ubWVudE1ldHJpY3MSTwoTYWlyX3F1YWxpdHlfbWV0cmljcxgEIAEoCzIdLm1lc2h0YXN0'
    'aWMuQWlyUXVhbGl0eU1ldHJpY3NIAFIRYWlyUXVhbGl0eU1ldHJpY3MSPwoNcG93ZXJfbWV0cm'
    'ljcxgFIAEoCzIYLm1lc2h0YXN0aWMuUG93ZXJNZXRyaWNzSABSDHBvd2VyTWV0cmljc0IJCgd2'
    'YXJpYW50');
