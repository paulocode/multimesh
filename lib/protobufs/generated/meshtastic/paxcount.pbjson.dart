//
//  Generated code. Do not modify.
//  source: meshtastic/paxcount.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use paxcountDescriptor instead')
const Paxcount$json = {
  '1': 'Paxcount',
  '2': [
    {'1': 'wifi', '3': 1, '4': 1, '5': 13, '10': 'wifi'},
    {'1': 'ble', '3': 2, '4': 1, '5': 13, '10': 'ble'},
    {'1': 'uptime', '3': 3, '4': 1, '5': 13, '10': 'uptime'},
  ],
};

/// Descriptor for `Paxcount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paxcountDescriptor = $convert.base64Decode(
    'CghQYXhjb3VudBISCgR3aWZpGAEgASgNUgR3aWZpEhAKA2JsZRgCIAEoDVIDYmxlEhYKBnVwdG'
    'ltZRgDIAEoDVIGdXB0aW1l');

