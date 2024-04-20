//
//  Generated code. Do not modify.
//  source: meshtastic/deviceonly.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use screenFontsDescriptor instead')
const ScreenFonts$json = {
  '1': 'ScreenFonts',
  '2': [
    {'1': 'FONT_SMALL', '2': 0},
    {'1': 'FONT_MEDIUM', '2': 1},
    {'1': 'FONT_LARGE', '2': 2},
  ],
};

/// Descriptor for `ScreenFonts`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List screenFontsDescriptor = $convert.base64Decode(
    'CgtTY3JlZW5Gb250cxIOCgpGT05UX1NNQUxMEAASDwoLRk9OVF9NRURJVU0QARIOCgpGT05UX0'
    'xBUkdFEAI=');

@$core.Deprecated('Use positionLiteDescriptor instead')
const PositionLite$json = {
  '1': 'PositionLite',
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
  ],
};

/// Descriptor for `PositionLite`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List positionLiteDescriptor = $convert.base64Decode(
    'CgxQb3NpdGlvbkxpdGUSHQoKbGF0aXR1ZGVfaRgBIAEoD1IJbGF0aXR1ZGVJEh8KC2xvbmdpdH'
    'VkZV9pGAIgASgPUgpsb25naXR1ZGVJEhoKCGFsdGl0dWRlGAMgASgFUghhbHRpdHVkZRISCgR0'
    'aW1lGAQgASgHUgR0aW1lEkcKD2xvY2F0aW9uX3NvdXJjZRgFIAEoDjIeLm1lc2h0YXN0aWMuUG'
    '9zaXRpb24uTG9jU291cmNlUg5sb2NhdGlvblNvdXJjZQ==');

@$core.Deprecated('Use nodeInfoLiteDescriptor instead')
const NodeInfoLite$json = {
  '1': 'NodeInfoLite',
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
      '6': '.meshtastic.PositionLite',
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
    {'1': 'via_mqtt', '3': 8, '4': 1, '5': 8, '10': 'viaMqtt'},
    {'1': 'hops_away', '3': 9, '4': 1, '5': 13, '10': 'hopsAway'},
    {'1': 'is_favorite', '3': 10, '4': 1, '5': 8, '10': 'isFavorite'},
  ],
};

/// Descriptor for `NodeInfoLite`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nodeInfoLiteDescriptor = $convert.base64Decode(
    'CgxOb2RlSW5mb0xpdGUSEAoDbnVtGAEgASgNUgNudW0SJAoEdXNlchgCIAEoCzIQLm1lc2h0YX'
    'N0aWMuVXNlclIEdXNlchI0Cghwb3NpdGlvbhgDIAEoCzIYLm1lc2h0YXN0aWMuUG9zaXRpb25M'
    'aXRlUghwb3NpdGlvbhIQCgNzbnIYBCABKAJSA3NuchIdCgpsYXN0X2hlYXJkGAUgASgHUglsYX'
    'N0SGVhcmQSQAoOZGV2aWNlX21ldHJpY3MYBiABKAsyGS5tZXNodGFzdGljLkRldmljZU1ldHJp'
    'Y3NSDWRldmljZU1ldHJpY3MSGAoHY2hhbm5lbBgHIAEoDVIHY2hhbm5lbBIZCgh2aWFfbXF0dB'
    'gIIAEoCFIHdmlhTXF0dBIbCglob3BzX2F3YXkYCSABKA1SCGhvcHNBd2F5Eh8KC2lzX2Zhdm9y'
    'aXRlGAogASgIUgppc0Zhdm9yaXRl');

@$core.Deprecated('Use deviceStateDescriptor instead')
const DeviceState$json = {
  '1': 'DeviceState',
  '2': [
    {
      '1': 'my_node',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.MyNodeInfo',
      '10': 'myNode'
    },
    {
      '1': 'owner',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.User',
      '10': 'owner'
    },
    {
      '1': 'receive_queue',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.meshtastic.MeshPacket',
      '10': 'receiveQueue'
    },
    {'1': 'version', '3': 8, '4': 1, '5': 13, '10': 'version'},
    {
      '1': 'rx_text_message',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.MeshPacket',
      '10': 'rxTextMessage'
    },
    {
      '1': 'no_save',
      '3': 9,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '10': 'noSave',
    },
    {'1': 'did_gps_reset', '3': 11, '4': 1, '5': 8, '10': 'didGpsReset'},
    {
      '1': 'rx_waypoint',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.MeshPacket',
      '10': 'rxWaypoint'
    },
    {
      '1': 'node_remote_hardware_pins',
      '3': 13,
      '4': 3,
      '5': 11,
      '6': '.meshtastic.NodeRemoteHardwarePin',
      '10': 'nodeRemoteHardwarePins'
    },
    {
      '1': 'node_db_lite',
      '3': 14,
      '4': 3,
      '5': 11,
      '6': '.meshtastic.NodeInfoLite',
      '8': {},
      '10': 'nodeDbLite'
    },
  ],
};

/// Descriptor for `DeviceState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceStateDescriptor = $convert.base64Decode(
    'CgtEZXZpY2VTdGF0ZRIvCgdteV9ub2RlGAIgASgLMhYubWVzaHRhc3RpYy5NeU5vZGVJbmZvUg'
    'ZteU5vZGUSJgoFb3duZXIYAyABKAsyEC5tZXNodGFzdGljLlVzZXJSBW93bmVyEjsKDXJlY2Vp'
    'dmVfcXVldWUYBSADKAsyFi5tZXNodGFzdGljLk1lc2hQYWNrZXRSDHJlY2VpdmVRdWV1ZRIYCg'
    'd2ZXJzaW9uGAggASgNUgd2ZXJzaW9uEj4KD3J4X3RleHRfbWVzc2FnZRgHIAEoCzIWLm1lc2h0'
    'YXN0aWMuTWVzaFBhY2tldFINcnhUZXh0TWVzc2FnZRIbCgdub19zYXZlGAkgASgIQgIYAVIGbm'
    '9TYXZlEiIKDWRpZF9ncHNfcmVzZXQYCyABKAhSC2RpZEdwc1Jlc2V0EjcKC3J4X3dheXBvaW50'
    'GAwgASgLMhYubWVzaHRhc3RpYy5NZXNoUGFja2V0UgpyeFdheXBvaW50ElwKGW5vZGVfcmVtb3'
    'RlX2hhcmR3YXJlX3BpbnMYDSADKAsyIS5tZXNodGFzdGljLk5vZGVSZW1vdGVIYXJkd2FyZVBp'
    'blIWbm9kZVJlbW90ZUhhcmR3YXJlUGlucxJmCgxub2RlX2RiX2xpdGUYDiADKAsyGC5tZXNodG'
    'FzdGljLk5vZGVJbmZvTGl0ZUIqkj8nkgEkc3RkOjp2ZWN0b3I8bWVzaHRhc3RpY19Ob2RlSW5m'
    'b0xpdGU+Ugpub2RlRGJMaXRl');

@$core.Deprecated('Use channelFileDescriptor instead')
const ChannelFile$json = {
  '1': 'ChannelFile',
  '2': [
    {
      '1': 'channels',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.meshtastic.Channel',
      '10': 'channels'
    },
    {'1': 'version', '3': 2, '4': 1, '5': 13, '10': 'version'},
  ],
};

/// Descriptor for `ChannelFile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List channelFileDescriptor = $convert.base64Decode(
    'CgtDaGFubmVsRmlsZRIvCghjaGFubmVscxgBIAMoCzITLm1lc2h0YXN0aWMuQ2hhbm5lbFIIY2'
    'hhbm5lbHMSGAoHdmVyc2lvbhgCIAEoDVIHdmVyc2lvbg==');

@$core.Deprecated('Use oEMStoreDescriptor instead')
const OEMStore$json = {
  '1': 'OEMStore',
  '2': [
    {'1': 'oem_icon_width', '3': 1, '4': 1, '5': 13, '10': 'oemIconWidth'},
    {'1': 'oem_icon_height', '3': 2, '4': 1, '5': 13, '10': 'oemIconHeight'},
    {'1': 'oem_icon_bits', '3': 3, '4': 1, '5': 12, '10': 'oemIconBits'},
    {
      '1': 'oem_font',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.meshtastic.ScreenFonts',
      '10': 'oemFont'
    },
    {'1': 'oem_text', '3': 5, '4': 1, '5': 9, '10': 'oemText'},
    {'1': 'oem_aes_key', '3': 6, '4': 1, '5': 12, '10': 'oemAesKey'},
    {
      '1': 'oem_local_config',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.LocalConfig',
      '10': 'oemLocalConfig'
    },
    {
      '1': 'oem_local_module_config',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.LocalModuleConfig',
      '10': 'oemLocalModuleConfig'
    },
  ],
};

/// Descriptor for `OEMStore`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List oEMStoreDescriptor = $convert.base64Decode(
    'CghPRU1TdG9yZRIkCg5vZW1faWNvbl93aWR0aBgBIAEoDVIMb2VtSWNvbldpZHRoEiYKD29lbV'
    '9pY29uX2hlaWdodBgCIAEoDVINb2VtSWNvbkhlaWdodBIiCg1vZW1faWNvbl9iaXRzGAMgASgM'
    'UgtvZW1JY29uQml0cxIyCghvZW1fZm9udBgEIAEoDjIXLm1lc2h0YXN0aWMuU2NyZWVuRm9udH'
    'NSB29lbUZvbnQSGQoIb2VtX3RleHQYBSABKAlSB29lbVRleHQSHgoLb2VtX2Flc19rZXkYBiAB'
    'KAxSCW9lbUFlc0tleRJBChBvZW1fbG9jYWxfY29uZmlnGAcgASgLMhcubWVzaHRhc3RpYy5Mb2'
    'NhbENvbmZpZ1IOb2VtTG9jYWxDb25maWcSVAoXb2VtX2xvY2FsX21vZHVsZV9jb25maWcYCCAB'
    'KAsyHS5tZXNodGFzdGljLkxvY2FsTW9kdWxlQ29uZmlnUhRvZW1Mb2NhbE1vZHVsZUNvbmZpZw'
    '==');
