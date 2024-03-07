//
//  Generated code. Do not modify.
//  source: meshtastic/telemetry.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

///
///  Supported I2C Sensors for telemetry in Meshtastic
class TelemetrySensorType extends $pb.ProtobufEnum {
  static const TelemetrySensorType SENSOR_UNSET =
      TelemetrySensorType._(0, _omitEnumNames ? '' : 'SENSOR_UNSET');
  static const TelemetrySensorType BME280 =
      TelemetrySensorType._(1, _omitEnumNames ? '' : 'BME280');
  static const TelemetrySensorType BME680 =
      TelemetrySensorType._(2, _omitEnumNames ? '' : 'BME680');
  static const TelemetrySensorType MCP9808 =
      TelemetrySensorType._(3, _omitEnumNames ? '' : 'MCP9808');
  static const TelemetrySensorType INA260 =
      TelemetrySensorType._(4, _omitEnumNames ? '' : 'INA260');
  static const TelemetrySensorType INA219 =
      TelemetrySensorType._(5, _omitEnumNames ? '' : 'INA219');
  static const TelemetrySensorType BMP280 =
      TelemetrySensorType._(6, _omitEnumNames ? '' : 'BMP280');
  static const TelemetrySensorType SHTC3 =
      TelemetrySensorType._(7, _omitEnumNames ? '' : 'SHTC3');
  static const TelemetrySensorType LPS22 =
      TelemetrySensorType._(8, _omitEnumNames ? '' : 'LPS22');
  static const TelemetrySensorType QMC6310 =
      TelemetrySensorType._(9, _omitEnumNames ? '' : 'QMC6310');
  static const TelemetrySensorType QMI8658 =
      TelemetrySensorType._(10, _omitEnumNames ? '' : 'QMI8658');
  static const TelemetrySensorType QMC5883L =
      TelemetrySensorType._(11, _omitEnumNames ? '' : 'QMC5883L');
  static const TelemetrySensorType SHT31 =
      TelemetrySensorType._(12, _omitEnumNames ? '' : 'SHT31');
  static const TelemetrySensorType PMSA003I =
      TelemetrySensorType._(13, _omitEnumNames ? '' : 'PMSA003I');
  static const TelemetrySensorType INA3221 =
      TelemetrySensorType._(14, _omitEnumNames ? '' : 'INA3221');

  static const $core.List<TelemetrySensorType> values = <TelemetrySensorType>[
    SENSOR_UNSET,
    BME280,
    BME680,
    MCP9808,
    INA260,
    INA219,
    BMP280,
    SHTC3,
    LPS22,
    QMC6310,
    QMI8658,
    QMC5883L,
    SHT31,
    PMSA003I,
    INA3221,
  ];

  static final $core.Map<$core.int, TelemetrySensorType> _byValue =
      $pb.ProtobufEnum.initByValue(values);

  static TelemetrySensorType? valueOf($core.int value) => _byValue[value];

  const TelemetrySensorType._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
