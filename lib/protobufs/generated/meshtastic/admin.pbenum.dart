//
//  Generated code. Do not modify.
//  source: meshtastic/admin.proto
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
class AdminMessage_ConfigType extends $pb.ProtobufEnum {
  static const AdminMessage_ConfigType DEVICE_CONFIG =
      AdminMessage_ConfigType._(0, _omitEnumNames ? '' : 'DEVICE_CONFIG');
  static const AdminMessage_ConfigType POSITION_CONFIG =
      AdminMessage_ConfigType._(1, _omitEnumNames ? '' : 'POSITION_CONFIG');
  static const AdminMessage_ConfigType POWER_CONFIG =
      AdminMessage_ConfigType._(2, _omitEnumNames ? '' : 'POWER_CONFIG');
  static const AdminMessage_ConfigType NETWORK_CONFIG =
      AdminMessage_ConfigType._(3, _omitEnumNames ? '' : 'NETWORK_CONFIG');
  static const AdminMessage_ConfigType DISPLAY_CONFIG =
      AdminMessage_ConfigType._(4, _omitEnumNames ? '' : 'DISPLAY_CONFIG');
  static const AdminMessage_ConfigType LORA_CONFIG =
      AdminMessage_ConfigType._(5, _omitEnumNames ? '' : 'LORA_CONFIG');
  static const AdminMessage_ConfigType BLUETOOTH_CONFIG =
      AdminMessage_ConfigType._(6, _omitEnumNames ? '' : 'BLUETOOTH_CONFIG');

  static const $core.List<AdminMessage_ConfigType> values =
      <AdminMessage_ConfigType>[
    DEVICE_CONFIG,
    POSITION_CONFIG,
    POWER_CONFIG,
    NETWORK_CONFIG,
    DISPLAY_CONFIG,
    LORA_CONFIG,
    BLUETOOTH_CONFIG,
  ];

  static final $core.Map<$core.int, AdminMessage_ConfigType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static AdminMessage_ConfigType? valueOf($core.int value) => _byValue[value];

  const AdminMessage_ConfigType._($core.int v, $core.String n) : super(v, n);
}

///
///  TODO: REPLACE
class AdminMessage_ModuleConfigType extends $pb.ProtobufEnum {
  static const AdminMessage_ModuleConfigType MQTT_CONFIG =
      AdminMessage_ModuleConfigType._(0, _omitEnumNames ? '' : 'MQTT_CONFIG');
  static const AdminMessage_ModuleConfigType SERIAL_CONFIG =
      AdminMessage_ModuleConfigType._(1, _omitEnumNames ? '' : 'SERIAL_CONFIG');
  static const AdminMessage_ModuleConfigType EXTNOTIF_CONFIG =
      AdminMessage_ModuleConfigType._(
          2, _omitEnumNames ? '' : 'EXTNOTIF_CONFIG');
  static const AdminMessage_ModuleConfigType STOREFORWARD_CONFIG =
      AdminMessage_ModuleConfigType._(
          3, _omitEnumNames ? '' : 'STOREFORWARD_CONFIG');
  static const AdminMessage_ModuleConfigType RANGETEST_CONFIG =
      AdminMessage_ModuleConfigType._(
          4, _omitEnumNames ? '' : 'RANGETEST_CONFIG');
  static const AdminMessage_ModuleConfigType TELEMETRY_CONFIG =
      AdminMessage_ModuleConfigType._(
          5, _omitEnumNames ? '' : 'TELEMETRY_CONFIG');
  static const AdminMessage_ModuleConfigType CANNEDMSG_CONFIG =
      AdminMessage_ModuleConfigType._(
          6, _omitEnumNames ? '' : 'CANNEDMSG_CONFIG');
  static const AdminMessage_ModuleConfigType AUDIO_CONFIG =
      AdminMessage_ModuleConfigType._(7, _omitEnumNames ? '' : 'AUDIO_CONFIG');
  static const AdminMessage_ModuleConfigType REMOTEHARDWARE_CONFIG =
      AdminMessage_ModuleConfigType._(
          8, _omitEnumNames ? '' : 'REMOTEHARDWARE_CONFIG');
  static const AdminMessage_ModuleConfigType NEIGHBORINFO_CONFIG =
      AdminMessage_ModuleConfigType._(
          9, _omitEnumNames ? '' : 'NEIGHBORINFO_CONFIG');
  static const AdminMessage_ModuleConfigType AMBIENTLIGHTING_CONFIG =
      AdminMessage_ModuleConfigType._(
          10, _omitEnumNames ? '' : 'AMBIENTLIGHTING_CONFIG');
  static const AdminMessage_ModuleConfigType DETECTIONSENSOR_CONFIG =
      AdminMessage_ModuleConfigType._(
          11, _omitEnumNames ? '' : 'DETECTIONSENSOR_CONFIG');
  static const AdminMessage_ModuleConfigType PAXCOUNTER_CONFIG =
      AdminMessage_ModuleConfigType._(
          12, _omitEnumNames ? '' : 'PAXCOUNTER_CONFIG');

  static const $core.List<AdminMessage_ModuleConfigType> values =
      <AdminMessage_ModuleConfigType>[
    MQTT_CONFIG,
    SERIAL_CONFIG,
    EXTNOTIF_CONFIG,
    STOREFORWARD_CONFIG,
    RANGETEST_CONFIG,
    TELEMETRY_CONFIG,
    CANNEDMSG_CONFIG,
    AUDIO_CONFIG,
    REMOTEHARDWARE_CONFIG,
    NEIGHBORINFO_CONFIG,
    AMBIENTLIGHTING_CONFIG,
    DETECTIONSENSOR_CONFIG,
    PAXCOUNTER_CONFIG,
  ];

  static final $core.Map<$core.int, AdminMessage_ModuleConfigType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static AdminMessage_ModuleConfigType? valueOf($core.int value) =>
      _byValue[value];

  const AdminMessage_ModuleConfigType._($core.int v, $core.String n)
      : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
