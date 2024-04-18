//
//  Generated code. Do not modify.
//  source: meshtastic/remote_hardware.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

///
///  TODO: REPLACE
class HardwareMessage_Type extends $pb.ProtobufEnum {
  static const HardwareMessage_Type UNSET = HardwareMessage_Type._(0, _omitEnumNames ? '' : 'UNSET');
  static const HardwareMessage_Type WRITE_GPIOS = HardwareMessage_Type._(1, _omitEnumNames ? '' : 'WRITE_GPIOS');
  static const HardwareMessage_Type WATCH_GPIOS = HardwareMessage_Type._(2, _omitEnumNames ? '' : 'WATCH_GPIOS');
  static const HardwareMessage_Type GPIOS_CHANGED = HardwareMessage_Type._(3, _omitEnumNames ? '' : 'GPIOS_CHANGED');
  static const HardwareMessage_Type READ_GPIOS = HardwareMessage_Type._(4, _omitEnumNames ? '' : 'READ_GPIOS');
  static const HardwareMessage_Type READ_GPIOS_REPLY = HardwareMessage_Type._(5, _omitEnumNames ? '' : 'READ_GPIOS_REPLY');

  static const $core.List<HardwareMessage_Type> values = <HardwareMessage_Type> [
    UNSET,
    WRITE_GPIOS,
    WATCH_GPIOS,
    GPIOS_CHANGED,
    READ_GPIOS,
    READ_GPIOS_REPLY,
  ];

  static final $core.Map<$core.int, HardwareMessage_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static HardwareMessage_Type? valueOf($core.int value) => _byValue[value];

  const HardwareMessage_Type._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
