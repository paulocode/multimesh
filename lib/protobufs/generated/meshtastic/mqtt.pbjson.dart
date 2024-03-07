//
//  Generated code. Do not modify.
//  source: meshtastic/mqtt.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use serviceEnvelopeDescriptor instead')
const ServiceEnvelope$json = {
  '1': 'ServiceEnvelope',
  '2': [
    {
      '1': 'packet',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.MeshPacket',
      '10': 'packet'
    },
    {'1': 'channel_id', '3': 2, '4': 1, '5': 9, '10': 'channelId'},
    {'1': 'gateway_id', '3': 3, '4': 1, '5': 9, '10': 'gatewayId'},
  ],
};

/// Descriptor for `ServiceEnvelope`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serviceEnvelopeDescriptor = $convert.base64Decode(
    'Cg9TZXJ2aWNlRW52ZWxvcGUSLgoGcGFja2V0GAEgASgLMhYubWVzaHRhc3RpYy5NZXNoUGFja2'
    'V0UgZwYWNrZXQSHQoKY2hhbm5lbF9pZBgCIAEoCVIJY2hhbm5lbElkEh0KCmdhdGV3YXlfaWQY'
    'AyABKAlSCWdhdGV3YXlJZA==');
