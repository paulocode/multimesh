//
//  Generated code. Do not modify.
//  source: nanopb.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use fieldTypeDescriptor instead')
const FieldType$json = {
  '1': 'FieldType',
  '2': [
    {'1': 'FT_DEFAULT', '2': 0},
    {'1': 'FT_CALLBACK', '2': 1},
    {'1': 'FT_POINTER', '2': 4},
    {'1': 'FT_STATIC', '2': 2},
    {'1': 'FT_IGNORE', '2': 3},
    {'1': 'FT_INLINE', '2': 5},
  ],
};

/// Descriptor for `FieldType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List fieldTypeDescriptor = $convert.base64Decode(
    'CglGaWVsZFR5cGUSDgoKRlRfREVGQVVMVBAAEg8KC0ZUX0NBTExCQUNLEAESDgoKRlRfUE9JTl'
    'RFUhAEEg0KCUZUX1NUQVRJQxACEg0KCUZUX0lHTk9SRRADEg0KCUZUX0lOTElORRAF');

@$core.Deprecated('Use intSizeDescriptor instead')
const IntSize$json = {
  '1': 'IntSize',
  '2': [
    {'1': 'IS_DEFAULT', '2': 0},
    {'1': 'IS_8', '2': 8},
    {'1': 'IS_16', '2': 16},
    {'1': 'IS_32', '2': 32},
    {'1': 'IS_64', '2': 64},
  ],
};

/// Descriptor for `IntSize`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List intSizeDescriptor = $convert.base64Decode(
    'CgdJbnRTaXplEg4KCklTX0RFRkFVTFQQABIICgRJU184EAgSCQoFSVNfMTYQEBIJCgVJU18zMh'
    'AgEgkKBUlTXzY0EEA=');

@$core.Deprecated('Use typenameManglingDescriptor instead')
const TypenameMangling$json = {
  '1': 'TypenameMangling',
  '2': [
    {'1': 'M_NONE', '2': 0},
    {'1': 'M_STRIP_PACKAGE', '2': 1},
    {'1': 'M_FLATTEN', '2': 2},
    {'1': 'M_PACKAGE_INITIALS', '2': 3},
  ],
};

/// Descriptor for `TypenameMangling`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List typenameManglingDescriptor = $convert.base64Decode(
    'ChBUeXBlbmFtZU1hbmdsaW5nEgoKBk1fTk9ORRAAEhMKD01fU1RSSVBfUEFDS0FHRRABEg0KCU'
    '1fRkxBVFRFThACEhYKEk1fUEFDS0FHRV9JTklUSUFMUxAD');

@$core.Deprecated('Use descriptorSizeDescriptor instead')
const DescriptorSize$json = {
  '1': 'DescriptorSize',
  '2': [
    {'1': 'DS_AUTO', '2': 0},
    {'1': 'DS_1', '2': 1},
    {'1': 'DS_2', '2': 2},
    {'1': 'DS_4', '2': 4},
    {'1': 'DS_8', '2': 8},
  ],
};

/// Descriptor for `DescriptorSize`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List descriptorSizeDescriptor = $convert.base64Decode(
    'Cg5EZXNjcmlwdG9yU2l6ZRILCgdEU19BVVRPEAASCAoERFNfMRABEggKBERTXzIQAhIICgREU1'
    '80EAQSCAoERFNfOBAI');

@$core.Deprecated('Use nanoPBOptionsDescriptor instead')
const NanoPBOptions$json = {
  '1': 'NanoPBOptions',
  '2': [
    {'1': 'max_size', '3': 1, '4': 1, '5': 5, '10': 'maxSize'},
    {'1': 'max_length', '3': 14, '4': 1, '5': 5, '10': 'maxLength'},
    {'1': 'max_count', '3': 2, '4': 1, '5': 5, '10': 'maxCount'},
    {
      '1': 'int_size',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.IntSize',
      '7': 'IS_DEFAULT',
      '10': 'intSize'
    },
    {
      '1': 'type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.FieldType',
      '7': 'FT_DEFAULT',
      '10': 'type'
    },
    {'1': 'long_names', '3': 4, '4': 1, '5': 8, '7': 'true', '10': 'longNames'},
    {
      '1': 'packed_struct',
      '3': 5,
      '4': 1,
      '5': 8,
      '7': 'false',
      '10': 'packedStruct'
    },
    {
      '1': 'packed_enum',
      '3': 10,
      '4': 1,
      '5': 8,
      '7': 'false',
      '10': 'packedEnum'
    },
    {
      '1': 'skip_message',
      '3': 6,
      '4': 1,
      '5': 8,
      '7': 'false',
      '10': 'skipMessage'
    },
    {'1': 'no_unions', '3': 8, '4': 1, '5': 8, '7': 'false', '10': 'noUnions'},
    {'1': 'msgid', '3': 9, '4': 1, '5': 13, '10': 'msgid'},
    {
      '1': 'anonymous_oneof',
      '3': 11,
      '4': 1,
      '5': 8,
      '7': 'false',
      '10': 'anonymousOneof'
    },
    {'1': 'proto3', '3': 12, '4': 1, '5': 8, '7': 'false', '10': 'proto3'},
    {
      '1': 'proto3_singular_msgs',
      '3': 21,
      '4': 1,
      '5': 8,
      '7': 'false',
      '10': 'proto3SingularMsgs'
    },
    {
      '1': 'enum_to_string',
      '3': 13,
      '4': 1,
      '5': 8,
      '7': 'false',
      '10': 'enumToString'
    },
    {
      '1': 'fixed_length',
      '3': 15,
      '4': 1,
      '5': 8,
      '7': 'false',
      '10': 'fixedLength'
    },
    {
      '1': 'fixed_count',
      '3': 16,
      '4': 1,
      '5': 8,
      '7': 'false',
      '10': 'fixedCount'
    },
    {
      '1': 'submsg_callback',
      '3': 22,
      '4': 1,
      '5': 8,
      '7': 'false',
      '10': 'submsgCallback'
    },
    {
      '1': 'mangle_names',
      '3': 17,
      '4': 1,
      '5': 14,
      '6': '.TypenameMangling',
      '7': 'M_NONE',
      '10': 'mangleNames'
    },
    {
      '1': 'callback_datatype',
      '3': 18,
      '4': 1,
      '5': 9,
      '7': 'pb_callback_t',
      '10': 'callbackDatatype'
    },
    {
      '1': 'callback_function',
      '3': 19,
      '4': 1,
      '5': 9,
      '7': 'pb_default_field_callback',
      '10': 'callbackFunction'
    },
    {
      '1': 'descriptorsize',
      '3': 20,
      '4': 1,
      '5': 14,
      '6': '.DescriptorSize',
      '7': 'DS_AUTO',
      '10': 'descriptorsize'
    },
    {
      '1': 'default_has',
      '3': 23,
      '4': 1,
      '5': 8,
      '7': 'false',
      '10': 'defaultHas'
    },
    {'1': 'include', '3': 24, '4': 3, '5': 9, '10': 'include'},
    {'1': 'exclude', '3': 26, '4': 3, '5': 9, '10': 'exclude'},
    {'1': 'package', '3': 25, '4': 1, '5': 9, '10': 'package'},
    {
      '1': 'type_override',
      '3': 27,
      '4': 1,
      '5': 14,
      '6': '.google.protobuf.FieldDescriptorProto.Type',
      '10': 'typeOverride'
    },
    {
      '1': 'sort_by_tag',
      '3': 28,
      '4': 1,
      '5': 8,
      '7': 'true',
      '10': 'sortByTag'
    },
    {
      '1': 'fallback_type',
      '3': 29,
      '4': 1,
      '5': 14,
      '6': '.FieldType',
      '7': 'FT_CALLBACK',
      '10': 'fallbackType'
    },
  ],
};

/// Descriptor for `NanoPBOptions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nanoPBOptionsDescriptor = $convert.base64Decode(
    'Cg1OYW5vUEJPcHRpb25zEhkKCG1heF9zaXplGAEgASgFUgdtYXhTaXplEh0KCm1heF9sZW5ndG'
    'gYDiABKAVSCW1heExlbmd0aBIbCgltYXhfY291bnQYAiABKAVSCG1heENvdW50Ei8KCGludF9z'
    'aXplGAcgASgOMgguSW50U2l6ZToKSVNfREVGQVVMVFIHaW50U2l6ZRIqCgR0eXBlGAMgASgOMg'
    'ouRmllbGRUeXBlOgpGVF9ERUZBVUxUUgR0eXBlEiMKCmxvbmdfbmFtZXMYBCABKAg6BHRydWVS'
    'CWxvbmdOYW1lcxIqCg1wYWNrZWRfc3RydWN0GAUgASgIOgVmYWxzZVIMcGFja2VkU3RydWN0Ei'
    'YKC3BhY2tlZF9lbnVtGAogASgIOgVmYWxzZVIKcGFja2VkRW51bRIoCgxza2lwX21lc3NhZ2UY'
    'BiABKAg6BWZhbHNlUgtza2lwTWVzc2FnZRIiCglub191bmlvbnMYCCABKAg6BWZhbHNlUghub1'
    'VuaW9ucxIUCgVtc2dpZBgJIAEoDVIFbXNnaWQSLgoPYW5vbnltb3VzX29uZW9mGAsgASgIOgVm'
    'YWxzZVIOYW5vbnltb3VzT25lb2YSHQoGcHJvdG8zGAwgASgIOgVmYWxzZVIGcHJvdG8zEjcKFH'
    'Byb3RvM19zaW5ndWxhcl9tc2dzGBUgASgIOgVmYWxzZVIScHJvdG8zU2luZ3VsYXJNc2dzEisK'
    'DmVudW1fdG9fc3RyaW5nGA0gASgIOgVmYWxzZVIMZW51bVRvU3RyaW5nEigKDGZpeGVkX2xlbm'
    'd0aBgPIAEoCDoFZmFsc2VSC2ZpeGVkTGVuZ3RoEiYKC2ZpeGVkX2NvdW50GBAgASgIOgVmYWxz'
    'ZVIKZml4ZWRDb3VudBIuCg9zdWJtc2dfY2FsbGJhY2sYFiABKAg6BWZhbHNlUg5zdWJtc2dDYW'
    'xsYmFjaxI8CgxtYW5nbGVfbmFtZXMYESABKA4yES5UeXBlbmFtZU1hbmdsaW5nOgZNX05PTkVS'
    'C21hbmdsZU5hbWVzEjoKEWNhbGxiYWNrX2RhdGF0eXBlGBIgASgJOg1wYl9jYWxsYmFja190Uh'
    'BjYWxsYmFja0RhdGF0eXBlEkYKEWNhbGxiYWNrX2Z1bmN0aW9uGBMgASgJOhlwYl9kZWZhdWx0'
    'X2ZpZWxkX2NhbGxiYWNrUhBjYWxsYmFja0Z1bmN0aW9uEkAKDmRlc2NyaXB0b3JzaXplGBQgAS'
    'gOMg8uRGVzY3JpcHRvclNpemU6B0RTX0FVVE9SDmRlc2NyaXB0b3JzaXplEiYKC2RlZmF1bHRf'
    'aGFzGBcgASgIOgVmYWxzZVIKZGVmYXVsdEhhcxIYCgdpbmNsdWRlGBggAygJUgdpbmNsdWRlEh'
    'gKB2V4Y2x1ZGUYGiADKAlSB2V4Y2x1ZGUSGAoHcGFja2FnZRgZIAEoCVIHcGFja2FnZRJPCg10'
    'eXBlX292ZXJyaWRlGBsgASgOMiouZ29vZ2xlLnByb3RvYnVmLkZpZWxkRGVzY3JpcHRvclByb3'
    'RvLlR5cGVSDHR5cGVPdmVycmlkZRIkCgtzb3J0X2J5X3RhZxgcIAEoCDoEdHJ1ZVIJc29ydEJ5'
    'VGFnEjwKDWZhbGxiYWNrX3R5cGUYHSABKA4yCi5GaWVsZFR5cGU6C0ZUX0NBTExCQUNLUgxmYW'
    'xsYmFja1R5cGU=');
