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

export 'telemetry.pbenum.dart';

///
///  Key native device metrics such as battery level
class DeviceMetrics extends $pb.GeneratedMessage {
  factory DeviceMetrics({
    $core.int? batteryLevel,
    $core.double? voltage,
    $core.double? channelUtilization,
    $core.double? airUtilTx,
    $core.int? uptimeSeconds,
  }) {
    final $result = create();
    if (batteryLevel != null) {
      $result.batteryLevel = batteryLevel;
    }
    if (voltage != null) {
      $result.voltage = voltage;
    }
    if (channelUtilization != null) {
      $result.channelUtilization = channelUtilization;
    }
    if (airUtilTx != null) {
      $result.airUtilTx = airUtilTx;
    }
    if (uptimeSeconds != null) {
      $result.uptimeSeconds = uptimeSeconds;
    }
    return $result;
  }
  DeviceMetrics._() : super();
  factory DeviceMetrics.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeviceMetrics.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeviceMetrics', package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'batteryLevel', $pb.PbFieldType.OU3)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'voltage', $pb.PbFieldType.OF)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'channelUtilization', $pb.PbFieldType.OF)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'airUtilTx', $pb.PbFieldType.OF)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'uptimeSeconds', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeviceMetrics clone() => DeviceMetrics()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeviceMetrics copyWith(void Function(DeviceMetrics) updates) => super.copyWith((message) => updates(message as DeviceMetrics)) as DeviceMetrics;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceMetrics create() => DeviceMetrics._();
  DeviceMetrics createEmptyInstance() => create();
  static $pb.PbList<DeviceMetrics> createRepeated() => $pb.PbList<DeviceMetrics>();
  @$core.pragma('dart2js:noInline')
  static DeviceMetrics getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeviceMetrics>(create);
  static DeviceMetrics? _defaultInstance;

  ///
  ///  0-100 (>100 means powered)
  @$pb.TagNumber(1)
  $core.int get batteryLevel => $_getIZ(0);
  @$pb.TagNumber(1)
  set batteryLevel($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBatteryLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearBatteryLevel() => clearField(1);

  ///
  ///  Voltage measured
  @$pb.TagNumber(2)
  $core.double get voltage => $_getN(1);
  @$pb.TagNumber(2)
  set voltage($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVoltage() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoltage() => clearField(2);

  ///
  ///  Utilization for the current channel, including well formed TX, RX and malformed RX (aka noise).
  @$pb.TagNumber(3)
  $core.double get channelUtilization => $_getN(2);
  @$pb.TagNumber(3)
  set channelUtilization($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChannelUtilization() => $_has(2);
  @$pb.TagNumber(3)
  void clearChannelUtilization() => clearField(3);

  ///
  ///  Percent of airtime for transmission used within the last hour.
  @$pb.TagNumber(4)
  $core.double get airUtilTx => $_getN(3);
  @$pb.TagNumber(4)
  set airUtilTx($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAirUtilTx() => $_has(3);
  @$pb.TagNumber(4)
  void clearAirUtilTx() => clearField(4);

  ///
  ///  How long the device has been running since the last reboot (in seconds)
  @$pb.TagNumber(5)
  $core.int get uptimeSeconds => $_getIZ(4);
  @$pb.TagNumber(5)
  set uptimeSeconds($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUptimeSeconds() => $_has(4);
  @$pb.TagNumber(5)
  void clearUptimeSeconds() => clearField(5);
}

///
///  Weather station or other environmental metrics
class EnvironmentMetrics extends $pb.GeneratedMessage {
  factory EnvironmentMetrics({
    $core.double? temperature,
    $core.double? relativeHumidity,
    $core.double? barometricPressure,
    $core.double? gasResistance,
    $core.double? voltage,
    $core.double? current,
    $core.int? iaq,
  }) {
    final $result = create();
    if (temperature != null) {
      $result.temperature = temperature;
    }
    if (relativeHumidity != null) {
      $result.relativeHumidity = relativeHumidity;
    }
    if (barometricPressure != null) {
      $result.barometricPressure = barometricPressure;
    }
    if (gasResistance != null) {
      $result.gasResistance = gasResistance;
    }
    if (voltage != null) {
      $result.voltage = voltage;
    }
    if (current != null) {
      $result.current = current;
    }
    if (iaq != null) {
      $result.iaq = iaq;
    }
    return $result;
  }
  EnvironmentMetrics._() : super();
  factory EnvironmentMetrics.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EnvironmentMetrics.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EnvironmentMetrics', package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'temperature', $pb.PbFieldType.OF)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'relativeHumidity', $pb.PbFieldType.OF)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'barometricPressure', $pb.PbFieldType.OF)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'gasResistance', $pb.PbFieldType.OF)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'voltage', $pb.PbFieldType.OF)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'current', $pb.PbFieldType.OF)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'iaq', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EnvironmentMetrics clone() => EnvironmentMetrics()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EnvironmentMetrics copyWith(void Function(EnvironmentMetrics) updates) => super.copyWith((message) => updates(message as EnvironmentMetrics)) as EnvironmentMetrics;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EnvironmentMetrics create() => EnvironmentMetrics._();
  EnvironmentMetrics createEmptyInstance() => create();
  static $pb.PbList<EnvironmentMetrics> createRepeated() => $pb.PbList<EnvironmentMetrics>();
  @$core.pragma('dart2js:noInline')
  static EnvironmentMetrics getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EnvironmentMetrics>(create);
  static EnvironmentMetrics? _defaultInstance;

  ///
  ///  Temperature measured
  @$pb.TagNumber(1)
  $core.double get temperature => $_getN(0);
  @$pb.TagNumber(1)
  set temperature($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTemperature() => $_has(0);
  @$pb.TagNumber(1)
  void clearTemperature() => clearField(1);

  ///
  ///  Relative humidity percent measured
  @$pb.TagNumber(2)
  $core.double get relativeHumidity => $_getN(1);
  @$pb.TagNumber(2)
  set relativeHumidity($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRelativeHumidity() => $_has(1);
  @$pb.TagNumber(2)
  void clearRelativeHumidity() => clearField(2);

  ///
  ///  Barometric pressure in hPA measured
  @$pb.TagNumber(3)
  $core.double get barometricPressure => $_getN(2);
  @$pb.TagNumber(3)
  set barometricPressure($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBarometricPressure() => $_has(2);
  @$pb.TagNumber(3)
  void clearBarometricPressure() => clearField(3);

  ///
  ///  Gas resistance in MOhm measured
  @$pb.TagNumber(4)
  $core.double get gasResistance => $_getN(3);
  @$pb.TagNumber(4)
  set gasResistance($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGasResistance() => $_has(3);
  @$pb.TagNumber(4)
  void clearGasResistance() => clearField(4);

  ///
  ///  Voltage measured (To be depreciated in favor of PowerMetrics in Meshtastic 3.x)
  @$pb.TagNumber(5)
  $core.double get voltage => $_getN(4);
  @$pb.TagNumber(5)
  set voltage($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasVoltage() => $_has(4);
  @$pb.TagNumber(5)
  void clearVoltage() => clearField(5);

  ///
  ///  Current measured (To be depreciated in favor of PowerMetrics in Meshtastic 3.x)
  @$pb.TagNumber(6)
  $core.double get current => $_getN(5);
  @$pb.TagNumber(6)
  set current($core.double v) { $_setFloat(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCurrent() => $_has(5);
  @$pb.TagNumber(6)
  void clearCurrent() => clearField(6);

  ///
  /// relative scale IAQ value as measured by Bosch BME680 . value 0-500.
  /// Belongs to Air Quality but is not particle but VOC measurement. Other VOC values can also be put in here.
  @$pb.TagNumber(7)
  $core.int get iaq => $_getIZ(6);
  @$pb.TagNumber(7)
  set iaq($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIaq() => $_has(6);
  @$pb.TagNumber(7)
  void clearIaq() => clearField(7);
}

///
///  Power Metrics (voltage / current / etc)
class PowerMetrics extends $pb.GeneratedMessage {
  factory PowerMetrics({
    $core.double? ch1Voltage,
    $core.double? ch1Current,
    $core.double? ch2Voltage,
    $core.double? ch2Current,
    $core.double? ch3Voltage,
    $core.double? ch3Current,
  }) {
    final $result = create();
    if (ch1Voltage != null) {
      $result.ch1Voltage = ch1Voltage;
    }
    if (ch1Current != null) {
      $result.ch1Current = ch1Current;
    }
    if (ch2Voltage != null) {
      $result.ch2Voltage = ch2Voltage;
    }
    if (ch2Current != null) {
      $result.ch2Current = ch2Current;
    }
    if (ch3Voltage != null) {
      $result.ch3Voltage = ch3Voltage;
    }
    if (ch3Current != null) {
      $result.ch3Current = ch3Current;
    }
    return $result;
  }
  PowerMetrics._() : super();
  factory PowerMetrics.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PowerMetrics.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PowerMetrics', package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'ch1Voltage', $pb.PbFieldType.OF)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'ch1Current', $pb.PbFieldType.OF)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'ch2Voltage', $pb.PbFieldType.OF)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'ch2Current', $pb.PbFieldType.OF)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'ch3Voltage', $pb.PbFieldType.OF)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'ch3Current', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PowerMetrics clone() => PowerMetrics()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PowerMetrics copyWith(void Function(PowerMetrics) updates) => super.copyWith((message) => updates(message as PowerMetrics)) as PowerMetrics;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PowerMetrics create() => PowerMetrics._();
  PowerMetrics createEmptyInstance() => create();
  static $pb.PbList<PowerMetrics> createRepeated() => $pb.PbList<PowerMetrics>();
  @$core.pragma('dart2js:noInline')
  static PowerMetrics getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PowerMetrics>(create);
  static PowerMetrics? _defaultInstance;

  ///
  ///  Voltage (Ch1)
  @$pb.TagNumber(1)
  $core.double get ch1Voltage => $_getN(0);
  @$pb.TagNumber(1)
  set ch1Voltage($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCh1Voltage() => $_has(0);
  @$pb.TagNumber(1)
  void clearCh1Voltage() => clearField(1);

  ///
  ///  Current (Ch1)
  @$pb.TagNumber(2)
  $core.double get ch1Current => $_getN(1);
  @$pb.TagNumber(2)
  set ch1Current($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCh1Current() => $_has(1);
  @$pb.TagNumber(2)
  void clearCh1Current() => clearField(2);

  ///
  ///  Voltage (Ch2)
  @$pb.TagNumber(3)
  $core.double get ch2Voltage => $_getN(2);
  @$pb.TagNumber(3)
  set ch2Voltage($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCh2Voltage() => $_has(2);
  @$pb.TagNumber(3)
  void clearCh2Voltage() => clearField(3);

  ///
  ///  Current (Ch2)
  @$pb.TagNumber(4)
  $core.double get ch2Current => $_getN(3);
  @$pb.TagNumber(4)
  set ch2Current($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCh2Current() => $_has(3);
  @$pb.TagNumber(4)
  void clearCh2Current() => clearField(4);

  ///
  ///  Voltage (Ch3)
  @$pb.TagNumber(5)
  $core.double get ch3Voltage => $_getN(4);
  @$pb.TagNumber(5)
  set ch3Voltage($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCh3Voltage() => $_has(4);
  @$pb.TagNumber(5)
  void clearCh3Voltage() => clearField(5);

  ///
  ///  Current (Ch3)
  @$pb.TagNumber(6)
  $core.double get ch3Current => $_getN(5);
  @$pb.TagNumber(6)
  set ch3Current($core.double v) { $_setFloat(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCh3Current() => $_has(5);
  @$pb.TagNumber(6)
  void clearCh3Current() => clearField(6);
}

///
///  Air quality metrics
class AirQualityMetrics extends $pb.GeneratedMessage {
  factory AirQualityMetrics({
    $core.int? pm10Standard,
    $core.int? pm25Standard,
    $core.int? pm100Standard,
    $core.int? pm10Environmental,
    $core.int? pm25Environmental,
    $core.int? pm100Environmental,
    $core.int? particles03um,
    $core.int? particles05um,
    $core.int? particles10um,
    $core.int? particles25um,
    $core.int? particles50um,
    $core.int? particles100um,
  }) {
    final $result = create();
    if (pm10Standard != null) {
      $result.pm10Standard = pm10Standard;
    }
    if (pm25Standard != null) {
      $result.pm25Standard = pm25Standard;
    }
    if (pm100Standard != null) {
      $result.pm100Standard = pm100Standard;
    }
    if (pm10Environmental != null) {
      $result.pm10Environmental = pm10Environmental;
    }
    if (pm25Environmental != null) {
      $result.pm25Environmental = pm25Environmental;
    }
    if (pm100Environmental != null) {
      $result.pm100Environmental = pm100Environmental;
    }
    if (particles03um != null) {
      $result.particles03um = particles03um;
    }
    if (particles05um != null) {
      $result.particles05um = particles05um;
    }
    if (particles10um != null) {
      $result.particles10um = particles10um;
    }
    if (particles25um != null) {
      $result.particles25um = particles25um;
    }
    if (particles50um != null) {
      $result.particles50um = particles50um;
    }
    if (particles100um != null) {
      $result.particles100um = particles100um;
    }
    return $result;
  }
  AirQualityMetrics._() : super();
  factory AirQualityMetrics.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AirQualityMetrics.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AirQualityMetrics', package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pm10Standard', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'pm25Standard', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'pm100Standard', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'pm10Environmental', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'pm25Environmental', $pb.PbFieldType.OU3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'pm100Environmental', $pb.PbFieldType.OU3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'particles03um', $pb.PbFieldType.OU3, protoName: 'particles_03um')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'particles05um', $pb.PbFieldType.OU3, protoName: 'particles_05um')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'particles10um', $pb.PbFieldType.OU3, protoName: 'particles_10um')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'particles25um', $pb.PbFieldType.OU3, protoName: 'particles_25um')
    ..a<$core.int>(11, _omitFieldNames ? '' : 'particles50um', $pb.PbFieldType.OU3, protoName: 'particles_50um')
    ..a<$core.int>(12, _omitFieldNames ? '' : 'particles100um', $pb.PbFieldType.OU3, protoName: 'particles_100um')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AirQualityMetrics clone() => AirQualityMetrics()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AirQualityMetrics copyWith(void Function(AirQualityMetrics) updates) => super.copyWith((message) => updates(message as AirQualityMetrics)) as AirQualityMetrics;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AirQualityMetrics create() => AirQualityMetrics._();
  AirQualityMetrics createEmptyInstance() => create();
  static $pb.PbList<AirQualityMetrics> createRepeated() => $pb.PbList<AirQualityMetrics>();
  @$core.pragma('dart2js:noInline')
  static AirQualityMetrics getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AirQualityMetrics>(create);
  static AirQualityMetrics? _defaultInstance;

  ///
  ///  Concentration Units Standard PM1.0
  @$pb.TagNumber(1)
  $core.int get pm10Standard => $_getIZ(0);
  @$pb.TagNumber(1)
  set pm10Standard($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPm10Standard() => $_has(0);
  @$pb.TagNumber(1)
  void clearPm10Standard() => clearField(1);

  ///
  ///  Concentration Units Standard PM2.5
  @$pb.TagNumber(2)
  $core.int get pm25Standard => $_getIZ(1);
  @$pb.TagNumber(2)
  set pm25Standard($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPm25Standard() => $_has(1);
  @$pb.TagNumber(2)
  void clearPm25Standard() => clearField(2);

  ///
  ///  Concentration Units Standard PM10.0
  @$pb.TagNumber(3)
  $core.int get pm100Standard => $_getIZ(2);
  @$pb.TagNumber(3)
  set pm100Standard($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPm100Standard() => $_has(2);
  @$pb.TagNumber(3)
  void clearPm100Standard() => clearField(3);

  ///
  ///  Concentration Units Environmental PM1.0
  @$pb.TagNumber(4)
  $core.int get pm10Environmental => $_getIZ(3);
  @$pb.TagNumber(4)
  set pm10Environmental($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPm10Environmental() => $_has(3);
  @$pb.TagNumber(4)
  void clearPm10Environmental() => clearField(4);

  ///
  ///  Concentration Units Environmental PM2.5
  @$pb.TagNumber(5)
  $core.int get pm25Environmental => $_getIZ(4);
  @$pb.TagNumber(5)
  set pm25Environmental($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPm25Environmental() => $_has(4);
  @$pb.TagNumber(5)
  void clearPm25Environmental() => clearField(5);

  ///
  ///  Concentration Units Environmental PM10.0
  @$pb.TagNumber(6)
  $core.int get pm100Environmental => $_getIZ(5);
  @$pb.TagNumber(6)
  set pm100Environmental($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPm100Environmental() => $_has(5);
  @$pb.TagNumber(6)
  void clearPm100Environmental() => clearField(6);

  ///
  ///  0.3um Particle Count
  @$pb.TagNumber(7)
  $core.int get particles03um => $_getIZ(6);
  @$pb.TagNumber(7)
  set particles03um($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasParticles03um() => $_has(6);
  @$pb.TagNumber(7)
  void clearParticles03um() => clearField(7);

  ///
  ///  0.5um Particle Count
  @$pb.TagNumber(8)
  $core.int get particles05um => $_getIZ(7);
  @$pb.TagNumber(8)
  set particles05um($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasParticles05um() => $_has(7);
  @$pb.TagNumber(8)
  void clearParticles05um() => clearField(8);

  ///
  ///  1.0um Particle Count
  @$pb.TagNumber(9)
  $core.int get particles10um => $_getIZ(8);
  @$pb.TagNumber(9)
  set particles10um($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasParticles10um() => $_has(8);
  @$pb.TagNumber(9)
  void clearParticles10um() => clearField(9);

  ///
  ///  2.5um Particle Count
  @$pb.TagNumber(10)
  $core.int get particles25um => $_getIZ(9);
  @$pb.TagNumber(10)
  set particles25um($core.int v) { $_setUnsignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasParticles25um() => $_has(9);
  @$pb.TagNumber(10)
  void clearParticles25um() => clearField(10);

  ///
  ///  5.0um Particle Count
  @$pb.TagNumber(11)
  $core.int get particles50um => $_getIZ(10);
  @$pb.TagNumber(11)
  set particles50um($core.int v) { $_setUnsignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasParticles50um() => $_has(10);
  @$pb.TagNumber(11)
  void clearParticles50um() => clearField(11);

  ///
  ///  10.0um Particle Count
  @$pb.TagNumber(12)
  $core.int get particles100um => $_getIZ(11);
  @$pb.TagNumber(12)
  set particles100um($core.int v) { $_setUnsignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasParticles100um() => $_has(11);
  @$pb.TagNumber(12)
  void clearParticles100um() => clearField(12);
}

enum Telemetry_Variant {
  deviceMetrics, 
  environmentMetrics, 
  airQualityMetrics, 
  powerMetrics, 
  notSet
}

///
///  Types of Measurements the telemetry module is equipped to handle
class Telemetry extends $pb.GeneratedMessage {
  factory Telemetry({
    $core.int? time,
    DeviceMetrics? deviceMetrics,
    EnvironmentMetrics? environmentMetrics,
    AirQualityMetrics? airQualityMetrics,
    PowerMetrics? powerMetrics,
  }) {
    final $result = create();
    if (time != null) {
      $result.time = time;
    }
    if (deviceMetrics != null) {
      $result.deviceMetrics = deviceMetrics;
    }
    if (environmentMetrics != null) {
      $result.environmentMetrics = environmentMetrics;
    }
    if (airQualityMetrics != null) {
      $result.airQualityMetrics = airQualityMetrics;
    }
    if (powerMetrics != null) {
      $result.powerMetrics = powerMetrics;
    }
    return $result;
  }
  Telemetry._() : super();
  factory Telemetry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Telemetry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Telemetry_Variant> _Telemetry_VariantByTag = {
    2 : Telemetry_Variant.deviceMetrics,
    3 : Telemetry_Variant.environmentMetrics,
    4 : Telemetry_Variant.airQualityMetrics,
    5 : Telemetry_Variant.powerMetrics,
    0 : Telemetry_Variant.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Telemetry', package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'), createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5])
    ..a<$core.int>(1, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OF3)
    ..aOM<DeviceMetrics>(2, _omitFieldNames ? '' : 'deviceMetrics', subBuilder: DeviceMetrics.create)
    ..aOM<EnvironmentMetrics>(3, _omitFieldNames ? '' : 'environmentMetrics', subBuilder: EnvironmentMetrics.create)
    ..aOM<AirQualityMetrics>(4, _omitFieldNames ? '' : 'airQualityMetrics', subBuilder: AirQualityMetrics.create)
    ..aOM<PowerMetrics>(5, _omitFieldNames ? '' : 'powerMetrics', subBuilder: PowerMetrics.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Telemetry clone() => Telemetry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Telemetry copyWith(void Function(Telemetry) updates) => super.copyWith((message) => updates(message as Telemetry)) as Telemetry;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Telemetry create() => Telemetry._();
  Telemetry createEmptyInstance() => create();
  static $pb.PbList<Telemetry> createRepeated() => $pb.PbList<Telemetry>();
  @$core.pragma('dart2js:noInline')
  static Telemetry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Telemetry>(create);
  static Telemetry? _defaultInstance;

  Telemetry_Variant whichVariant() => _Telemetry_VariantByTag[$_whichOneof(0)]!;
  void clearVariant() => clearField($_whichOneof(0));

  ///
  ///  Seconds since 1970 - or 0 for unknown/unset
  @$pb.TagNumber(1)
  $core.int get time => $_getIZ(0);
  @$pb.TagNumber(1)
  set time($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearTime() => clearField(1);

  ///
  ///  Key native device metrics such as battery level
  @$pb.TagNumber(2)
  DeviceMetrics get deviceMetrics => $_getN(1);
  @$pb.TagNumber(2)
  set deviceMetrics(DeviceMetrics v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceMetrics() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceMetrics() => clearField(2);
  @$pb.TagNumber(2)
  DeviceMetrics ensureDeviceMetrics() => $_ensure(1);

  ///
  ///  Weather station or other environmental metrics
  @$pb.TagNumber(3)
  EnvironmentMetrics get environmentMetrics => $_getN(2);
  @$pb.TagNumber(3)
  set environmentMetrics(EnvironmentMetrics v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasEnvironmentMetrics() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnvironmentMetrics() => clearField(3);
  @$pb.TagNumber(3)
  EnvironmentMetrics ensureEnvironmentMetrics() => $_ensure(2);

  ///
  ///  Air quality metrics
  @$pb.TagNumber(4)
  AirQualityMetrics get airQualityMetrics => $_getN(3);
  @$pb.TagNumber(4)
  set airQualityMetrics(AirQualityMetrics v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAirQualityMetrics() => $_has(3);
  @$pb.TagNumber(4)
  void clearAirQualityMetrics() => clearField(4);
  @$pb.TagNumber(4)
  AirQualityMetrics ensureAirQualityMetrics() => $_ensure(3);

  ///
  ///  Power Metrics
  @$pb.TagNumber(5)
  PowerMetrics get powerMetrics => $_getN(4);
  @$pb.TagNumber(5)
  set powerMetrics(PowerMetrics v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasPowerMetrics() => $_has(4);
  @$pb.TagNumber(5)
  void clearPowerMetrics() => clearField(5);
  @$pb.TagNumber(5)
  PowerMetrics ensurePowerMetrics() => $_ensure(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
