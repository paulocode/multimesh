//
//  Generated code. Do not modify.
//  source: meshtastic/portnums.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

///
///  For any new 'apps' that run on the device or via sister apps on phones/PCs they should pick and use a
///  unique 'portnum' for their application.
///  If you are making a new app using meshtastic, please send in a pull request to add your 'portnum' to this
///  master table.
///  PortNums should be assigned in the following range:
///  0-63   Core Meshtastic use, do not use for third party apps
///  64-127 Registered 3rd party apps, send in a pull request that adds a new entry to portnums.proto to  register your application
///  256-511 Use one of these portnums for your private applications that you don't want to register publically
///  All other values are reserved.
///  Note: This was formerly a Type enum named 'typ' with the same id #
///  We have change to this 'portnum' based scheme for specifying app handlers for particular payloads.
///  This change is backwards compatible by treating the legacy OPAQUE/CLEAR_TEXT values identically.
class PortNum extends $pb.ProtobufEnum {
  static const PortNum UNKNOWN_APP =
      PortNum._(0, _omitEnumNames ? '' : 'UNKNOWN_APP');
  static const PortNum TEXT_MESSAGE_APP =
      PortNum._(1, _omitEnumNames ? '' : 'TEXT_MESSAGE_APP');
  static const PortNum REMOTE_HARDWARE_APP =
      PortNum._(2, _omitEnumNames ? '' : 'REMOTE_HARDWARE_APP');
  static const PortNum POSITION_APP =
      PortNum._(3, _omitEnumNames ? '' : 'POSITION_APP');
  static const PortNum NODEINFO_APP =
      PortNum._(4, _omitEnumNames ? '' : 'NODEINFO_APP');
  static const PortNum ROUTING_APP =
      PortNum._(5, _omitEnumNames ? '' : 'ROUTING_APP');
  static const PortNum ADMIN_APP =
      PortNum._(6, _omitEnumNames ? '' : 'ADMIN_APP');
  static const PortNum TEXT_MESSAGE_COMPRESSED_APP =
      PortNum._(7, _omitEnumNames ? '' : 'TEXT_MESSAGE_COMPRESSED_APP');
  static const PortNum WAYPOINT_APP =
      PortNum._(8, _omitEnumNames ? '' : 'WAYPOINT_APP');
  static const PortNum AUDIO_APP =
      PortNum._(9, _omitEnumNames ? '' : 'AUDIO_APP');
  static const PortNum DETECTION_SENSOR_APP =
      PortNum._(10, _omitEnumNames ? '' : 'DETECTION_SENSOR_APP');
  static const PortNum REPLY_APP =
      PortNum._(32, _omitEnumNames ? '' : 'REPLY_APP');
  static const PortNum IP_TUNNEL_APP =
      PortNum._(33, _omitEnumNames ? '' : 'IP_TUNNEL_APP');
  static const PortNum PAXCOUNTER_APP =
      PortNum._(34, _omitEnumNames ? '' : 'PAXCOUNTER_APP');
  static const PortNum SERIAL_APP =
      PortNum._(64, _omitEnumNames ? '' : 'SERIAL_APP');
  static const PortNum STORE_FORWARD_APP =
      PortNum._(65, _omitEnumNames ? '' : 'STORE_FORWARD_APP');
  static const PortNum RANGE_TEST_APP =
      PortNum._(66, _omitEnumNames ? '' : 'RANGE_TEST_APP');
  static const PortNum TELEMETRY_APP =
      PortNum._(67, _omitEnumNames ? '' : 'TELEMETRY_APP');
  static const PortNum ZPS_APP = PortNum._(68, _omitEnumNames ? '' : 'ZPS_APP');
  static const PortNum SIMULATOR_APP =
      PortNum._(69, _omitEnumNames ? '' : 'SIMULATOR_APP');
  static const PortNum TRACEROUTE_APP =
      PortNum._(70, _omitEnumNames ? '' : 'TRACEROUTE_APP');
  static const PortNum NEIGHBORINFO_APP =
      PortNum._(71, _omitEnumNames ? '' : 'NEIGHBORINFO_APP');
  static const PortNum PRIVATE_APP =
      PortNum._(256, _omitEnumNames ? '' : 'PRIVATE_APP');
  static const PortNum ATAK_FORWARDER =
      PortNum._(257, _omitEnumNames ? '' : 'ATAK_FORWARDER');
  static const PortNum MAX = PortNum._(511, _omitEnumNames ? '' : 'MAX');

  static const $core.List<PortNum> values = <PortNum>[
    UNKNOWN_APP,
    TEXT_MESSAGE_APP,
    REMOTE_HARDWARE_APP,
    POSITION_APP,
    NODEINFO_APP,
    ROUTING_APP,
    ADMIN_APP,
    TEXT_MESSAGE_COMPRESSED_APP,
    WAYPOINT_APP,
    AUDIO_APP,
    DETECTION_SENSOR_APP,
    REPLY_APP,
    IP_TUNNEL_APP,
    PAXCOUNTER_APP,
    SERIAL_APP,
    STORE_FORWARD_APP,
    RANGE_TEST_APP,
    TELEMETRY_APP,
    ZPS_APP,
    SIMULATOR_APP,
    TRACEROUTE_APP,
    NEIGHBORINFO_APP,
    PRIVATE_APP,
    ATAK_FORWARDER,
    MAX,
  ];

  static final $core.Map<$core.int, PortNum> _byValue =
      $pb.ProtobufEnum.initByValue(values);

  static PortNum? valueOf($core.int value) => _byValue[value];

  const PortNum._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
