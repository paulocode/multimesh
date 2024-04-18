//
//  Generated code. Do not modify.
//  source: meshtastic/module_config.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use remoteHardwarePinTypeDescriptor instead')
const RemoteHardwarePinType$json = {
  '1': 'RemoteHardwarePinType',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'DIGITAL_READ', '2': 1},
    {'1': 'DIGITAL_WRITE', '2': 2},
  ],
};

/// Descriptor for `RemoteHardwarePinType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List remoteHardwarePinTypeDescriptor = $convert.base64Decode(
    'ChVSZW1vdGVIYXJkd2FyZVBpblR5cGUSCwoHVU5LTk9XThAAEhAKDERJR0lUQUxfUkVBRBABEh'
    'EKDURJR0lUQUxfV1JJVEUQAg==');

@$core.Deprecated('Use moduleConfigDescriptor instead')
const ModuleConfig$json = {
  '1': 'ModuleConfig',
  '2': [
    {'1': 'mqtt', '3': 1, '4': 1, '5': 11, '6': '.meshtastic.ModuleConfig.MQTTConfig', '9': 0, '10': 'mqtt'},
    {'1': 'serial', '3': 2, '4': 1, '5': 11, '6': '.meshtastic.ModuleConfig.SerialConfig', '9': 0, '10': 'serial'},
    {'1': 'external_notification', '3': 3, '4': 1, '5': 11, '6': '.meshtastic.ModuleConfig.ExternalNotificationConfig', '9': 0, '10': 'externalNotification'},
    {'1': 'store_forward', '3': 4, '4': 1, '5': 11, '6': '.meshtastic.ModuleConfig.StoreForwardConfig', '9': 0, '10': 'storeForward'},
    {'1': 'range_test', '3': 5, '4': 1, '5': 11, '6': '.meshtastic.ModuleConfig.RangeTestConfig', '9': 0, '10': 'rangeTest'},
    {'1': 'telemetry', '3': 6, '4': 1, '5': 11, '6': '.meshtastic.ModuleConfig.TelemetryConfig', '9': 0, '10': 'telemetry'},
    {'1': 'canned_message', '3': 7, '4': 1, '5': 11, '6': '.meshtastic.ModuleConfig.CannedMessageConfig', '9': 0, '10': 'cannedMessage'},
    {'1': 'audio', '3': 8, '4': 1, '5': 11, '6': '.meshtastic.ModuleConfig.AudioConfig', '9': 0, '10': 'audio'},
    {'1': 'remote_hardware', '3': 9, '4': 1, '5': 11, '6': '.meshtastic.ModuleConfig.RemoteHardwareConfig', '9': 0, '10': 'remoteHardware'},
    {'1': 'neighbor_info', '3': 10, '4': 1, '5': 11, '6': '.meshtastic.ModuleConfig.NeighborInfoConfig', '9': 0, '10': 'neighborInfo'},
    {'1': 'ambient_lighting', '3': 11, '4': 1, '5': 11, '6': '.meshtastic.ModuleConfig.AmbientLightingConfig', '9': 0, '10': 'ambientLighting'},
    {'1': 'detection_sensor', '3': 12, '4': 1, '5': 11, '6': '.meshtastic.ModuleConfig.DetectionSensorConfig', '9': 0, '10': 'detectionSensor'},
    {'1': 'paxcounter', '3': 13, '4': 1, '5': 11, '6': '.meshtastic.ModuleConfig.PaxcounterConfig', '9': 0, '10': 'paxcounter'},
  ],
  '3': [ModuleConfig_MQTTConfig$json, ModuleConfig_MapReportSettings$json, ModuleConfig_RemoteHardwareConfig$json, ModuleConfig_NeighborInfoConfig$json, ModuleConfig_DetectionSensorConfig$json, ModuleConfig_AudioConfig$json, ModuleConfig_PaxcounterConfig$json, ModuleConfig_SerialConfig$json, ModuleConfig_ExternalNotificationConfig$json, ModuleConfig_StoreForwardConfig$json, ModuleConfig_RangeTestConfig$json, ModuleConfig_TelemetryConfig$json, ModuleConfig_CannedMessageConfig$json, ModuleConfig_AmbientLightingConfig$json],
  '8': [
    {'1': 'payload_variant'},
  ],
};

@$core.Deprecated('Use moduleConfigDescriptor instead')
const ModuleConfig_MQTTConfig$json = {
  '1': 'MQTTConfig',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
    {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
    {'1': 'username', '3': 3, '4': 1, '5': 9, '10': 'username'},
    {'1': 'password', '3': 4, '4': 1, '5': 9, '10': 'password'},
    {'1': 'encryption_enabled', '3': 5, '4': 1, '5': 8, '10': 'encryptionEnabled'},
    {'1': 'json_enabled', '3': 6, '4': 1, '5': 8, '10': 'jsonEnabled'},
    {'1': 'tls_enabled', '3': 7, '4': 1, '5': 8, '10': 'tlsEnabled'},
    {'1': 'root', '3': 8, '4': 1, '5': 9, '10': 'root'},
    {'1': 'proxy_to_client_enabled', '3': 9, '4': 1, '5': 8, '10': 'proxyToClientEnabled'},
    {'1': 'map_reporting_enabled', '3': 10, '4': 1, '5': 8, '10': 'mapReportingEnabled'},
    {'1': 'map_report_settings', '3': 11, '4': 1, '5': 11, '6': '.meshtastic.ModuleConfig.MapReportSettings', '10': 'mapReportSettings'},
  ],
};

@$core.Deprecated('Use moduleConfigDescriptor instead')
const ModuleConfig_MapReportSettings$json = {
  '1': 'MapReportSettings',
  '2': [
    {'1': 'publish_interval_secs', '3': 1, '4': 1, '5': 13, '10': 'publishIntervalSecs'},
    {'1': 'position_precision', '3': 2, '4': 1, '5': 13, '10': 'positionPrecision'},
  ],
};

@$core.Deprecated('Use moduleConfigDescriptor instead')
const ModuleConfig_RemoteHardwareConfig$json = {
  '1': 'RemoteHardwareConfig',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
    {'1': 'allow_undefined_pin_access', '3': 2, '4': 1, '5': 8, '10': 'allowUndefinedPinAccess'},
    {'1': 'available_pins', '3': 3, '4': 3, '5': 11, '6': '.meshtastic.RemoteHardwarePin', '10': 'availablePins'},
  ],
};

@$core.Deprecated('Use moduleConfigDescriptor instead')
const ModuleConfig_NeighborInfoConfig$json = {
  '1': 'NeighborInfoConfig',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
    {'1': 'update_interval', '3': 2, '4': 1, '5': 13, '10': 'updateInterval'},
  ],
};

@$core.Deprecated('Use moduleConfigDescriptor instead')
const ModuleConfig_DetectionSensorConfig$json = {
  '1': 'DetectionSensorConfig',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
    {'1': 'minimum_broadcast_secs', '3': 2, '4': 1, '5': 13, '10': 'minimumBroadcastSecs'},
    {'1': 'state_broadcast_secs', '3': 3, '4': 1, '5': 13, '10': 'stateBroadcastSecs'},
    {'1': 'send_bell', '3': 4, '4': 1, '5': 8, '10': 'sendBell'},
    {'1': 'name', '3': 5, '4': 1, '5': 9, '10': 'name'},
    {'1': 'monitor_pin', '3': 6, '4': 1, '5': 13, '10': 'monitorPin'},
    {'1': 'detection_triggered_high', '3': 7, '4': 1, '5': 8, '10': 'detectionTriggeredHigh'},
    {'1': 'use_pullup', '3': 8, '4': 1, '5': 8, '10': 'usePullup'},
  ],
};

@$core.Deprecated('Use moduleConfigDescriptor instead')
const ModuleConfig_AudioConfig$json = {
  '1': 'AudioConfig',
  '2': [
    {'1': 'codec2_enabled', '3': 1, '4': 1, '5': 8, '10': 'codec2Enabled'},
    {'1': 'ptt_pin', '3': 2, '4': 1, '5': 13, '10': 'pttPin'},
    {'1': 'bitrate', '3': 3, '4': 1, '5': 14, '6': '.meshtastic.ModuleConfig.AudioConfig.Audio_Baud', '10': 'bitrate'},
    {'1': 'i2s_ws', '3': 4, '4': 1, '5': 13, '10': 'i2sWs'},
    {'1': 'i2s_sd', '3': 5, '4': 1, '5': 13, '10': 'i2sSd'},
    {'1': 'i2s_din', '3': 6, '4': 1, '5': 13, '10': 'i2sDin'},
    {'1': 'i2s_sck', '3': 7, '4': 1, '5': 13, '10': 'i2sSck'},
  ],
  '4': [ModuleConfig_AudioConfig_Audio_Baud$json],
};

@$core.Deprecated('Use moduleConfigDescriptor instead')
const ModuleConfig_AudioConfig_Audio_Baud$json = {
  '1': 'Audio_Baud',
  '2': [
    {'1': 'CODEC2_DEFAULT', '2': 0},
    {'1': 'CODEC2_3200', '2': 1},
    {'1': 'CODEC2_2400', '2': 2},
    {'1': 'CODEC2_1600', '2': 3},
    {'1': 'CODEC2_1400', '2': 4},
    {'1': 'CODEC2_1300', '2': 5},
    {'1': 'CODEC2_1200', '2': 6},
    {'1': 'CODEC2_700', '2': 7},
    {'1': 'CODEC2_700B', '2': 8},
  ],
};

@$core.Deprecated('Use moduleConfigDescriptor instead')
const ModuleConfig_PaxcounterConfig$json = {
  '1': 'PaxcounterConfig',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
    {'1': 'paxcounter_update_interval', '3': 2, '4': 1, '5': 13, '10': 'paxcounterUpdateInterval'},
  ],
};

@$core.Deprecated('Use moduleConfigDescriptor instead')
const ModuleConfig_SerialConfig$json = {
  '1': 'SerialConfig',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
    {'1': 'echo', '3': 2, '4': 1, '5': 8, '10': 'echo'},
    {'1': 'rxd', '3': 3, '4': 1, '5': 13, '10': 'rxd'},
    {'1': 'txd', '3': 4, '4': 1, '5': 13, '10': 'txd'},
    {'1': 'baud', '3': 5, '4': 1, '5': 14, '6': '.meshtastic.ModuleConfig.SerialConfig.Serial_Baud', '10': 'baud'},
    {'1': 'timeout', '3': 6, '4': 1, '5': 13, '10': 'timeout'},
    {'1': 'mode', '3': 7, '4': 1, '5': 14, '6': '.meshtastic.ModuleConfig.SerialConfig.Serial_Mode', '10': 'mode'},
    {'1': 'override_console_serial_port', '3': 8, '4': 1, '5': 8, '10': 'overrideConsoleSerialPort'},
  ],
  '4': [ModuleConfig_SerialConfig_Serial_Baud$json, ModuleConfig_SerialConfig_Serial_Mode$json],
};

@$core.Deprecated('Use moduleConfigDescriptor instead')
const ModuleConfig_SerialConfig_Serial_Baud$json = {
  '1': 'Serial_Baud',
  '2': [
    {'1': 'BAUD_DEFAULT', '2': 0},
    {'1': 'BAUD_110', '2': 1},
    {'1': 'BAUD_300', '2': 2},
    {'1': 'BAUD_600', '2': 3},
    {'1': 'BAUD_1200', '2': 4},
    {'1': 'BAUD_2400', '2': 5},
    {'1': 'BAUD_4800', '2': 6},
    {'1': 'BAUD_9600', '2': 7},
    {'1': 'BAUD_19200', '2': 8},
    {'1': 'BAUD_38400', '2': 9},
    {'1': 'BAUD_57600', '2': 10},
    {'1': 'BAUD_115200', '2': 11},
    {'1': 'BAUD_230400', '2': 12},
    {'1': 'BAUD_460800', '2': 13},
    {'1': 'BAUD_576000', '2': 14},
    {'1': 'BAUD_921600', '2': 15},
  ],
};

@$core.Deprecated('Use moduleConfigDescriptor instead')
const ModuleConfig_SerialConfig_Serial_Mode$json = {
  '1': 'Serial_Mode',
  '2': [
    {'1': 'DEFAULT', '2': 0},
    {'1': 'SIMPLE', '2': 1},
    {'1': 'PROTO', '2': 2},
    {'1': 'TEXTMSG', '2': 3},
    {'1': 'NMEA', '2': 4},
    {'1': 'CALTOPO', '2': 5},
  ],
};

@$core.Deprecated('Use moduleConfigDescriptor instead')
const ModuleConfig_ExternalNotificationConfig$json = {
  '1': 'ExternalNotificationConfig',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
    {'1': 'output_ms', '3': 2, '4': 1, '5': 13, '10': 'outputMs'},
    {'1': 'output', '3': 3, '4': 1, '5': 13, '10': 'output'},
    {'1': 'output_vibra', '3': 8, '4': 1, '5': 13, '10': 'outputVibra'},
    {'1': 'output_buzzer', '3': 9, '4': 1, '5': 13, '10': 'outputBuzzer'},
    {'1': 'active', '3': 4, '4': 1, '5': 8, '10': 'active'},
    {'1': 'alert_message', '3': 5, '4': 1, '5': 8, '10': 'alertMessage'},
    {'1': 'alert_message_vibra', '3': 10, '4': 1, '5': 8, '10': 'alertMessageVibra'},
    {'1': 'alert_message_buzzer', '3': 11, '4': 1, '5': 8, '10': 'alertMessageBuzzer'},
    {'1': 'alert_bell', '3': 6, '4': 1, '5': 8, '10': 'alertBell'},
    {'1': 'alert_bell_vibra', '3': 12, '4': 1, '5': 8, '10': 'alertBellVibra'},
    {'1': 'alert_bell_buzzer', '3': 13, '4': 1, '5': 8, '10': 'alertBellBuzzer'},
    {'1': 'use_pwm', '3': 7, '4': 1, '5': 8, '10': 'usePwm'},
    {'1': 'nag_timeout', '3': 14, '4': 1, '5': 13, '10': 'nagTimeout'},
    {'1': 'use_i2s_as_buzzer', '3': 15, '4': 1, '5': 8, '10': 'useI2sAsBuzzer'},
  ],
};

@$core.Deprecated('Use moduleConfigDescriptor instead')
const ModuleConfig_StoreForwardConfig$json = {
  '1': 'StoreForwardConfig',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
    {'1': 'heartbeat', '3': 2, '4': 1, '5': 8, '10': 'heartbeat'},
    {'1': 'records', '3': 3, '4': 1, '5': 13, '10': 'records'},
    {'1': 'history_return_max', '3': 4, '4': 1, '5': 13, '10': 'historyReturnMax'},
    {'1': 'history_return_window', '3': 5, '4': 1, '5': 13, '10': 'historyReturnWindow'},
  ],
};

@$core.Deprecated('Use moduleConfigDescriptor instead')
const ModuleConfig_RangeTestConfig$json = {
  '1': 'RangeTestConfig',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
    {'1': 'sender', '3': 2, '4': 1, '5': 13, '10': 'sender'},
    {'1': 'save', '3': 3, '4': 1, '5': 8, '10': 'save'},
  ],
};

@$core.Deprecated('Use moduleConfigDescriptor instead')
const ModuleConfig_TelemetryConfig$json = {
  '1': 'TelemetryConfig',
  '2': [
    {'1': 'device_update_interval', '3': 1, '4': 1, '5': 13, '10': 'deviceUpdateInterval'},
    {'1': 'environment_update_interval', '3': 2, '4': 1, '5': 13, '10': 'environmentUpdateInterval'},
    {'1': 'environment_measurement_enabled', '3': 3, '4': 1, '5': 8, '10': 'environmentMeasurementEnabled'},
    {'1': 'environment_screen_enabled', '3': 4, '4': 1, '5': 8, '10': 'environmentScreenEnabled'},
    {'1': 'environment_display_fahrenheit', '3': 5, '4': 1, '5': 8, '10': 'environmentDisplayFahrenheit'},
    {'1': 'air_quality_enabled', '3': 6, '4': 1, '5': 8, '10': 'airQualityEnabled'},
    {'1': 'air_quality_interval', '3': 7, '4': 1, '5': 13, '10': 'airQualityInterval'},
    {'1': 'power_measurement_enabled', '3': 8, '4': 1, '5': 8, '10': 'powerMeasurementEnabled'},
    {'1': 'power_update_interval', '3': 9, '4': 1, '5': 13, '10': 'powerUpdateInterval'},
    {'1': 'power_screen_enabled', '3': 10, '4': 1, '5': 8, '10': 'powerScreenEnabled'},
  ],
};

@$core.Deprecated('Use moduleConfigDescriptor instead')
const ModuleConfig_CannedMessageConfig$json = {
  '1': 'CannedMessageConfig',
  '2': [
    {'1': 'rotary1_enabled', '3': 1, '4': 1, '5': 8, '10': 'rotary1Enabled'},
    {'1': 'inputbroker_pin_a', '3': 2, '4': 1, '5': 13, '10': 'inputbrokerPinA'},
    {'1': 'inputbroker_pin_b', '3': 3, '4': 1, '5': 13, '10': 'inputbrokerPinB'},
    {'1': 'inputbroker_pin_press', '3': 4, '4': 1, '5': 13, '10': 'inputbrokerPinPress'},
    {'1': 'inputbroker_event_cw', '3': 5, '4': 1, '5': 14, '6': '.meshtastic.ModuleConfig.CannedMessageConfig.InputEventChar', '10': 'inputbrokerEventCw'},
    {'1': 'inputbroker_event_ccw', '3': 6, '4': 1, '5': 14, '6': '.meshtastic.ModuleConfig.CannedMessageConfig.InputEventChar', '10': 'inputbrokerEventCcw'},
    {'1': 'inputbroker_event_press', '3': 7, '4': 1, '5': 14, '6': '.meshtastic.ModuleConfig.CannedMessageConfig.InputEventChar', '10': 'inputbrokerEventPress'},
    {'1': 'updown1_enabled', '3': 8, '4': 1, '5': 8, '10': 'updown1Enabled'},
    {'1': 'enabled', '3': 9, '4': 1, '5': 8, '10': 'enabled'},
    {'1': 'allow_input_source', '3': 10, '4': 1, '5': 9, '10': 'allowInputSource'},
    {'1': 'send_bell', '3': 11, '4': 1, '5': 8, '10': 'sendBell'},
  ],
  '4': [ModuleConfig_CannedMessageConfig_InputEventChar$json],
};

@$core.Deprecated('Use moduleConfigDescriptor instead')
const ModuleConfig_CannedMessageConfig_InputEventChar$json = {
  '1': 'InputEventChar',
  '2': [
    {'1': 'NONE', '2': 0},
    {'1': 'UP', '2': 17},
    {'1': 'DOWN', '2': 18},
    {'1': 'LEFT', '2': 19},
    {'1': 'RIGHT', '2': 20},
    {'1': 'SELECT', '2': 10},
    {'1': 'BACK', '2': 27},
    {'1': 'CANCEL', '2': 24},
  ],
};

@$core.Deprecated('Use moduleConfigDescriptor instead')
const ModuleConfig_AmbientLightingConfig$json = {
  '1': 'AmbientLightingConfig',
  '2': [
    {'1': 'led_state', '3': 1, '4': 1, '5': 8, '10': 'ledState'},
    {'1': 'current', '3': 2, '4': 1, '5': 13, '10': 'current'},
    {'1': 'red', '3': 3, '4': 1, '5': 13, '10': 'red'},
    {'1': 'green', '3': 4, '4': 1, '5': 13, '10': 'green'},
    {'1': 'blue', '3': 5, '4': 1, '5': 13, '10': 'blue'},
  ],
};

/// Descriptor for `ModuleConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moduleConfigDescriptor = $convert.base64Decode(
    'CgxNb2R1bGVDb25maWcSOQoEbXF0dBgBIAEoCzIjLm1lc2h0YXN0aWMuTW9kdWxlQ29uZmlnLk'
    '1RVFRDb25maWdIAFIEbXF0dBI/CgZzZXJpYWwYAiABKAsyJS5tZXNodGFzdGljLk1vZHVsZUNv'
    'bmZpZy5TZXJpYWxDb25maWdIAFIGc2VyaWFsEmoKFWV4dGVybmFsX25vdGlmaWNhdGlvbhgDIA'
    'EoCzIzLm1lc2h0YXN0aWMuTW9kdWxlQ29uZmlnLkV4dGVybmFsTm90aWZpY2F0aW9uQ29uZmln'
    'SABSFGV4dGVybmFsTm90aWZpY2F0aW9uElIKDXN0b3JlX2ZvcndhcmQYBCABKAsyKy5tZXNodG'
    'FzdGljLk1vZHVsZUNvbmZpZy5TdG9yZUZvcndhcmRDb25maWdIAFIMc3RvcmVGb3J3YXJkEkkK'
    'CnJhbmdlX3Rlc3QYBSABKAsyKC5tZXNodGFzdGljLk1vZHVsZUNvbmZpZy5SYW5nZVRlc3RDb2'
    '5maWdIAFIJcmFuZ2VUZXN0EkgKCXRlbGVtZXRyeRgGIAEoCzIoLm1lc2h0YXN0aWMuTW9kdWxl'
    'Q29uZmlnLlRlbGVtZXRyeUNvbmZpZ0gAUgl0ZWxlbWV0cnkSVQoOY2FubmVkX21lc3NhZ2UYBy'
    'ABKAsyLC5tZXNodGFzdGljLk1vZHVsZUNvbmZpZy5DYW5uZWRNZXNzYWdlQ29uZmlnSABSDWNh'
    'bm5lZE1lc3NhZ2USPAoFYXVkaW8YCCABKAsyJC5tZXNodGFzdGljLk1vZHVsZUNvbmZpZy5BdW'
    'Rpb0NvbmZpZ0gAUgVhdWRpbxJYCg9yZW1vdGVfaGFyZHdhcmUYCSABKAsyLS5tZXNodGFzdGlj'
    'Lk1vZHVsZUNvbmZpZy5SZW1vdGVIYXJkd2FyZUNvbmZpZ0gAUg5yZW1vdGVIYXJkd2FyZRJSCg'
    '1uZWlnaGJvcl9pbmZvGAogASgLMisubWVzaHRhc3RpYy5Nb2R1bGVDb25maWcuTmVpZ2hib3JJ'
    'bmZvQ29uZmlnSABSDG5laWdoYm9ySW5mbxJbChBhbWJpZW50X2xpZ2h0aW5nGAsgASgLMi4ubW'
    'VzaHRhc3RpYy5Nb2R1bGVDb25maWcuQW1iaWVudExpZ2h0aW5nQ29uZmlnSABSD2FtYmllbnRM'
    'aWdodGluZxJbChBkZXRlY3Rpb25fc2Vuc29yGAwgASgLMi4ubWVzaHRhc3RpYy5Nb2R1bGVDb2'
    '5maWcuRGV0ZWN0aW9uU2Vuc29yQ29uZmlnSABSD2RldGVjdGlvblNlbnNvchJLCgpwYXhjb3Vu'
    'dGVyGA0gASgLMikubWVzaHRhc3RpYy5Nb2R1bGVDb25maWcuUGF4Y291bnRlckNvbmZpZ0gAUg'
    'pwYXhjb3VudGVyGsYDCgpNUVRUQ29uZmlnEhgKB2VuYWJsZWQYASABKAhSB2VuYWJsZWQSGAoH'
    'YWRkcmVzcxgCIAEoCVIHYWRkcmVzcxIaCgh1c2VybmFtZRgDIAEoCVIIdXNlcm5hbWUSGgoIcG'
    'Fzc3dvcmQYBCABKAlSCHBhc3N3b3JkEi0KEmVuY3J5cHRpb25fZW5hYmxlZBgFIAEoCFIRZW5j'
    'cnlwdGlvbkVuYWJsZWQSIQoManNvbl9lbmFibGVkGAYgASgIUgtqc29uRW5hYmxlZBIfCgt0bH'
    'NfZW5hYmxlZBgHIAEoCFIKdGxzRW5hYmxlZBISCgRyb290GAggASgJUgRyb290EjUKF3Byb3h5'
    'X3RvX2NsaWVudF9lbmFibGVkGAkgASgIUhRwcm94eVRvQ2xpZW50RW5hYmxlZBIyChVtYXBfcm'
    'Vwb3J0aW5nX2VuYWJsZWQYCiABKAhSE21hcFJlcG9ydGluZ0VuYWJsZWQSWgoTbWFwX3JlcG9y'
    'dF9zZXR0aW5ncxgLIAEoCzIqLm1lc2h0YXN0aWMuTW9kdWxlQ29uZmlnLk1hcFJlcG9ydFNldH'
    'RpbmdzUhFtYXBSZXBvcnRTZXR0aW5ncxp2ChFNYXBSZXBvcnRTZXR0aW5ncxIyChVwdWJsaXNo'
    'X2ludGVydmFsX3NlY3MYASABKA1SE3B1Ymxpc2hJbnRlcnZhbFNlY3MSLQoScG9zaXRpb25fcH'
    'JlY2lzaW9uGAIgASgNUhFwb3NpdGlvblByZWNpc2lvbhqzAQoUUmVtb3RlSGFyZHdhcmVDb25m'
    'aWcSGAoHZW5hYmxlZBgBIAEoCFIHZW5hYmxlZBI7ChphbGxvd191bmRlZmluZWRfcGluX2FjY2'
    'VzcxgCIAEoCFIXYWxsb3dVbmRlZmluZWRQaW5BY2Nlc3MSRAoOYXZhaWxhYmxlX3BpbnMYAyAD'
    'KAsyHS5tZXNodGFzdGljLlJlbW90ZUhhcmR3YXJlUGluUg1hdmFpbGFibGVQaW5zGlcKEk5laW'
    'doYm9ySW5mb0NvbmZpZxIYCgdlbmFibGVkGAEgASgIUgdlbmFibGVkEicKD3VwZGF0ZV9pbnRl'
    'cnZhbBgCIAEoDVIOdXBkYXRlSW50ZXJ2YWwaxAIKFURldGVjdGlvblNlbnNvckNvbmZpZxIYCg'
    'dlbmFibGVkGAEgASgIUgdlbmFibGVkEjQKFm1pbmltdW1fYnJvYWRjYXN0X3NlY3MYAiABKA1S'
    'FG1pbmltdW1Ccm9hZGNhc3RTZWNzEjAKFHN0YXRlX2Jyb2FkY2FzdF9zZWNzGAMgASgNUhJzdG'
    'F0ZUJyb2FkY2FzdFNlY3MSGwoJc2VuZF9iZWxsGAQgASgIUghzZW5kQmVsbBISCgRuYW1lGAUg'
    'ASgJUgRuYW1lEh8KC21vbml0b3JfcGluGAYgASgNUgptb25pdG9yUGluEjgKGGRldGVjdGlvbl'
    '90cmlnZ2VyZWRfaGlnaBgHIAEoCFIWZGV0ZWN0aW9uVHJpZ2dlcmVkSGlnaBIdCgp1c2VfcHVs'
    'bHVwGAggASgIUgl1c2VQdWxsdXAaogMKC0F1ZGlvQ29uZmlnEiUKDmNvZGVjMl9lbmFibGVkGA'
    'EgASgIUg1jb2RlYzJFbmFibGVkEhcKB3B0dF9waW4YAiABKA1SBnB0dFBpbhJJCgdiaXRyYXRl'
    'GAMgASgOMi8ubWVzaHRhc3RpYy5Nb2R1bGVDb25maWcuQXVkaW9Db25maWcuQXVkaW9fQmF1ZF'
    'IHYml0cmF0ZRIVCgZpMnNfd3MYBCABKA1SBWkyc1dzEhUKBmkyc19zZBgFIAEoDVIFaTJzU2QS'
    'FwoHaTJzX2RpbhgGIAEoDVIGaTJzRGluEhcKB2kyc19zY2sYByABKA1SBmkyc1NjayKnAQoKQX'
    'VkaW9fQmF1ZBISCg5DT0RFQzJfREVGQVVMVBAAEg8KC0NPREVDMl8zMjAwEAESDwoLQ09ERUMy'
    'XzI0MDAQAhIPCgtDT0RFQzJfMTYwMBADEg8KC0NPREVDMl8xNDAwEAQSDwoLQ09ERUMyXzEzMD'
    'AQBRIPCgtDT0RFQzJfMTIwMBAGEg4KCkNPREVDMl83MDAQBxIPCgtDT0RFQzJfNzAwQhAIGmoK'
    'EFBheGNvdW50ZXJDb25maWcSGAoHZW5hYmxlZBgBIAEoCFIHZW5hYmxlZBI8ChpwYXhjb3VudG'
    'VyX3VwZGF0ZV9pbnRlcnZhbBgCIAEoDVIYcGF4Y291bnRlclVwZGF0ZUludGVydmFsGq0FCgxT'
    'ZXJpYWxDb25maWcSGAoHZW5hYmxlZBgBIAEoCFIHZW5hYmxlZBISCgRlY2hvGAIgASgIUgRlY2'
    'hvEhAKA3J4ZBgDIAEoDVIDcnhkEhAKA3R4ZBgEIAEoDVIDdHhkEkUKBGJhdWQYBSABKA4yMS5t'
    'ZXNodGFzdGljLk1vZHVsZUNvbmZpZy5TZXJpYWxDb25maWcuU2VyaWFsX0JhdWRSBGJhdWQSGA'
    'oHdGltZW91dBgGIAEoDVIHdGltZW91dBJFCgRtb2RlGAcgASgOMjEubWVzaHRhc3RpYy5Nb2R1'
    'bGVDb25maWcuU2VyaWFsQ29uZmlnLlNlcmlhbF9Nb2RlUgRtb2RlEj8KHG92ZXJyaWRlX2Nvbn'
    'NvbGVfc2VyaWFsX3BvcnQYCCABKAhSGW92ZXJyaWRlQ29uc29sZVNlcmlhbFBvcnQiigIKC1Nl'
    'cmlhbF9CYXVkEhAKDEJBVURfREVGQVVMVBAAEgwKCEJBVURfMTEwEAESDAoIQkFVRF8zMDAQAh'
    'IMCghCQVVEXzYwMBADEg0KCUJBVURfMTIwMBAEEg0KCUJBVURfMjQwMBAFEg0KCUJBVURfNDgw'
    'MBAGEg0KCUJBVURfOTYwMBAHEg4KCkJBVURfMTkyMDAQCBIOCgpCQVVEXzM4NDAwEAkSDgoKQk'
    'FVRF81NzYwMBAKEg8KC0JBVURfMTE1MjAwEAsSDwoLQkFVRF8yMzA0MDAQDBIPCgtCQVVEXzQ2'
    'MDgwMBANEg8KC0JBVURfNTc2MDAwEA4SDwoLQkFVRF85MjE2MDAQDyJVCgtTZXJpYWxfTW9kZR'
    'ILCgdERUZBVUxUEAASCgoGU0lNUExFEAESCQoFUFJPVE8QAhILCgdURVhUTVNHEAMSCAoETk1F'
    'QRAEEgsKB0NBTFRPUE8QBRqsBAoaRXh0ZXJuYWxOb3RpZmljYXRpb25Db25maWcSGAoHZW5hYm'
    'xlZBgBIAEoCFIHZW5hYmxlZBIbCglvdXRwdXRfbXMYAiABKA1SCG91dHB1dE1zEhYKBm91dHB1'
    'dBgDIAEoDVIGb3V0cHV0EiEKDG91dHB1dF92aWJyYRgIIAEoDVILb3V0cHV0VmlicmESIwoNb3'
    'V0cHV0X2J1enplchgJIAEoDVIMb3V0cHV0QnV6emVyEhYKBmFjdGl2ZRgEIAEoCFIGYWN0aXZl'
    'EiMKDWFsZXJ0X21lc3NhZ2UYBSABKAhSDGFsZXJ0TWVzc2FnZRIuChNhbGVydF9tZXNzYWdlX3'
    'ZpYnJhGAogASgIUhFhbGVydE1lc3NhZ2VWaWJyYRIwChRhbGVydF9tZXNzYWdlX2J1enplchgL'
    'IAEoCFISYWxlcnRNZXNzYWdlQnV6emVyEh0KCmFsZXJ0X2JlbGwYBiABKAhSCWFsZXJ0QmVsbB'
    'IoChBhbGVydF9iZWxsX3ZpYnJhGAwgASgIUg5hbGVydEJlbGxWaWJyYRIqChFhbGVydF9iZWxs'
    'X2J1enplchgNIAEoCFIPYWxlcnRCZWxsQnV6emVyEhcKB3VzZV9wd20YByABKAhSBnVzZVB3bR'
    'IfCgtuYWdfdGltZW91dBgOIAEoDVIKbmFnVGltZW91dBIpChF1c2VfaTJzX2FzX2J1enplchgP'
    'IAEoCFIOdXNlSTJzQXNCdXp6ZXIayAEKElN0b3JlRm9yd2FyZENvbmZpZxIYCgdlbmFibGVkGA'
    'EgASgIUgdlbmFibGVkEhwKCWhlYXJ0YmVhdBgCIAEoCFIJaGVhcnRiZWF0EhgKB3JlY29yZHMY'
    'AyABKA1SB3JlY29yZHMSLAoSaGlzdG9yeV9yZXR1cm5fbWF4GAQgASgNUhBoaXN0b3J5UmV0dX'
    'JuTWF4EjIKFWhpc3RvcnlfcmV0dXJuX3dpbmRvdxgFIAEoDVITaGlzdG9yeVJldHVybldpbmRv'
    'dxpXCg9SYW5nZVRlc3RDb25maWcSGAoHZW5hYmxlZBgBIAEoCFIHZW5hYmxlZBIWCgZzZW5kZX'
    'IYAiABKA1SBnNlbmRlchISCgRzYXZlGAMgASgIUgRzYXZlGtcECg9UZWxlbWV0cnlDb25maWcS'
    'NAoWZGV2aWNlX3VwZGF0ZV9pbnRlcnZhbBgBIAEoDVIUZGV2aWNlVXBkYXRlSW50ZXJ2YWwSPg'
    'obZW52aXJvbm1lbnRfdXBkYXRlX2ludGVydmFsGAIgASgNUhllbnZpcm9ubWVudFVwZGF0ZUlu'
    'dGVydmFsEkYKH2Vudmlyb25tZW50X21lYXN1cmVtZW50X2VuYWJsZWQYAyABKAhSHWVudmlyb2'
    '5tZW50TWVhc3VyZW1lbnRFbmFibGVkEjwKGmVudmlyb25tZW50X3NjcmVlbl9lbmFibGVkGAQg'
    'ASgIUhhlbnZpcm9ubWVudFNjcmVlbkVuYWJsZWQSRAoeZW52aXJvbm1lbnRfZGlzcGxheV9mYW'
    'hyZW5oZWl0GAUgASgIUhxlbnZpcm9ubWVudERpc3BsYXlGYWhyZW5oZWl0Ei4KE2Fpcl9xdWFs'
    'aXR5X2VuYWJsZWQYBiABKAhSEWFpclF1YWxpdHlFbmFibGVkEjAKFGFpcl9xdWFsaXR5X2ludG'
    'VydmFsGAcgASgNUhJhaXJRdWFsaXR5SW50ZXJ2YWwSOgoZcG93ZXJfbWVhc3VyZW1lbnRfZW5h'
    'YmxlZBgIIAEoCFIXcG93ZXJNZWFzdXJlbWVudEVuYWJsZWQSMgoVcG93ZXJfdXBkYXRlX2ludG'
    'VydmFsGAkgASgNUhNwb3dlclVwZGF0ZUludGVydmFsEjAKFHBvd2VyX3NjcmVlbl9lbmFibGVk'
    'GAogASgIUhJwb3dlclNjcmVlbkVuYWJsZWQakgYKE0Nhbm5lZE1lc3NhZ2VDb25maWcSJwoPcm'
    '90YXJ5MV9lbmFibGVkGAEgASgIUg5yb3RhcnkxRW5hYmxlZBIqChFpbnB1dGJyb2tlcl9waW5f'
    'YRgCIAEoDVIPaW5wdXRicm9rZXJQaW5BEioKEWlucHV0YnJva2VyX3Bpbl9iGAMgASgNUg9pbn'
    'B1dGJyb2tlclBpbkISMgoVaW5wdXRicm9rZXJfcGluX3ByZXNzGAQgASgNUhNpbnB1dGJyb2tl'
    'clBpblByZXNzEm0KFGlucHV0YnJva2VyX2V2ZW50X2N3GAUgASgOMjsubWVzaHRhc3RpYy5Nb2'
    'R1bGVDb25maWcuQ2FubmVkTWVzc2FnZUNvbmZpZy5JbnB1dEV2ZW50Q2hhclISaW5wdXRicm9r'
    'ZXJFdmVudEN3Em8KFWlucHV0YnJva2VyX2V2ZW50X2NjdxgGIAEoDjI7Lm1lc2h0YXN0aWMuTW'
    '9kdWxlQ29uZmlnLkNhbm5lZE1lc3NhZ2VDb25maWcuSW5wdXRFdmVudENoYXJSE2lucHV0YnJv'
    'a2VyRXZlbnRDY3cScwoXaW5wdXRicm9rZXJfZXZlbnRfcHJlc3MYByABKA4yOy5tZXNodGFzdG'
    'ljLk1vZHVsZUNvbmZpZy5DYW5uZWRNZXNzYWdlQ29uZmlnLklucHV0RXZlbnRDaGFyUhVpbnB1'
    'dGJyb2tlckV2ZW50UHJlc3MSJwoPdXBkb3duMV9lbmFibGVkGAggASgIUg51cGRvd24xRW5hYm'
    'xlZBIYCgdlbmFibGVkGAkgASgIUgdlbmFibGVkEiwKEmFsbG93X2lucHV0X3NvdXJjZRgKIAEo'
    'CVIQYWxsb3dJbnB1dFNvdXJjZRIbCglzZW5kX2JlbGwYCyABKAhSCHNlbmRCZWxsImMKDklucH'
    'V0RXZlbnRDaGFyEggKBE5PTkUQABIGCgJVUBAREggKBERPV04QEhIICgRMRUZUEBMSCQoFUklH'
    'SFQQFBIKCgZTRUxFQ1QQChIICgRCQUNLEBsSCgoGQ0FOQ0VMEBgaigEKFUFtYmllbnRMaWdodG'
    'luZ0NvbmZpZxIbCglsZWRfc3RhdGUYASABKAhSCGxlZFN0YXRlEhgKB2N1cnJlbnQYAiABKA1S'
    'B2N1cnJlbnQSEAoDcmVkGAMgASgNUgNyZWQSFAoFZ3JlZW4YBCABKA1SBWdyZWVuEhIKBGJsdW'
    'UYBSABKA1SBGJsdWVCEQoPcGF5bG9hZF92YXJpYW50');

@$core.Deprecated('Use remoteHardwarePinDescriptor instead')
const RemoteHardwarePin$json = {
  '1': 'RemoteHardwarePin',
  '2': [
    {'1': 'gpio_pin', '3': 1, '4': 1, '5': 13, '10': 'gpioPin'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.meshtastic.RemoteHardwarePinType', '10': 'type'},
  ],
};

/// Descriptor for `RemoteHardwarePin`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteHardwarePinDescriptor = $convert.base64Decode(
    'ChFSZW1vdGVIYXJkd2FyZVBpbhIZCghncGlvX3BpbhgBIAEoDVIHZ3Bpb1BpbhISCgRuYW1lGA'
    'IgASgJUgRuYW1lEjUKBHR5cGUYAyABKA4yIS5tZXNodGFzdGljLlJlbW90ZUhhcmR3YXJlUGlu'
    'VHlwZVIEdHlwZQ==');

