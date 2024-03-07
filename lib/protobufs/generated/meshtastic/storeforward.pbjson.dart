//
//  Generated code. Do not modify.
//  source: meshtastic/storeforward.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use storeAndForwardDescriptor instead')
const StoreAndForward$json = {
  '1': 'StoreAndForward',
  '2': [
    {
      '1': 'rr',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.meshtastic.StoreAndForward.RequestResponse',
      '10': 'rr'
    },
    {
      '1': 'stats',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.StoreAndForward.Statistics',
      '9': 0,
      '10': 'stats'
    },
    {
      '1': 'history',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.StoreAndForward.History',
      '9': 0,
      '10': 'history'
    },
    {
      '1': 'heartbeat',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.meshtastic.StoreAndForward.Heartbeat',
      '9': 0,
      '10': 'heartbeat'
    },
    {'1': 'empty', '3': 5, '4': 1, '5': 8, '9': 0, '10': 'empty'},
  ],
  '3': [
    StoreAndForward_Statistics$json,
    StoreAndForward_History$json,
    StoreAndForward_Heartbeat$json
  ],
  '4': [StoreAndForward_RequestResponse$json],
  '8': [
    {'1': 'variant'},
  ],
};

@$core.Deprecated('Use storeAndForwardDescriptor instead')
const StoreAndForward_Statistics$json = {
  '1': 'Statistics',
  '2': [
    {'1': 'messages_total', '3': 1, '4': 1, '5': 13, '10': 'messagesTotal'},
    {'1': 'messages_saved', '3': 2, '4': 1, '5': 13, '10': 'messagesSaved'},
    {'1': 'messages_max', '3': 3, '4': 1, '5': 13, '10': 'messagesMax'},
    {'1': 'up_time', '3': 4, '4': 1, '5': 13, '10': 'upTime'},
    {'1': 'requests', '3': 5, '4': 1, '5': 13, '10': 'requests'},
    {'1': 'requests_history', '3': 6, '4': 1, '5': 13, '10': 'requestsHistory'},
    {'1': 'heartbeat', '3': 7, '4': 1, '5': 8, '10': 'heartbeat'},
    {'1': 'return_max', '3': 8, '4': 1, '5': 13, '10': 'returnMax'},
    {'1': 'return_window', '3': 9, '4': 1, '5': 13, '10': 'returnWindow'},
  ],
};

@$core.Deprecated('Use storeAndForwardDescriptor instead')
const StoreAndForward_History$json = {
  '1': 'History',
  '2': [
    {'1': 'history_messages', '3': 1, '4': 1, '5': 13, '10': 'historyMessages'},
    {'1': 'window', '3': 2, '4': 1, '5': 13, '10': 'window'},
    {'1': 'last_request', '3': 3, '4': 1, '5': 13, '10': 'lastRequest'},
  ],
};

@$core.Deprecated('Use storeAndForwardDescriptor instead')
const StoreAndForward_Heartbeat$json = {
  '1': 'Heartbeat',
  '2': [
    {'1': 'period', '3': 1, '4': 1, '5': 13, '10': 'period'},
    {'1': 'secondary', '3': 2, '4': 1, '5': 13, '10': 'secondary'},
  ],
};

@$core.Deprecated('Use storeAndForwardDescriptor instead')
const StoreAndForward_RequestResponse$json = {
  '1': 'RequestResponse',
  '2': [
    {'1': 'UNSET', '2': 0},
    {'1': 'ROUTER_ERROR', '2': 1},
    {'1': 'ROUTER_HEARTBEAT', '2': 2},
    {'1': 'ROUTER_PING', '2': 3},
    {'1': 'ROUTER_PONG', '2': 4},
    {'1': 'ROUTER_BUSY', '2': 5},
    {'1': 'ROUTER_HISTORY', '2': 6},
    {'1': 'ROUTER_STATS', '2': 7},
    {'1': 'CLIENT_ERROR', '2': 64},
    {'1': 'CLIENT_HISTORY', '2': 65},
    {'1': 'CLIENT_STATS', '2': 66},
    {'1': 'CLIENT_PING', '2': 67},
    {'1': 'CLIENT_PONG', '2': 68},
    {'1': 'CLIENT_ABORT', '2': 106},
  ],
};

/// Descriptor for `StoreAndForward`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storeAndForwardDescriptor = $convert.base64Decode(
    'Cg9TdG9yZUFuZEZvcndhcmQSOwoCcnIYASABKA4yKy5tZXNodGFzdGljLlN0b3JlQW5kRm9yd2'
    'FyZC5SZXF1ZXN0UmVzcG9uc2VSAnJyEj4KBXN0YXRzGAIgASgLMiYubWVzaHRhc3RpYy5TdG9y'
    'ZUFuZEZvcndhcmQuU3RhdGlzdGljc0gAUgVzdGF0cxI/CgdoaXN0b3J5GAMgASgLMiMubWVzaH'
    'Rhc3RpYy5TdG9yZUFuZEZvcndhcmQuSGlzdG9yeUgAUgdoaXN0b3J5EkUKCWhlYXJ0YmVhdBgE'
    'IAEoCzIlLm1lc2h0YXN0aWMuU3RvcmVBbmRGb3J3YXJkLkhlYXJ0YmVhdEgAUgloZWFydGJlYX'
    'QSFgoFZW1wdHkYBSABKAhIAFIFZW1wdHkavwIKClN0YXRpc3RpY3MSJQoObWVzc2FnZXNfdG90'
    'YWwYASABKA1SDW1lc3NhZ2VzVG90YWwSJQoObWVzc2FnZXNfc2F2ZWQYAiABKA1SDW1lc3NhZ2'
    'VzU2F2ZWQSIQoMbWVzc2FnZXNfbWF4GAMgASgNUgttZXNzYWdlc01heBIXCgd1cF90aW1lGAQg'
    'ASgNUgZ1cFRpbWUSGgoIcmVxdWVzdHMYBSABKA1SCHJlcXVlc3RzEikKEHJlcXVlc3RzX2hpc3'
    'RvcnkYBiABKA1SD3JlcXVlc3RzSGlzdG9yeRIcCgloZWFydGJlYXQYByABKAhSCWhlYXJ0YmVh'
    'dBIdCgpyZXR1cm5fbWF4GAggASgNUglyZXR1cm5NYXgSIwoNcmV0dXJuX3dpbmRvdxgJIAEoDV'
    'IMcmV0dXJuV2luZG93Gm8KB0hpc3RvcnkSKQoQaGlzdG9yeV9tZXNzYWdlcxgBIAEoDVIPaGlz'
    'dG9yeU1lc3NhZ2VzEhYKBndpbmRvdxgCIAEoDVIGd2luZG93EiEKDGxhc3RfcmVxdWVzdBgDIA'
    'EoDVILbGFzdFJlcXVlc3QaQQoJSGVhcnRiZWF0EhYKBnBlcmlvZBgBIAEoDVIGcGVyaW9kEhwK'
    'CXNlY29uZGFyeRgCIAEoDVIJc2Vjb25kYXJ5IokCCg9SZXF1ZXN0UmVzcG9uc2USCQoFVU5TRV'
    'QQABIQCgxST1VURVJfRVJST1IQARIUChBST1VURVJfSEVBUlRCRUFUEAISDwoLUk9VVEVSX1BJ'
    'TkcQAxIPCgtST1VURVJfUE9ORxAEEg8KC1JPVVRFUl9CVVNZEAUSEgoOUk9VVEVSX0hJU1RPUl'
    'kQBhIQCgxST1VURVJfU1RBVFMQBxIQCgxDTElFTlRfRVJST1IQQBISCg5DTElFTlRfSElTVE9S'
    'WRBBEhAKDENMSUVOVF9TVEFUUxBCEg8KC0NMSUVOVF9QSU5HEEMSDwoLQ0xJRU5UX1BPTkcQRB'
    'IQCgxDTElFTlRfQUJPUlQQakIJCgd2YXJpYW50');
