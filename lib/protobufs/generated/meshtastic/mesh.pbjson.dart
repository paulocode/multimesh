//
//  Generated code. Do not modify.
//  source: meshtastic/mesh.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use hardwareModelDescriptor instead')
const HardwareModel$json = {
  '1': 'HardwareModel',
  '2': [
    {'1': 'UNSET', '2': 0},
    {'1': 'TLORA_V2', '2': 1},
    {'1': 'TLORA_V1', '2': 2},
    {'1': 'TLORA_V2_1_1P6', '2': 3},
    {'1': 'TBEAM', '2': 4},
    {'1': 'HELTEC_V2_0', '2': 5},
    {'1': 'TBEAM_V0P7', '2': 6},
    {'1': 'T_ECHO', '2': 7},
    {'1': 'TLORA_V1_1P3', '2': 8},
    {'1': 'RAK4631', '2': 9},
    {'1': 'HELTEC_V2_1', '2': 10},
    {'1': 'HELTEC_V1', '2': 11},
    {'1': 'LILYGO_TBEAM_S3_CORE', '2': 12},
    {'1': 'RAK11200', '2': 13},
    {'1': 'NANO_G1', '2': 14},
    {'1': 'TLORA_V2_1_1P8', '2': 15},
    {'1': 'TLORA_T3_S3', '2': 16},
    {'1': 'NANO_G1_EXPLORER', '2': 17},
    {'1': 'NANO_G2_ULTRA', '2': 18},
    {'1': 'LORA_TYPE', '2': 19},
    {'1': 'STATION_G1', '2': 25},
    {'1': 'RAK11310', '2': 26},
    {'1': 'SENSELORA_RP2040', '2': 27},
    {'1': 'SENSELORA_S3', '2': 28},
    {'1': 'LORA_RELAY_V1', '2': 32},
    {'1': 'NRF52840DK', '2': 33},
    {'1': 'PPR', '2': 34},
    {'1': 'GENIEBLOCKS', '2': 35},
    {'1': 'NRF52_UNKNOWN', '2': 36},
    {'1': 'PORTDUINO', '2': 37},
    {'1': 'ANDROID_SIM', '2': 38},
    {'1': 'DIY_V1', '2': 39},
    {'1': 'NRF52840_PCA10059', '2': 40},
    {'1': 'DR_DEV', '2': 41},
    {'1': 'M5STACK', '2': 42},
    {'1': 'HELTEC_V3', '2': 43},
    {'1': 'HELTEC_WSL_V3', '2': 44},
    {'1': 'BETAFPV_2400_TX', '2': 45},
    {'1': 'BETAFPV_900_NANO_TX', '2': 46},
    {'1': 'RPI_PICO', '2': 47},
    {'1': 'HELTEC_WIRELESS_TRACKER', '2': 48},
    {'1': 'HELTEC_WIRELESS_PAPER', '2': 49},
    {'1': 'T_DECK', '2': 50},
    {'1': 'T_WATCH_S3', '2': 51},
    {'1': 'PICOMPUTER_S3', '2': 52},
    {'1': 'HELTEC_HT62', '2': 53},
    {'1': 'EBYTE_ESP32_S3', '2': 54},
    {'1': 'ESP32_S3_PICO', '2': 55},
    {'1': 'PRIVATE_HW', '2': 255},
  ],
};

/// Descriptor for `HardwareModel`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List hardwareModelDescriptor = $convert.base64Decode(
    'Cg1IYXJkd2FyZU1vZGVsEgkKBVVOU0VUEAASDAoIVExPUkFfVjIQARIMCghUTE9SQV9WMRACEh'
    'IKDlRMT1JBX1YyXzFfMVA2EAMSCQoFVEJFQU0QBBIPCgtIRUxURUNfVjJfMBAFEg4KClRCRUFN'
    'X1YwUDcQBhIKCgZUX0VDSE8QBxIQCgxUTE9SQV9WMV8xUDMQCBILCgdSQUs0NjMxEAkSDwoLSE'
    'VMVEVDX1YyXzEQChINCglIRUxURUNfVjEQCxIYChRMSUxZR09fVEJFQU1fUzNfQ09SRRAMEgwK'
    'CFJBSzExMjAwEA0SCwoHTkFOT19HMRAOEhIKDlRMT1JBX1YyXzFfMVA4EA8SDwoLVExPUkFfVD'
    'NfUzMQEBIUChBOQU5PX0cxX0VYUExPUkVSEBESEQoNTkFOT19HMl9VTFRSQRASEg0KCUxPUkFf'
    'VFlQRRATEg4KClNUQVRJT05fRzEQGRIMCghSQUsxMTMxMBAaEhQKEFNFTlNFTE9SQV9SUDIwND'
    'AQGxIQCgxTRU5TRUxPUkFfUzMQHBIRCg1MT1JBX1JFTEFZX1YxECASDgoKTlJGNTI4NDBESxAh'
    'EgcKA1BQUhAiEg8KC0dFTklFQkxPQ0tTECMSEQoNTlJGNTJfVU5LTk9XThAkEg0KCVBPUlREVU'
    'lOTxAlEg8KC0FORFJPSURfU0lNECYSCgoGRElZX1YxECcSFQoRTlJGNTI4NDBfUENBMTAwNTkQ'
    'KBIKCgZEUl9ERVYQKRILCgdNNVNUQUNLECoSDQoJSEVMVEVDX1YzECsSEQoNSEVMVEVDX1dTTF'
    '9WMxAsEhMKD0JFVEFGUFZfMjQwMF9UWBAtEhcKE0JFVEFGUFZfOTAwX05BTk9fVFgQLhIMCghS'
    'UElfUElDTxAvEhsKF0hFTFRFQ19XSVJFTEVTU19UUkFDS0VSEDASGQoVSEVMVEVDX1dJUkVMRV'
    'NTX1BBUEVSEDESCgoGVF9ERUNLEDISDgoKVF9XQVRDSF9TMxAzEhEKDVBJQ09NUFVURVJfUzMQ'
    'NBIPCgtIRUxURUNfSFQ2MhA1EhIKDkVCWVRFX0VTUDMyX1MzEDYSEQoNRVNQMzJfUzNfUElDTx'
    'A3Eg8KClBSSVZBVEVfSFcQ/wE=');

@$core.Deprecated('Use constantsDescriptor instead')
const Constants$json = {
  '1': 'Constants',
  '2': [
    {'1': 'ZERO', '2': 0},
    {'1': 'DATA_PAYLOAD_LEN', '2': 237},
  ],
};

/// Descriptor for `Constants`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List constantsDescriptor = $convert.base64Decode(
    'CglDb25zdGFudHMSCAoEWkVSTxAAEhUKEERBVEFfUEFZTE9BRF9MRU4Q7QE=');

@$core.Deprecated('Use criticalErrorCodeDescriptor instead')
const CriticalErrorCode$json = {
  '1': 'CriticalErrorCode',
  '2': [
    {'1': 'NONE', '2': 0},
    {'1': 'TX_WATCHDOG', '2': 1},
    {'1': 'SLEEP_ENTER_WAIT', '2': 2},
    {'1': 'NO_RADIO', '2': 3},
    {'1': 'UNSPECIFIED', '2': 4},
    {'1': 'UBLOX_UNIT_FAILED', '2': 5},
    {'1': 'NO_AXP192', '2': 6},
    {'1': 'INVALID_RADIO_SETTING', '2': 7},
    {'1': 'TRANSMIT_FAILED', '2': 8},
    {'1': 'BROWNOUT', '2': 9},
    {'1': 'SX1262_FAILURE', '2': 10},
    {'1': 'RADIO_SPI_BUG', '2': 11},
  ],
};

/// Descriptor for `CriticalErrorCode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List criticalErrorCodeDescriptor = $convert.base64Decode(
    'ChFDcml0aWNhbEVycm9yQ29kZRIICgROT05FEAASDwoLVFhfV0FUQ0hET0cQARIUChBTTEVFUF'
    '9FTlRFUl9XQUlUEAISDAoITk9fUkFESU8QAxIPCgtVTlNQRUNJRklFRBAEEhUKEVVCTE9YX1VO'
    'SVRfRkFJTEVEEAUSDQoJTk9fQVhQMTkyEAYSGQoVSU5WQUxJRF9SQURJT19TRVRUSU5HEAcSEw'
    'oPVFJBTlNNSVRfRkFJTEVEEAgSDAoIQlJPV05PVVQQCRISCg5TWDEyNjJfRkFJTFVSRRAKEhEK'
    'DVJBRElPX1NQSV9CVUcQCw==');

@$core.Deprecated('Use positionDescriptor instead')
const Position$json = {
  '1': 'Position',
  '2': [
    {'1': 'latitude_i', '3': 1, '4': 1, '5': 15, '10': 'latitudeI'},
    {'1': 'longitude_i', '3': 2, '4': 1, '5': 15, '10': 'longitudeI'},
    {'1': 'altitude', '3': 3, '4': 1, '5': 5, '10': 'altitude'},
    {'1': 'time', '3': 4, '4': 1, '5': 7, '10': 'time'},
    {
      '1': 'location_source',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.meshtastic.Position.LocSource',
      '10': 'locationSource'
    },
    {
      '1': 'altitude_source',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.meshtastic.Position.AltSource',
      '10': 'altitudeSource'
    },
    {'1': 'timestamp', '3': 7, '4': 1, '5': 7, '10': 'timestamp'},
    {
      '1': 'timestamp_millis_adjust',
      '3': 8,
      '4': 1,
      '5': 5,
      '10': 'timestampMillisAdjust'
    },
    {'1': 'altitude_hae', '3': 9, '4': 1, '5': 17, '10': 'altitudeHae'},
    {
      '1': 'altitude_geoidal_separation',
      '3': 10,
      '4': 1,
      '5': 17,
      '10': 'altitudeGeoidalSeparation'
    },
    {'1': 'PDOP', '3': 11, '4': 1, '5': 13, '10': 'PDOP'},
    {'1': 'HDOP', '3': 12, '4': 1, '5': 13, '10': 'HDOP'},
    {'1': 'VDOP', '3': 13, '4': 1, '5': 13, '10': 'VDOP'},
    {'1': 'gps_accuracy', '3': 14, '4': 1, '5': 13, '10': 'gpsAccuracy'},
    {'1': 'ground_speed', '3': 15, '4': 1, '5': 13, '10': 'groundSpeed'},
    {'1': 'ground_track', '3': 16, '4': 1, '5': 13, '10': 'groundTrack'},
    {'1': 'fix_quality', '3': 17, '4': 1, '5': 13, '10': 'fixQuality'},
    {'1': 'fix_type', '3': 18, '4': 1, '5': 13, '10': 'fixType'},
    {'1': 'sats_in_view', '3': 19, '4': 1, '5': 13, '10': 'satsInView'},
    {'1': 'sensor_id', '3': 20, '4': 1, '5': 13, '10': 'sensorId'},
    {'1': 'next_update', '3': 21, '4': 1, '5': 13, '10': 'nextUpdate'},
    {'1': 'seq_number', '3': 22, '4': 1, '5': 13, '10': 'seqNumber'},
  ],
  '4': [Position_LocSource$json, Position_AltSource$json],
};

@$core.Deprecated('Use positionDescriptor instead')
const Position_LocSource$json = {
  '1': 'LocSource',
  '2': [
    {'1': 'LOC_UNSET', '2': 0},
    {'1': 'LOC_MANUAL', '2': 1},
    {'1': 'LOC_INTERNAL', '2': 2},
    {'1': 'LOC_EXTERNAL', '2': 3},
  ],
};

@$core.Deprecated('Use positionDescriptor instead')
const Position_AltSource$json = {
  '1': 'AltSource',
  '2': [
    {'1': 'ALT_UNSET', '2': 0},
    {'1': 'ALT_MANUAL', '2': 1},
    {'1': 'ALT_INTERNAL', '2': 2},
    {'1': 'ALT_EXTERNAL', '2': 3},
    {'1': 'ALT_BAROMETRIC', '2': 4},
  ],
};

/// Descriptor for `Position`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List positionDescriptor = $convert.base64Decode(
    'CghQb3NpdGlvbhIdCgpsYXRpdHVkZV9pGAEgASgPUglsYXRpdHVkZUkSHwoLbG9uZ2l0dWRlX2'
    'kYAiABKA9SCmxvbmdpdHVkZUkSGgoIYWx0aXR1ZGUYAyABKAVSCGFsdGl0dWRlEhIKBHRpbWUY'
    'BCABKAdSBHRpbWUSRwoPbG9jYXRpb25fc291cmNlGAUgASgOMh4ubWVzaHRhc3RpYy5Qb3NpdG'
    'lvbi5Mb2NTb3VyY2VSDmxvY2F0aW9uU291cmNlEkcKD2FsdGl0dWRlX3NvdXJjZRgGIAEoDjIe'
    'Lm1lc2h0YXN0aWMuUG9zaXRpb24uQWx0U291cmNlUg5hbHRpdHVkZVNvdXJjZRIcCgl0aW1lc3'
    'RhbXAYByABKAdSCXRpbWVzdGFtcBI2Chd0aW1lc3RhbXBfbWlsbGlzX2FkanVzdBgIIAEoBVIV'
    'dGltZXN0YW1wTWlsbGlzQWRqdXN0EiEKDGFsdGl0dWRlX2hhZRgJIAEoEVILYWx0aXR1ZGVIYW'
    'USPgobYWx0aXR1ZGVfZ2VvaWRhbF9zZXBhcmF0aW9uGAogASgRUhlhbHRpdHVkZUdlb2lkYWxT'
    'ZXBhcmF0aW9uEhIKBFBET1AYCyABKA1SBFBET1ASEgoESERPUBgMIAEoDVIESERPUBISCgRWRE'
    '9QGA0gASgNUgRWRE9QEiEKDGdwc19hY2N1cmFjeRgOIAEoDVILZ3BzQWNjdXJhY3kSIQoMZ3Jv'
    'dW5kX3NwZWVkGA8gASgNUgtncm91bmRTcGVlZBIhCgxncm91bmRfdHJhY2sYECABKA1SC2dyb3'
    'VuZFRyYWNrEh8KC2ZpeF9xdWFsaXR5GBEgASgNUgpmaXhRdWFsaXR5EhkKCGZpeF90eXBlGBIg'
    'ASgNUgdmaXhUeXBlEiAKDHNhdHNfaW5fdmlldxgTIAEoDVIKc2F0c0luVmlldxIbCglzZW5zb3'
    'JfaWQYFCABKA1SCHNlbnNvcklkEh8KC25leHRfdXBkYXRlGBUgASgNUgpuZXh0VXBkYXRlEh0K'
    'CnNlcV9udW1iZXIYFiABKA1SCXNlcU51bWJlciJOCglMb2NTb3VyY2USDQoJTE9DX1VOU0VUEA'
    'ASDgoKTE9DX01BTlVBTBABEhAKDExPQ19JTlRFUk5BTBACEhAKDExPQ19FWFRFUk5BTBADImIK'
    'CUFsdFNvdXJjZRINCglBTFRfVU5TRVQQABIOCgpBTFRfTUFOVUFMEAESEAoMQUxUX0lOVEVSTk'
    'FMEAISEAoMQUxUX0VYVEVSTkFMEAMSEgoOQUxUX0JBUk9NRVRSSUMQBA==');

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'long_name', '3': 2, '4': 1, '5': 9, '10': 'longName'},
    {'1': 'short_name', '3': 3, '4': 1, '5': 9, '10': 'shortName'},
    {
      '1': 'macaddr',
      '3': 4,
      '4': 1,
      '5': 12,
      '8': {'3': true},
      '10': 'macaddr',
    },
    {
      '1': 'hw_model',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.meshtastic.HardwareModel',
      '10': 'hwModel'
    },
    {'1': 'is_licensed', '3': 6, '4': 1, '5': 8, '10': 'isLicensed'},
    {
      '1': 'role',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.meshtastic.Config.DeviceConfig.Role',
      '10': 'role'
    },
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEg4KAmlkGAEgASgJUgJpZBIbCglsb25nX25hbWUYAiABKAlSCGxvbmdOYW1lEh0KCn'
    'Nob3J0X25hbWUYAyABKAlSCXNob3J0TmFtZRIcCgdtYWNhZGRyGAQgASgMQgIYAVIHbWFjYWRk'
    'chI0Cghod19tb2RlbBgFIAEoDjIZLm1lc2h0YXN0aWMuSGFyZHdhcmVNb2RlbFIHaHdNb2RlbB'
    'IfCgtpc19saWNlbnNlZBgGIAEoCFIKaXNMaWNlbnNlZBI4CgRyb2xlGAcgASgOMiQubWVzaHRh'
    'c3RpYy5Db25maWcuRGV2aWNlQ29uZmlnLlJvbGVSBHJvbGU=');

@$core.Deprecated('Use routeDiscoveryDescriptor instead')
const RouteDiscovery$json = {
  '1': 'RouteDiscovery',
  '2': [
    {'1': 'route', '3': 1, '4': 3, '5': 7, '10': 'route'},
  ],
};

/// Descriptor for `RouteDiscovery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List routeDiscoveryDescriptor = $convert
    .base64Decode('Cg5Sb3V0ZURpc2NvdmVyeRIUCgVyb3V0ZRgBIAMoB1IFcm91dGU=');

@$core.Deprecated('Use routingDescriptor instead')
const Routing$json = {
  '1': 'Routing',
  '2': [
    {
      '1': 'route_request',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.RouteDiscovery',
      '9': 0,
      '10': 'routeRequest'
    },
    {
      '1': 'route_reply',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.RouteDiscovery',
      '9': 0,
      '10': 'routeReply'
    },
    {
      '1': 'error_reason',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.meshtastic.Routing.Error',
      '9': 0,
      '10': 'errorReason'
    },
  ],
  '4': [Routing_Error$json],
  '8': [
    {'1': 'variant'},
  ],
};

@$core.Deprecated('Use routingDescriptor instead')
const Routing_Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'NONE', '2': 0},
    {'1': 'NO_ROUTE', '2': 1},
    {'1': 'GOT_NAK', '2': 2},
    {'1': 'TIMEOUT', '2': 3},
    {'1': 'NO_INTERFACE', '2': 4},
    {'1': 'MAX_RETRANSMIT', '2': 5},
    {'1': 'NO_CHANNEL', '2': 6},
    {'1': 'TOO_LARGE', '2': 7},
    {'1': 'NO_RESPONSE', '2': 8},
    {'1': 'DUTY_CYCLE_LIMIT', '2': 9},
    {'1': 'BAD_REQUEST', '2': 32},
    {'1': 'NOT_AUTHORIZED', '2': 33},
  ],
};

/// Descriptor for `Routing`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List routingDescriptor = $convert.base64Decode(
    'CgdSb3V0aW5nEkEKDXJvdXRlX3JlcXVlc3QYASABKAsyGi5tZXNodGFzdGljLlJvdXRlRGlzY2'
    '92ZXJ5SABSDHJvdXRlUmVxdWVzdBI9Cgtyb3V0ZV9yZXBseRgCIAEoCzIaLm1lc2h0YXN0aWMu'
    'Um91dGVEaXNjb3ZlcnlIAFIKcm91dGVSZXBseRI+CgxlcnJvcl9yZWFzb24YAyABKA4yGS5tZX'
    'NodGFzdGljLlJvdXRpbmcuRXJyb3JIAFILZXJyb3JSZWFzb24iygEKBUVycm9yEggKBE5PTkUQ'
    'ABIMCghOT19ST1VURRABEgsKB0dPVF9OQUsQAhILCgdUSU1FT1VUEAMSEAoMTk9fSU5URVJGQU'
    'NFEAQSEgoOTUFYX1JFVFJBTlNNSVQQBRIOCgpOT19DSEFOTkVMEAYSDQoJVE9PX0xBUkdFEAcS'
    'DwoLTk9fUkVTUE9OU0UQCBIUChBEVVRZX0NZQ0xFX0xJTUlUEAkSDwoLQkFEX1JFUVVFU1QQIB'
    'ISCg5OT1RfQVVUSE9SSVpFRBAhQgkKB3ZhcmlhbnQ=');

@$core.Deprecated('Use dataDescriptor instead')
const Data$json = {
  '1': 'Data',
  '2': [
    {
      '1': 'portnum',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.meshtastic.PortNum',
      '10': 'portnum'
    },
    {'1': 'payload', '3': 2, '4': 1, '5': 12, '10': 'payload'},
    {'1': 'want_response', '3': 3, '4': 1, '5': 8, '10': 'wantResponse'},
    {'1': 'dest', '3': 4, '4': 1, '5': 7, '10': 'dest'},
    {'1': 'source', '3': 5, '4': 1, '5': 7, '10': 'source'},
    {'1': 'request_id', '3': 6, '4': 1, '5': 7, '10': 'requestId'},
    {'1': 'reply_id', '3': 7, '4': 1, '5': 7, '10': 'replyId'},
    {'1': 'emoji', '3': 8, '4': 1, '5': 7, '10': 'emoji'},
  ],
};

/// Descriptor for `Data`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dataDescriptor = $convert.base64Decode(
    'CgREYXRhEi0KB3BvcnRudW0YASABKA4yEy5tZXNodGFzdGljLlBvcnROdW1SB3BvcnRudW0SGA'
    'oHcGF5bG9hZBgCIAEoDFIHcGF5bG9hZBIjCg13YW50X3Jlc3BvbnNlGAMgASgIUgx3YW50UmVz'
    'cG9uc2USEgoEZGVzdBgEIAEoB1IEZGVzdBIWCgZzb3VyY2UYBSABKAdSBnNvdXJjZRIdCgpyZX'
    'F1ZXN0X2lkGAYgASgHUglyZXF1ZXN0SWQSGQoIcmVwbHlfaWQYByABKAdSB3JlcGx5SWQSFAoF'
    'ZW1vamkYCCABKAdSBWVtb2pp');

@$core.Deprecated('Use waypointDescriptor instead')
const Waypoint$json = {
  '1': 'Waypoint',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'latitude_i', '3': 2, '4': 1, '5': 15, '10': 'latitudeI'},
    {'1': 'longitude_i', '3': 3, '4': 1, '5': 15, '10': 'longitudeI'},
    {'1': 'expire', '3': 4, '4': 1, '5': 13, '10': 'expire'},
    {'1': 'locked_to', '3': 5, '4': 1, '5': 13, '10': 'lockedTo'},
    {'1': 'name', '3': 6, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 7, '4': 1, '5': 9, '10': 'description'},
    {'1': 'icon', '3': 8, '4': 1, '5': 7, '10': 'icon'},
  ],
};

/// Descriptor for `Waypoint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List waypointDescriptor = $convert.base64Decode(
    'CghXYXlwb2ludBIOCgJpZBgBIAEoDVICaWQSHQoKbGF0aXR1ZGVfaRgCIAEoD1IJbGF0aXR1ZG'
    'VJEh8KC2xvbmdpdHVkZV9pGAMgASgPUgpsb25naXR1ZGVJEhYKBmV4cGlyZRgEIAEoDVIGZXhw'
    'aXJlEhsKCWxvY2tlZF90bxgFIAEoDVIIbG9ja2VkVG8SEgoEbmFtZRgGIAEoCVIEbmFtZRIgCg'
    'tkZXNjcmlwdGlvbhgHIAEoCVILZGVzY3JpcHRpb24SEgoEaWNvbhgIIAEoB1IEaWNvbg==');

@$core.Deprecated('Use mqttClientProxyMessageDescriptor instead')
const MqttClientProxyMessage$json = {
  '1': 'MqttClientProxyMessage',
  '2': [
    {'1': 'topic', '3': 1, '4': 1, '5': 9, '10': 'topic'},
    {'1': 'data', '3': 2, '4': 1, '5': 12, '9': 0, '10': 'data'},
    {'1': 'text', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'text'},
    {'1': 'retained', '3': 4, '4': 1, '5': 8, '10': 'retained'},
  ],
  '8': [
    {'1': 'payload_variant'},
  ],
};

/// Descriptor for `MqttClientProxyMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mqttClientProxyMessageDescriptor = $convert.base64Decode(
    'ChZNcXR0Q2xpZW50UHJveHlNZXNzYWdlEhQKBXRvcGljGAEgASgJUgV0b3BpYxIUCgRkYXRhGA'
    'IgASgMSABSBGRhdGESFAoEdGV4dBgDIAEoCUgAUgR0ZXh0EhoKCHJldGFpbmVkGAQgASgIUghy'
    'ZXRhaW5lZEIRCg9wYXlsb2FkX3ZhcmlhbnQ=');

@$core.Deprecated('Use meshPacketDescriptor instead')
const MeshPacket$json = {
  '1': 'MeshPacket',
  '2': [
    {'1': 'from', '3': 1, '4': 1, '5': 7, '10': 'from'},
    {'1': 'to', '3': 2, '4': 1, '5': 7, '10': 'to'},
    {'1': 'channel', '3': 3, '4': 1, '5': 13, '10': 'channel'},
    {
      '1': 'decoded',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.Data',
      '9': 0,
      '10': 'decoded'
    },
    {'1': 'encrypted', '3': 5, '4': 1, '5': 12, '9': 0, '10': 'encrypted'},
    {'1': 'id', '3': 6, '4': 1, '5': 7, '10': 'id'},
    {'1': 'rx_time', '3': 7, '4': 1, '5': 7, '10': 'rxTime'},
    {'1': 'rx_snr', '3': 8, '4': 1, '5': 2, '10': 'rxSnr'},
    {'1': 'hop_limit', '3': 9, '4': 1, '5': 13, '10': 'hopLimit'},
    {'1': 'want_ack', '3': 10, '4': 1, '5': 8, '10': 'wantAck'},
    {
      '1': 'priority',
      '3': 11,
      '4': 1,
      '5': 14,
      '6': '.meshtastic.MeshPacket.Priority',
      '10': 'priority'
    },
    {'1': 'rx_rssi', '3': 12, '4': 1, '5': 5, '10': 'rxRssi'},
    {
      '1': 'delayed',
      '3': 13,
      '4': 1,
      '5': 14,
      '6': '.meshtastic.MeshPacket.Delayed',
      '8': {'3': true},
      '10': 'delayed',
    },
  ],
  '4': [MeshPacket_Priority$json, MeshPacket_Delayed$json],
  '8': [
    {'1': 'payload_variant'},
  ],
};

@$core.Deprecated('Use meshPacketDescriptor instead')
const MeshPacket_Priority$json = {
  '1': 'Priority',
  '2': [
    {'1': 'UNSET', '2': 0},
    {'1': 'MIN', '2': 1},
    {'1': 'BACKGROUND', '2': 10},
    {'1': 'DEFAULT', '2': 64},
    {'1': 'RELIABLE', '2': 70},
    {'1': 'ACK', '2': 120},
    {'1': 'MAX', '2': 127},
  ],
};

@$core.Deprecated('Use meshPacketDescriptor instead')
const MeshPacket_Delayed$json = {
  '1': 'Delayed',
  '2': [
    {'1': 'NO_DELAY', '2': 0},
    {'1': 'DELAYED_BROADCAST', '2': 1},
    {'1': 'DELAYED_DIRECT', '2': 2},
  ],
};

/// Descriptor for `MeshPacket`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List meshPacketDescriptor = $convert.base64Decode(
    'CgpNZXNoUGFja2V0EhIKBGZyb20YASABKAdSBGZyb20SDgoCdG8YAiABKAdSAnRvEhgKB2NoYW'
    '5uZWwYAyABKA1SB2NoYW5uZWwSLAoHZGVjb2RlZBgEIAEoCzIQLm1lc2h0YXN0aWMuRGF0YUgA'
    'UgdkZWNvZGVkEh4KCWVuY3J5cHRlZBgFIAEoDEgAUgllbmNyeXB0ZWQSDgoCaWQYBiABKAdSAm'
    'lkEhcKB3J4X3RpbWUYByABKAdSBnJ4VGltZRIVCgZyeF9zbnIYCCABKAJSBXJ4U25yEhsKCWhv'
    'cF9saW1pdBgJIAEoDVIIaG9wTGltaXQSGQoId2FudF9hY2sYCiABKAhSB3dhbnRBY2sSOwoIcH'
    'Jpb3JpdHkYCyABKA4yHy5tZXNodGFzdGljLk1lc2hQYWNrZXQuUHJpb3JpdHlSCHByaW9yaXR5'
    'EhcKB3J4X3Jzc2kYDCABKAVSBnJ4UnNzaRI8CgdkZWxheWVkGA0gASgOMh4ubWVzaHRhc3RpYy'
    '5NZXNoUGFja2V0LkRlbGF5ZWRCAhgBUgdkZWxheWVkIlsKCFByaW9yaXR5EgkKBVVOU0VUEAAS'
    'BwoDTUlOEAESDgoKQkFDS0dST1VORBAKEgsKB0RFRkFVTFQQQBIMCghSRUxJQUJMRRBGEgcKA0'
    'FDSxB4EgcKA01BWBB/IkIKB0RlbGF5ZWQSDAoITk9fREVMQVkQABIVChFERUxBWUVEX0JST0FE'
    'Q0FTVBABEhIKDkRFTEFZRURfRElSRUNUEAJCEQoPcGF5bG9hZF92YXJpYW50');

@$core.Deprecated('Use nodeInfoDescriptor instead')
const NodeInfo$json = {
  '1': 'NodeInfo',
  '2': [
    {'1': 'num', '3': 1, '4': 1, '5': 13, '10': 'num'},
    {
      '1': 'user',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.User',
      '10': 'user'
    },
    {
      '1': 'position',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.Position',
      '10': 'position'
    },
    {'1': 'snr', '3': 4, '4': 1, '5': 2, '10': 'snr'},
    {'1': 'last_heard', '3': 5, '4': 1, '5': 7, '10': 'lastHeard'},
    {
      '1': 'device_metrics',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.DeviceMetrics',
      '10': 'deviceMetrics'
    },
    {'1': 'channel', '3': 7, '4': 1, '5': 13, '10': 'channel'},
  ],
};

/// Descriptor for `NodeInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nodeInfoDescriptor = $convert.base64Decode(
    'CghOb2RlSW5mbxIQCgNudW0YASABKA1SA251bRIkCgR1c2VyGAIgASgLMhAubWVzaHRhc3RpYy'
    '5Vc2VyUgR1c2VyEjAKCHBvc2l0aW9uGAMgASgLMhQubWVzaHRhc3RpYy5Qb3NpdGlvblIIcG9z'
    'aXRpb24SEAoDc25yGAQgASgCUgNzbnISHQoKbGFzdF9oZWFyZBgFIAEoB1IJbGFzdEhlYXJkEk'
    'AKDmRldmljZV9tZXRyaWNzGAYgASgLMhkubWVzaHRhc3RpYy5EZXZpY2VNZXRyaWNzUg1kZXZp'
    'Y2VNZXRyaWNzEhgKB2NoYW5uZWwYByABKA1SB2NoYW5uZWw=');

@$core.Deprecated('Use myNodeInfoDescriptor instead')
const MyNodeInfo$json = {
  '1': 'MyNodeInfo',
  '2': [
    {'1': 'my_node_num', '3': 1, '4': 1, '5': 13, '10': 'myNodeNum'},
    {'1': 'reboot_count', '3': 8, '4': 1, '5': 13, '10': 'rebootCount'},
    {'1': 'min_app_version', '3': 11, '4': 1, '5': 13, '10': 'minAppVersion'},
  ],
};

/// Descriptor for `MyNodeInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List myNodeInfoDescriptor = $convert.base64Decode(
    'CgpNeU5vZGVJbmZvEh4KC215X25vZGVfbnVtGAEgASgNUglteU5vZGVOdW0SIQoMcmVib290X2'
    'NvdW50GAggASgNUgtyZWJvb3RDb3VudBImCg9taW5fYXBwX3ZlcnNpb24YCyABKA1SDW1pbkFw'
    'cFZlcnNpb24=');

@$core.Deprecated('Use logRecordDescriptor instead')
const LogRecord$json = {
  '1': 'LogRecord',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    {'1': 'time', '3': 2, '4': 1, '5': 7, '10': 'time'},
    {'1': 'source', '3': 3, '4': 1, '5': 9, '10': 'source'},
    {
      '1': 'level',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.meshtastic.LogRecord.Level',
      '10': 'level'
    },
  ],
  '4': [LogRecord_Level$json],
};

@$core.Deprecated('Use logRecordDescriptor instead')
const LogRecord_Level$json = {
  '1': 'Level',
  '2': [
    {'1': 'UNSET', '2': 0},
    {'1': 'CRITICAL', '2': 50},
    {'1': 'ERROR', '2': 40},
    {'1': 'WARNING', '2': 30},
    {'1': 'INFO', '2': 20},
    {'1': 'DEBUG', '2': 10},
    {'1': 'TRACE', '2': 5},
  ],
};

/// Descriptor for `LogRecord`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logRecordDescriptor = $convert.base64Decode(
    'CglMb2dSZWNvcmQSGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZRISCgR0aW1lGAIgASgHUgR0aW'
    '1lEhYKBnNvdXJjZRgDIAEoCVIGc291cmNlEjEKBWxldmVsGAQgASgOMhsubWVzaHRhc3RpYy5M'
    'b2dSZWNvcmQuTGV2ZWxSBWxldmVsIlgKBUxldmVsEgkKBVVOU0VUEAASDAoIQ1JJVElDQUwQMh'
    'IJCgVFUlJPUhAoEgsKB1dBUk5JTkcQHhIICgRJTkZPEBQSCQoFREVCVUcQChIJCgVUUkFDRRAF');

@$core.Deprecated('Use queueStatusDescriptor instead')
const QueueStatus$json = {
  '1': 'QueueStatus',
  '2': [
    {'1': 'res', '3': 1, '4': 1, '5': 5, '10': 'res'},
    {'1': 'free', '3': 2, '4': 1, '5': 13, '10': 'free'},
    {'1': 'maxlen', '3': 3, '4': 1, '5': 13, '10': 'maxlen'},
    {'1': 'mesh_packet_id', '3': 4, '4': 1, '5': 13, '10': 'meshPacketId'},
  ],
};

/// Descriptor for `QueueStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queueStatusDescriptor = $convert.base64Decode(
    'CgtRdWV1ZVN0YXR1cxIQCgNyZXMYASABKAVSA3JlcxISCgRmcmVlGAIgASgNUgRmcmVlEhYKBm'
    '1heGxlbhgDIAEoDVIGbWF4bGVuEiQKDm1lc2hfcGFja2V0X2lkGAQgASgNUgxtZXNoUGFja2V0'
    'SWQ=');

@$core.Deprecated('Use fromRadioDescriptor instead')
const FromRadio$json = {
  '1': 'FromRadio',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {
      '1': 'packet',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.MeshPacket',
      '9': 0,
      '10': 'packet'
    },
    {
      '1': 'my_info',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.MyNodeInfo',
      '9': 0,
      '10': 'myInfo'
    },
    {
      '1': 'node_info',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.NodeInfo',
      '9': 0,
      '10': 'nodeInfo'
    },
    {
      '1': 'config',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.Config',
      '9': 0,
      '10': 'config'
    },
    {
      '1': 'log_record',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.LogRecord',
      '9': 0,
      '10': 'logRecord'
    },
    {
      '1': 'config_complete_id',
      '3': 7,
      '4': 1,
      '5': 13,
      '9': 0,
      '10': 'configCompleteId'
    },
    {'1': 'rebooted', '3': 8, '4': 1, '5': 8, '9': 0, '10': 'rebooted'},
    {
      '1': 'moduleConfig',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.ModuleConfig',
      '9': 0,
      '10': 'moduleConfig'
    },
    {
      '1': 'channel',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.Channel',
      '9': 0,
      '10': 'channel'
    },
    {
      '1': 'queueStatus',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.QueueStatus',
      '9': 0,
      '10': 'queueStatus'
    },
    {
      '1': 'xmodemPacket',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.XModem',
      '9': 0,
      '10': 'xmodemPacket'
    },
    {
      '1': 'metadata',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.DeviceMetadata',
      '9': 0,
      '10': 'metadata'
    },
    {
      '1': 'mqttClientProxyMessage',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.MqttClientProxyMessage',
      '9': 0,
      '10': 'mqttClientProxyMessage'
    },
  ],
  '8': [
    {'1': 'payload_variant'},
  ],
};

/// Descriptor for `FromRadio`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fromRadioDescriptor = $convert.base64Decode(
    'CglGcm9tUmFkaW8SDgoCaWQYASABKA1SAmlkEjAKBnBhY2tldBgCIAEoCzIWLm1lc2h0YXN0aW'
    'MuTWVzaFBhY2tldEgAUgZwYWNrZXQSMQoHbXlfaW5mbxgDIAEoCzIWLm1lc2h0YXN0aWMuTXlO'
    'b2RlSW5mb0gAUgZteUluZm8SMwoJbm9kZV9pbmZvGAQgASgLMhQubWVzaHRhc3RpYy5Ob2RlSW'
    '5mb0gAUghub2RlSW5mbxIsCgZjb25maWcYBSABKAsyEi5tZXNodGFzdGljLkNvbmZpZ0gAUgZj'
    'b25maWcSNgoKbG9nX3JlY29yZBgGIAEoCzIVLm1lc2h0YXN0aWMuTG9nUmVjb3JkSABSCWxvZ1'
    'JlY29yZBIuChJjb25maWdfY29tcGxldGVfaWQYByABKA1IAFIQY29uZmlnQ29tcGxldGVJZBIc'
    'CghyZWJvb3RlZBgIIAEoCEgAUghyZWJvb3RlZBI+Cgxtb2R1bGVDb25maWcYCSABKAsyGC5tZX'
    'NodGFzdGljLk1vZHVsZUNvbmZpZ0gAUgxtb2R1bGVDb25maWcSLwoHY2hhbm5lbBgKIAEoCzIT'
    'Lm1lc2h0YXN0aWMuQ2hhbm5lbEgAUgdjaGFubmVsEjsKC3F1ZXVlU3RhdHVzGAsgASgLMhcubW'
    'VzaHRhc3RpYy5RdWV1ZVN0YXR1c0gAUgtxdWV1ZVN0YXR1cxI4Cgx4bW9kZW1QYWNrZXQYDCAB'
    'KAsyEi5tZXNodGFzdGljLlhNb2RlbUgAUgx4bW9kZW1QYWNrZXQSOAoIbWV0YWRhdGEYDSABKA'
    'syGi5tZXNodGFzdGljLkRldmljZU1ldGFkYXRhSABSCG1ldGFkYXRhElwKFm1xdHRDbGllbnRQ'
    'cm94eU1lc3NhZ2UYDiABKAsyIi5tZXNodGFzdGljLk1xdHRDbGllbnRQcm94eU1lc3NhZ2VIAF'
    'IWbXF0dENsaWVudFByb3h5TWVzc2FnZUIRCg9wYXlsb2FkX3ZhcmlhbnQ=');

@$core.Deprecated('Use toRadioDescriptor instead')
const ToRadio$json = {
  '1': 'ToRadio',
  '2': [
    {
      '1': 'packet',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.MeshPacket',
      '9': 0,
      '10': 'packet'
    },
    {
      '1': 'want_config_id',
      '3': 3,
      '4': 1,
      '5': 13,
      '9': 0,
      '10': 'wantConfigId'
    },
    {'1': 'disconnect', '3': 4, '4': 1, '5': 8, '9': 0, '10': 'disconnect'},
    {
      '1': 'xmodemPacket',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.XModem',
      '9': 0,
      '10': 'xmodemPacket'
    },
    {
      '1': 'mqttClientProxyMessage',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.MqttClientProxyMessage',
      '9': 0,
      '10': 'mqttClientProxyMessage'
    },
  ],
  '8': [
    {'1': 'payload_variant'},
  ],
};

/// Descriptor for `ToRadio`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List toRadioDescriptor = $convert.base64Decode(
    'CgdUb1JhZGlvEjAKBnBhY2tldBgBIAEoCzIWLm1lc2h0YXN0aWMuTWVzaFBhY2tldEgAUgZwYW'
    'NrZXQSJgoOd2FudF9jb25maWdfaWQYAyABKA1IAFIMd2FudENvbmZpZ0lkEiAKCmRpc2Nvbm5l'
    'Y3QYBCABKAhIAFIKZGlzY29ubmVjdBI4Cgx4bW9kZW1QYWNrZXQYBSABKAsyEi5tZXNodGFzdG'
    'ljLlhNb2RlbUgAUgx4bW9kZW1QYWNrZXQSXAoWbXF0dENsaWVudFByb3h5TWVzc2FnZRgGIAEo'
    'CzIiLm1lc2h0YXN0aWMuTXF0dENsaWVudFByb3h5TWVzc2FnZUgAUhZtcXR0Q2xpZW50UHJveH'
    'lNZXNzYWdlQhEKD3BheWxvYWRfdmFyaWFudA==');

@$core.Deprecated('Use compressedDescriptor instead')
const Compressed$json = {
  '1': 'Compressed',
  '2': [
    {
      '1': 'portnum',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.meshtastic.PortNum',
      '10': 'portnum'
    },
    {'1': 'data', '3': 2, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `Compressed`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compressedDescriptor = $convert.base64Decode(
    'CgpDb21wcmVzc2VkEi0KB3BvcnRudW0YASABKA4yEy5tZXNodGFzdGljLlBvcnROdW1SB3Bvcn'
    'RudW0SEgoEZGF0YRgCIAEoDFIEZGF0YQ==');

@$core.Deprecated('Use neighborInfoDescriptor instead')
const NeighborInfo$json = {
  '1': 'NeighborInfo',
  '2': [
    {'1': 'node_id', '3': 1, '4': 1, '5': 13, '10': 'nodeId'},
    {'1': 'last_sent_by_id', '3': 2, '4': 1, '5': 13, '10': 'lastSentById'},
    {
      '1': 'node_broadcast_interval_secs',
      '3': 3,
      '4': 1,
      '5': 13,
      '10': 'nodeBroadcastIntervalSecs'
    },
    {
      '1': 'neighbors',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.meshtastic.Neighbor',
      '10': 'neighbors'
    },
  ],
};

/// Descriptor for `NeighborInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List neighborInfoDescriptor = $convert.base64Decode(
    'CgxOZWlnaGJvckluZm8SFwoHbm9kZV9pZBgBIAEoDVIGbm9kZUlkEiUKD2xhc3Rfc2VudF9ieV'
    '9pZBgCIAEoDVIMbGFzdFNlbnRCeUlkEj8KHG5vZGVfYnJvYWRjYXN0X2ludGVydmFsX3NlY3MY'
    'AyABKA1SGW5vZGVCcm9hZGNhc3RJbnRlcnZhbFNlY3MSMgoJbmVpZ2hib3JzGAQgAygLMhQubW'
    'VzaHRhc3RpYy5OZWlnaGJvclIJbmVpZ2hib3Jz');

@$core.Deprecated('Use neighborDescriptor instead')
const Neighbor$json = {
  '1': 'Neighbor',
  '2': [
    {'1': 'node_id', '3': 1, '4': 1, '5': 13, '10': 'nodeId'},
    {'1': 'snr', '3': 2, '4': 1, '5': 2, '10': 'snr'},
    {'1': 'last_rx_time', '3': 3, '4': 1, '5': 7, '10': 'lastRxTime'},
    {
      '1': 'node_broadcast_interval_secs',
      '3': 4,
      '4': 1,
      '5': 13,
      '10': 'nodeBroadcastIntervalSecs'
    },
  ],
};

/// Descriptor for `Neighbor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List neighborDescriptor = $convert.base64Decode(
    'CghOZWlnaGJvchIXCgdub2RlX2lkGAEgASgNUgZub2RlSWQSEAoDc25yGAIgASgCUgNzbnISIA'
    'oMbGFzdF9yeF90aW1lGAMgASgHUgpsYXN0UnhUaW1lEj8KHG5vZGVfYnJvYWRjYXN0X2ludGVy'
    'dmFsX3NlY3MYBCABKA1SGW5vZGVCcm9hZGNhc3RJbnRlcnZhbFNlY3M=');

@$core.Deprecated('Use deviceMetadataDescriptor instead')
const DeviceMetadata$json = {
  '1': 'DeviceMetadata',
  '2': [
    {'1': 'firmware_version', '3': 1, '4': 1, '5': 9, '10': 'firmwareVersion'},
    {
      '1': 'device_state_version',
      '3': 2,
      '4': 1,
      '5': 13,
      '10': 'deviceStateVersion'
    },
    {'1': 'canShutdown', '3': 3, '4': 1, '5': 8, '10': 'canShutdown'},
    {'1': 'hasWifi', '3': 4, '4': 1, '5': 8, '10': 'hasWifi'},
    {'1': 'hasBluetooth', '3': 5, '4': 1, '5': 8, '10': 'hasBluetooth'},
    {'1': 'hasEthernet', '3': 6, '4': 1, '5': 8, '10': 'hasEthernet'},
    {
      '1': 'role',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.meshtastic.Config.DeviceConfig.Role',
      '10': 'role'
    },
    {'1': 'position_flags', '3': 8, '4': 1, '5': 13, '10': 'positionFlags'},
    {
      '1': 'hw_model',
      '3': 9,
      '4': 1,
      '5': 14,
      '6': '.meshtastic.HardwareModel',
      '10': 'hwModel'
    },
    {
      '1': 'hasRemoteHardware',
      '3': 10,
      '4': 1,
      '5': 8,
      '10': 'hasRemoteHardware'
    },
  ],
};

/// Descriptor for `DeviceMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceMetadataDescriptor = $convert.base64Decode(
    'Cg5EZXZpY2VNZXRhZGF0YRIpChBmaXJtd2FyZV92ZXJzaW9uGAEgASgJUg9maXJtd2FyZVZlcn'
    'Npb24SMAoUZGV2aWNlX3N0YXRlX3ZlcnNpb24YAiABKA1SEmRldmljZVN0YXRlVmVyc2lvbhIg'
    'CgtjYW5TaHV0ZG93bhgDIAEoCFILY2FuU2h1dGRvd24SGAoHaGFzV2lmaRgEIAEoCFIHaGFzV2'
    'lmaRIiCgxoYXNCbHVldG9vdGgYBSABKAhSDGhhc0JsdWV0b290aBIgCgtoYXNFdGhlcm5ldBgG'
    'IAEoCFILaGFzRXRoZXJuZXQSOAoEcm9sZRgHIAEoDjIkLm1lc2h0YXN0aWMuQ29uZmlnLkRldm'
    'ljZUNvbmZpZy5Sb2xlUgRyb2xlEiUKDnBvc2l0aW9uX2ZsYWdzGAggASgNUg1wb3NpdGlvbkZs'
    'YWdzEjQKCGh3X21vZGVsGAkgASgOMhkubWVzaHRhc3RpYy5IYXJkd2FyZU1vZGVsUgdod01vZG'
    'VsEiwKEWhhc1JlbW90ZUhhcmR3YXJlGAogASgIUhFoYXNSZW1vdGVIYXJkd2FyZQ==');
