//
//  Generated code. Do not modify.
//  source: meshtastic/clientonly.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use deviceProfileDescriptor instead')
const DeviceProfile$json = {
  '1': 'DeviceProfile',
  '2': [
    {'1': 'long_name', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'longName', '17': true},
    {'1': 'short_name', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'shortName', '17': true},
    {'1': 'channel_url', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'channelUrl', '17': true},
    {'1': 'config', '3': 4, '4': 1, '5': 11, '6': '.meshtastic.LocalConfig', '9': 3, '10': 'config', '17': true},
    {'1': 'module_config', '3': 5, '4': 1, '5': 11, '6': '.meshtastic.LocalModuleConfig', '9': 4, '10': 'moduleConfig', '17': true},
  ],
  '8': [
    {'1': '_long_name'},
    {'1': '_short_name'},
    {'1': '_channel_url'},
    {'1': '_config'},
    {'1': '_module_config'},
  ],
};

/// Descriptor for `DeviceProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceProfileDescriptor = $convert.base64Decode(
    'Cg1EZXZpY2VQcm9maWxlEiAKCWxvbmdfbmFtZRgBIAEoCUgAUghsb25nTmFtZYgBARIiCgpzaG'
    '9ydF9uYW1lGAIgASgJSAFSCXNob3J0TmFtZYgBARIkCgtjaGFubmVsX3VybBgDIAEoCUgCUgpj'
    'aGFubmVsVXJsiAEBEjQKBmNvbmZpZxgEIAEoCzIXLm1lc2h0YXN0aWMuTG9jYWxDb25maWdIA1'
    'IGY29uZmlniAEBEkcKDW1vZHVsZV9jb25maWcYBSABKAsyHS5tZXNodGFzdGljLkxvY2FsTW9k'
    'dWxlQ29uZmlnSARSDG1vZHVsZUNvbmZpZ4gBAUIMCgpfbG9uZ19uYW1lQg0KC19zaG9ydF9uYW'
    '1lQg4KDF9jaGFubmVsX3VybEIJCgdfY29uZmlnQhAKDl9tb2R1bGVfY29uZmln');

