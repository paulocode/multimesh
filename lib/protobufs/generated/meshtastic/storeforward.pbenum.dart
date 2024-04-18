//
//  Generated code. Do not modify.
//  source: meshtastic/storeforward.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

///
///  001 - 063 = From Router
///  064 - 127 = From Client
class StoreAndForward_RequestResponse extends $pb.ProtobufEnum {
  static const StoreAndForward_RequestResponse UNSET = StoreAndForward_RequestResponse._(0, _omitEnumNames ? '' : 'UNSET');
  static const StoreAndForward_RequestResponse ROUTER_ERROR = StoreAndForward_RequestResponse._(1, _omitEnumNames ? '' : 'ROUTER_ERROR');
  static const StoreAndForward_RequestResponse ROUTER_HEARTBEAT = StoreAndForward_RequestResponse._(2, _omitEnumNames ? '' : 'ROUTER_HEARTBEAT');
  static const StoreAndForward_RequestResponse ROUTER_PING = StoreAndForward_RequestResponse._(3, _omitEnumNames ? '' : 'ROUTER_PING');
  static const StoreAndForward_RequestResponse ROUTER_PONG = StoreAndForward_RequestResponse._(4, _omitEnumNames ? '' : 'ROUTER_PONG');
  static const StoreAndForward_RequestResponse ROUTER_BUSY = StoreAndForward_RequestResponse._(5, _omitEnumNames ? '' : 'ROUTER_BUSY');
  static const StoreAndForward_RequestResponse ROUTER_HISTORY = StoreAndForward_RequestResponse._(6, _omitEnumNames ? '' : 'ROUTER_HISTORY');
  static const StoreAndForward_RequestResponse ROUTER_STATS = StoreAndForward_RequestResponse._(7, _omitEnumNames ? '' : 'ROUTER_STATS');
  static const StoreAndForward_RequestResponse ROUTER_TEXT_DIRECT = StoreAndForward_RequestResponse._(8, _omitEnumNames ? '' : 'ROUTER_TEXT_DIRECT');
  static const StoreAndForward_RequestResponse ROUTER_TEXT_BROADCAST = StoreAndForward_RequestResponse._(9, _omitEnumNames ? '' : 'ROUTER_TEXT_BROADCAST');
  static const StoreAndForward_RequestResponse CLIENT_ERROR = StoreAndForward_RequestResponse._(64, _omitEnumNames ? '' : 'CLIENT_ERROR');
  static const StoreAndForward_RequestResponse CLIENT_HISTORY = StoreAndForward_RequestResponse._(65, _omitEnumNames ? '' : 'CLIENT_HISTORY');
  static const StoreAndForward_RequestResponse CLIENT_STATS = StoreAndForward_RequestResponse._(66, _omitEnumNames ? '' : 'CLIENT_STATS');
  static const StoreAndForward_RequestResponse CLIENT_PING = StoreAndForward_RequestResponse._(67, _omitEnumNames ? '' : 'CLIENT_PING');
  static const StoreAndForward_RequestResponse CLIENT_PONG = StoreAndForward_RequestResponse._(68, _omitEnumNames ? '' : 'CLIENT_PONG');
  static const StoreAndForward_RequestResponse CLIENT_ABORT = StoreAndForward_RequestResponse._(106, _omitEnumNames ? '' : 'CLIENT_ABORT');

  static const $core.List<StoreAndForward_RequestResponse> values = <StoreAndForward_RequestResponse> [
    UNSET,
    ROUTER_ERROR,
    ROUTER_HEARTBEAT,
    ROUTER_PING,
    ROUTER_PONG,
    ROUTER_BUSY,
    ROUTER_HISTORY,
    ROUTER_STATS,
    ROUTER_TEXT_DIRECT,
    ROUTER_TEXT_BROADCAST,
    CLIENT_ERROR,
    CLIENT_HISTORY,
    CLIENT_STATS,
    CLIENT_PING,
    CLIENT_PONG,
    CLIENT_ABORT,
  ];

  static final $core.Map<$core.int, StoreAndForward_RequestResponse> _byValue = $pb.ProtobufEnum.initByValue(values);
  static StoreAndForward_RequestResponse? valueOf($core.int value) => _byValue[value];

  const StoreAndForward_RequestResponse._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
