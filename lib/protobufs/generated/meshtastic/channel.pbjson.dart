//
//  Generated code. Do not modify.
//  source: meshtastic/channel.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use channelSettingsDescriptor instead')
const ChannelSettings$json = {
  '1': 'ChannelSettings',
  '2': [
    {
      '1': 'channel_num',
      '3': 1,
      '4': 1,
      '5': 13,
      '8': {'3': true},
      '10': 'channelNum',
    },
    {'1': 'psk', '3': 2, '4': 1, '5': 12, '10': 'psk'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'id', '3': 4, '4': 1, '5': 7, '10': 'id'},
    {'1': 'uplink_enabled', '3': 5, '4': 1, '5': 8, '10': 'uplinkEnabled'},
    {'1': 'downlink_enabled', '3': 6, '4': 1, '5': 8, '10': 'downlinkEnabled'},
  ],
};

/// Descriptor for `ChannelSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List channelSettingsDescriptor = $convert.base64Decode(
    'Cg9DaGFubmVsU2V0dGluZ3MSIwoLY2hhbm5lbF9udW0YASABKA1CAhgBUgpjaGFubmVsTnVtEh'
    'AKA3BzaxgCIAEoDFIDcHNrEhIKBG5hbWUYAyABKAlSBG5hbWUSDgoCaWQYBCABKAdSAmlkEiUK'
    'DnVwbGlua19lbmFibGVkGAUgASgIUg11cGxpbmtFbmFibGVkEikKEGRvd25saW5rX2VuYWJsZW'
    'QYBiABKAhSD2Rvd25saW5rRW5hYmxlZA==');

@$core.Deprecated('Use channelDescriptor instead')
const Channel$json = {
  '1': 'Channel',
  '2': [
    {'1': 'index', '3': 1, '4': 1, '5': 5, '10': 'index'},
    {
      '1': 'settings',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.ChannelSettings',
      '10': 'settings'
    },
    {
      '1': 'role',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.meshtastic.Channel.Role',
      '10': 'role'
    },
  ],
  '4': [Channel_Role$json],
};

@$core.Deprecated('Use channelDescriptor instead')
const Channel_Role$json = {
  '1': 'Role',
  '2': [
    {'1': 'DISABLED', '2': 0},
    {'1': 'PRIMARY', '2': 1},
    {'1': 'SECONDARY', '2': 2},
  ],
};

/// Descriptor for `Channel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List channelDescriptor = $convert.base64Decode(
    'CgdDaGFubmVsEhQKBWluZGV4GAEgASgFUgVpbmRleBI3CghzZXR0aW5ncxgCIAEoCzIbLm1lc2'
    'h0YXN0aWMuQ2hhbm5lbFNldHRpbmdzUghzZXR0aW5ncxIsCgRyb2xlGAMgASgOMhgubWVzaHRh'
    'c3RpYy5DaGFubmVsLlJvbGVSBHJvbGUiMAoEUm9sZRIMCghESVNBQkxFRBAAEgsKB1BSSU1BUl'
    'kQARINCglTRUNPTkRBUlkQAg==');
