//
//  Generated code. Do not modify.
//  source: meshtastic/admin.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use adminMessageDescriptor instead')
const AdminMessage$json = {
  '1': 'AdminMessage',
  '2': [
    {
      '1': 'get_channel_request',
      '3': 1,
      '4': 1,
      '5': 13,
      '9': 0,
      '10': 'getChannelRequest'
    },
    {
      '1': 'get_channel_response',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.Channel',
      '9': 0,
      '10': 'getChannelResponse'
    },
    {
      '1': 'get_owner_request',
      '3': 3,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'getOwnerRequest'
    },
    {
      '1': 'get_owner_response',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.User',
      '9': 0,
      '10': 'getOwnerResponse'
    },
    {
      '1': 'get_config_request',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.meshtastic.AdminMessage.ConfigType',
      '9': 0,
      '10': 'getConfigRequest'
    },
    {
      '1': 'get_config_response',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.Config',
      '9': 0,
      '10': 'getConfigResponse'
    },
    {
      '1': 'get_module_config_request',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.meshtastic.AdminMessage.ModuleConfigType',
      '9': 0,
      '10': 'getModuleConfigRequest'
    },
    {
      '1': 'get_module_config_response',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.ModuleConfig',
      '9': 0,
      '10': 'getModuleConfigResponse'
    },
    {
      '1': 'get_canned_message_module_messages_request',
      '3': 10,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'getCannedMessageModuleMessagesRequest'
    },
    {
      '1': 'get_canned_message_module_messages_response',
      '3': 11,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'getCannedMessageModuleMessagesResponse'
    },
    {
      '1': 'get_device_metadata_request',
      '3': 12,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'getDeviceMetadataRequest'
    },
    {
      '1': 'get_device_metadata_response',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.DeviceMetadata',
      '9': 0,
      '10': 'getDeviceMetadataResponse'
    },
    {
      '1': 'get_ringtone_request',
      '3': 14,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'getRingtoneRequest'
    },
    {
      '1': 'get_ringtone_response',
      '3': 15,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'getRingtoneResponse'
    },
    {
      '1': 'get_device_connection_status_request',
      '3': 16,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'getDeviceConnectionStatusRequest'
    },
    {
      '1': 'get_device_connection_status_response',
      '3': 17,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.DeviceConnectionStatus',
      '9': 0,
      '10': 'getDeviceConnectionStatusResponse'
    },
    {
      '1': 'set_ham_mode',
      '3': 18,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.HamParameters',
      '9': 0,
      '10': 'setHamMode'
    },
    {
      '1': 'get_node_remote_hardware_pins_request',
      '3': 19,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'getNodeRemoteHardwarePinsRequest'
    },
    {
      '1': 'get_node_remote_hardware_pins_response',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.NodeRemoteHardwarePinsResponse',
      '9': 0,
      '10': 'getNodeRemoteHardwarePinsResponse'
    },
    {
      '1': 'enter_dfu_mode_request',
      '3': 21,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'enterDfuModeRequest'
    },
    {
      '1': 'set_owner',
      '3': 32,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.User',
      '9': 0,
      '10': 'setOwner'
    },
    {
      '1': 'set_channel',
      '3': 33,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.Channel',
      '9': 0,
      '10': 'setChannel'
    },
    {
      '1': 'set_config',
      '3': 34,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.Config',
      '9': 0,
      '10': 'setConfig'
    },
    {
      '1': 'set_module_config',
      '3': 35,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.ModuleConfig',
      '9': 0,
      '10': 'setModuleConfig'
    },
    {
      '1': 'set_canned_message_module_messages',
      '3': 36,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'setCannedMessageModuleMessages'
    },
    {
      '1': 'set_ringtone_message',
      '3': 37,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'setRingtoneMessage'
    },
    {
      '1': 'remove_by_nodenum',
      '3': 38,
      '4': 1,
      '5': 13,
      '9': 0,
      '10': 'removeByNodenum'
    },
    {
      '1': 'begin_edit_settings',
      '3': 64,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'beginEditSettings'
    },
    {
      '1': 'commit_edit_settings',
      '3': 65,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'commitEditSettings'
    },
    {
      '1': 'reboot_ota_seconds',
      '3': 95,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'rebootOtaSeconds'
    },
    {
      '1': 'exit_simulator',
      '3': 96,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'exitSimulator'
    },
    {
      '1': 'reboot_seconds',
      '3': 97,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'rebootSeconds'
    },
    {
      '1': 'shutdown_seconds',
      '3': 98,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'shutdownSeconds'
    },
    {
      '1': 'factory_reset',
      '3': 99,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'factoryReset'
    },
    {
      '1': 'nodedb_reset',
      '3': 100,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'nodedbReset'
    },
  ],
  '4': [AdminMessage_ConfigType$json, AdminMessage_ModuleConfigType$json],
  '8': [
    {'1': 'payload_variant'},
  ],
};

@$core.Deprecated('Use adminMessageDescriptor instead')
const AdminMessage_ConfigType$json = {
  '1': 'ConfigType',
  '2': [
    {'1': 'DEVICE_CONFIG', '2': 0},
    {'1': 'POSITION_CONFIG', '2': 1},
    {'1': 'POWER_CONFIG', '2': 2},
    {'1': 'NETWORK_CONFIG', '2': 3},
    {'1': 'DISPLAY_CONFIG', '2': 4},
    {'1': 'LORA_CONFIG', '2': 5},
    {'1': 'BLUETOOTH_CONFIG', '2': 6},
  ],
};

@$core.Deprecated('Use adminMessageDescriptor instead')
const AdminMessage_ModuleConfigType$json = {
  '1': 'ModuleConfigType',
  '2': [
    {'1': 'MQTT_CONFIG', '2': 0},
    {'1': 'SERIAL_CONFIG', '2': 1},
    {'1': 'EXTNOTIF_CONFIG', '2': 2},
    {'1': 'STOREFORWARD_CONFIG', '2': 3},
    {'1': 'RANGETEST_CONFIG', '2': 4},
    {'1': 'TELEMETRY_CONFIG', '2': 5},
    {'1': 'CANNEDMSG_CONFIG', '2': 6},
    {'1': 'AUDIO_CONFIG', '2': 7},
    {'1': 'REMOTEHARDWARE_CONFIG', '2': 8},
    {'1': 'NEIGHBORINFO_CONFIG', '2': 9},
    {'1': 'AMBIENTLIGHTING_CONFIG', '2': 10},
    {'1': 'DETECTIONSENSOR_CONFIG', '2': 11},
    {'1': 'PAXCOUNTER_CONFIG', '2': 12},
  ],
};

/// Descriptor for `AdminMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adminMessageDescriptor = $convert.base64Decode(
    'CgxBZG1pbk1lc3NhZ2USMAoTZ2V0X2NoYW5uZWxfcmVxdWVzdBgBIAEoDUgAUhFnZXRDaGFubm'
    'VsUmVxdWVzdBJHChRnZXRfY2hhbm5lbF9yZXNwb25zZRgCIAEoCzITLm1lc2h0YXN0aWMuQ2hh'
    'bm5lbEgAUhJnZXRDaGFubmVsUmVzcG9uc2USLAoRZ2V0X293bmVyX3JlcXVlc3QYAyABKAhIAF'
    'IPZ2V0T3duZXJSZXF1ZXN0EkAKEmdldF9vd25lcl9yZXNwb25zZRgEIAEoCzIQLm1lc2h0YXN0'
    'aWMuVXNlckgAUhBnZXRPd25lclJlc3BvbnNlElMKEmdldF9jb25maWdfcmVxdWVzdBgFIAEoDj'
    'IjLm1lc2h0YXN0aWMuQWRtaW5NZXNzYWdlLkNvbmZpZ1R5cGVIAFIQZ2V0Q29uZmlnUmVxdWVz'
    'dBJEChNnZXRfY29uZmlnX3Jlc3BvbnNlGAYgASgLMhIubWVzaHRhc3RpYy5Db25maWdIAFIRZ2'
    'V0Q29uZmlnUmVzcG9uc2USZgoZZ2V0X21vZHVsZV9jb25maWdfcmVxdWVzdBgHIAEoDjIpLm1l'
    'c2h0YXN0aWMuQWRtaW5NZXNzYWdlLk1vZHVsZUNvbmZpZ1R5cGVIAFIWZ2V0TW9kdWxlQ29uZm'
    'lnUmVxdWVzdBJXChpnZXRfbW9kdWxlX2NvbmZpZ19yZXNwb25zZRgIIAEoCzIYLm1lc2h0YXN0'
    'aWMuTW9kdWxlQ29uZmlnSABSF2dldE1vZHVsZUNvbmZpZ1Jlc3BvbnNlElsKKmdldF9jYW5uZW'
    'RfbWVzc2FnZV9tb2R1bGVfbWVzc2FnZXNfcmVxdWVzdBgKIAEoCEgAUiVnZXRDYW5uZWRNZXNz'
    'YWdlTW9kdWxlTWVzc2FnZXNSZXF1ZXN0El0KK2dldF9jYW5uZWRfbWVzc2FnZV9tb2R1bGVfbW'
    'Vzc2FnZXNfcmVzcG9uc2UYCyABKAlIAFImZ2V0Q2FubmVkTWVzc2FnZU1vZHVsZU1lc3NhZ2Vz'
    'UmVzcG9uc2USPwobZ2V0X2RldmljZV9tZXRhZGF0YV9yZXF1ZXN0GAwgASgISABSGGdldERldm'
    'ljZU1ldGFkYXRhUmVxdWVzdBJdChxnZXRfZGV2aWNlX21ldGFkYXRhX3Jlc3BvbnNlGA0gASgL'
    'MhoubWVzaHRhc3RpYy5EZXZpY2VNZXRhZGF0YUgAUhlnZXREZXZpY2VNZXRhZGF0YVJlc3Bvbn'
    'NlEjIKFGdldF9yaW5ndG9uZV9yZXF1ZXN0GA4gASgISABSEmdldFJpbmd0b25lUmVxdWVzdBI0'
    'ChVnZXRfcmluZ3RvbmVfcmVzcG9uc2UYDyABKAlIAFITZ2V0UmluZ3RvbmVSZXNwb25zZRJQCi'
    'RnZXRfZGV2aWNlX2Nvbm5lY3Rpb25fc3RhdHVzX3JlcXVlc3QYECABKAhIAFIgZ2V0RGV2aWNl'
    'Q29ubmVjdGlvblN0YXR1c1JlcXVlc3QSdgolZ2V0X2RldmljZV9jb25uZWN0aW9uX3N0YXR1c1'
    '9yZXNwb25zZRgRIAEoCzIiLm1lc2h0YXN0aWMuRGV2aWNlQ29ubmVjdGlvblN0YXR1c0gAUiFn'
    'ZXREZXZpY2VDb25uZWN0aW9uU3RhdHVzUmVzcG9uc2USPQoMc2V0X2hhbV9tb2RlGBIgASgLMh'
    'kubWVzaHRhc3RpYy5IYW1QYXJhbWV0ZXJzSABSCnNldEhhbU1vZGUSUQolZ2V0X25vZGVfcmVt'
    'b3RlX2hhcmR3YXJlX3BpbnNfcmVxdWVzdBgTIAEoCEgAUiBnZXROb2RlUmVtb3RlSGFyZHdhcm'
    'VQaW5zUmVxdWVzdBJ/CiZnZXRfbm9kZV9yZW1vdGVfaGFyZHdhcmVfcGluc19yZXNwb25zZRgU'
    'IAEoCzIqLm1lc2h0YXN0aWMuTm9kZVJlbW90ZUhhcmR3YXJlUGluc1Jlc3BvbnNlSABSIWdldE'
    '5vZGVSZW1vdGVIYXJkd2FyZVBpbnNSZXNwb25zZRI1ChZlbnRlcl9kZnVfbW9kZV9yZXF1ZXN0'
    'GBUgASgISABSE2VudGVyRGZ1TW9kZVJlcXVlc3QSLwoJc2V0X293bmVyGCAgASgLMhAubWVzaH'
    'Rhc3RpYy5Vc2VySABSCHNldE93bmVyEjYKC3NldF9jaGFubmVsGCEgASgLMhMubWVzaHRhc3Rp'
    'Yy5DaGFubmVsSABSCnNldENoYW5uZWwSMwoKc2V0X2NvbmZpZxgiIAEoCzISLm1lc2h0YXN0aW'
    'MuQ29uZmlnSABSCXNldENvbmZpZxJGChFzZXRfbW9kdWxlX2NvbmZpZxgjIAEoCzIYLm1lc2h0'
    'YXN0aWMuTW9kdWxlQ29uZmlnSABSD3NldE1vZHVsZUNvbmZpZxJMCiJzZXRfY2FubmVkX21lc3'
    'NhZ2VfbW9kdWxlX21lc3NhZ2VzGCQgASgJSABSHnNldENhbm5lZE1lc3NhZ2VNb2R1bGVNZXNz'
    'YWdlcxIyChRzZXRfcmluZ3RvbmVfbWVzc2FnZRglIAEoCUgAUhJzZXRSaW5ndG9uZU1lc3NhZ2'
    'USLAoRcmVtb3ZlX2J5X25vZGVudW0YJiABKA1IAFIPcmVtb3ZlQnlOb2RlbnVtEjAKE2JlZ2lu'
    'X2VkaXRfc2V0dGluZ3MYQCABKAhIAFIRYmVnaW5FZGl0U2V0dGluZ3MSMgoUY29tbWl0X2VkaX'
    'Rfc2V0dGluZ3MYQSABKAhIAFISY29tbWl0RWRpdFNldHRpbmdzEi4KEnJlYm9vdF9vdGFfc2Vj'
    'b25kcxhfIAEoBUgAUhByZWJvb3RPdGFTZWNvbmRzEicKDmV4aXRfc2ltdWxhdG9yGGAgASgISA'
    'BSDWV4aXRTaW11bGF0b3ISJwoOcmVib290X3NlY29uZHMYYSABKAVIAFINcmVib290U2Vjb25k'
    'cxIrChBzaHV0ZG93bl9zZWNvbmRzGGIgASgFSABSD3NodXRkb3duU2Vjb25kcxIlCg1mYWN0b3'
    'J5X3Jlc2V0GGMgASgFSABSDGZhY3RvcnlSZXNldBIjCgxub2RlZGJfcmVzZXQYZCABKAVIAFIL'
    'bm9kZWRiUmVzZXQilQEKCkNvbmZpZ1R5cGUSEQoNREVWSUNFX0NPTkZJRxAAEhMKD1BPU0lUSU'
    '9OX0NPTkZJRxABEhAKDFBPV0VSX0NPTkZJRxACEhIKDk5FVFdPUktfQ09ORklHEAMSEgoORElT'
    'UExBWV9DT05GSUcQBBIPCgtMT1JBX0NPTkZJRxAFEhQKEEJMVUVUT09USF9DT05GSUcQBiK7Ag'
    'oQTW9kdWxlQ29uZmlnVHlwZRIPCgtNUVRUX0NPTkZJRxAAEhEKDVNFUklBTF9DT05GSUcQARIT'
    'Cg9FWFROT1RJRl9DT05GSUcQAhIXChNTVE9SRUZPUldBUkRfQ09ORklHEAMSFAoQUkFOR0VURV'
    'NUX0NPTkZJRxAEEhQKEFRFTEVNRVRSWV9DT05GSUcQBRIUChBDQU5ORURNU0dfQ09ORklHEAYS'
    'EAoMQVVESU9fQ09ORklHEAcSGQoVUkVNT1RFSEFSRFdBUkVfQ09ORklHEAgSFwoTTkVJR0hCT1'
    'JJTkZPX0NPTkZJRxAJEhoKFkFNQklFTlRMSUdIVElOR19DT05GSUcQChIaChZERVRFQ1RJT05T'
    'RU5TT1JfQ09ORklHEAsSFQoRUEFYQ09VTlRFUl9DT05GSUcQDEIRCg9wYXlsb2FkX3Zhcmlhbn'
    'Q=');

@$core.Deprecated('Use hamParametersDescriptor instead')
const HamParameters$json = {
  '1': 'HamParameters',
  '2': [
    {'1': 'call_sign', '3': 1, '4': 1, '5': 9, '10': 'callSign'},
    {'1': 'tx_power', '3': 2, '4': 1, '5': 5, '10': 'txPower'},
    {'1': 'frequency', '3': 3, '4': 1, '5': 2, '10': 'frequency'},
    {'1': 'short_name', '3': 4, '4': 1, '5': 9, '10': 'shortName'},
  ],
};

/// Descriptor for `HamParameters`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hamParametersDescriptor = $convert.base64Decode(
    'Cg1IYW1QYXJhbWV0ZXJzEhsKCWNhbGxfc2lnbhgBIAEoCVIIY2FsbFNpZ24SGQoIdHhfcG93ZX'
    'IYAiABKAVSB3R4UG93ZXISHAoJZnJlcXVlbmN5GAMgASgCUglmcmVxdWVuY3kSHQoKc2hvcnRf'
    'bmFtZRgEIAEoCVIJc2hvcnROYW1l');

@$core.Deprecated('Use nodeRemoteHardwarePinsResponseDescriptor instead')
const NodeRemoteHardwarePinsResponse$json = {
  '1': 'NodeRemoteHardwarePinsResponse',
  '2': [
    {
      '1': 'node_remote_hardware_pins',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.meshtastic.NodeRemoteHardwarePin',
      '10': 'nodeRemoteHardwarePins'
    },
  ],
};

/// Descriptor for `NodeRemoteHardwarePinsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nodeRemoteHardwarePinsResponseDescriptor =
    $convert.base64Decode(
        'Ch5Ob2RlUmVtb3RlSGFyZHdhcmVQaW5zUmVzcG9uc2USXAoZbm9kZV9yZW1vdGVfaGFyZHdhcm'
        'VfcGlucxgBIAMoCzIhLm1lc2h0YXN0aWMuTm9kZVJlbW90ZUhhcmR3YXJlUGluUhZub2RlUmVt'
        'b3RlSGFyZHdhcmVQaW5z');
