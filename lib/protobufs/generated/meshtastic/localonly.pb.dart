//
//  Generated code. Do not modify.
//  source: meshtastic/localonly.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'config.pb.dart' as $1;
import 'module_config.pb.dart' as $2;

class LocalConfig extends $pb.GeneratedMessage {
  factory LocalConfig({
    $1.Config_DeviceConfig? device,
    $1.Config_PositionConfig? position,
    $1.Config_PowerConfig? power,
    $1.Config_NetworkConfig? network,
    $1.Config_DisplayConfig? display,
    $1.Config_LoRaConfig? lora,
    $1.Config_BluetoothConfig? bluetooth,
    $core.int? version,
  }) {
    final $result = create();
    if (device != null) {
      $result.device = device;
    }
    if (position != null) {
      $result.position = position;
    }
    if (power != null) {
      $result.power = power;
    }
    if (network != null) {
      $result.network = network;
    }
    if (display != null) {
      $result.display = display;
    }
    if (lora != null) {
      $result.lora = lora;
    }
    if (bluetooth != null) {
      $result.bluetooth = bluetooth;
    }
    if (version != null) {
      $result.version = version;
    }
    return $result;
  }
  LocalConfig._() : super();
  factory LocalConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LocalConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LocalConfig', package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'), createEmptyInstance: create)
    ..aOM<$1.Config_DeviceConfig>(1, _omitFieldNames ? '' : 'device', subBuilder: $1.Config_DeviceConfig.create)
    ..aOM<$1.Config_PositionConfig>(2, _omitFieldNames ? '' : 'position', subBuilder: $1.Config_PositionConfig.create)
    ..aOM<$1.Config_PowerConfig>(3, _omitFieldNames ? '' : 'power', subBuilder: $1.Config_PowerConfig.create)
    ..aOM<$1.Config_NetworkConfig>(4, _omitFieldNames ? '' : 'network', subBuilder: $1.Config_NetworkConfig.create)
    ..aOM<$1.Config_DisplayConfig>(5, _omitFieldNames ? '' : 'display', subBuilder: $1.Config_DisplayConfig.create)
    ..aOM<$1.Config_LoRaConfig>(6, _omitFieldNames ? '' : 'lora', subBuilder: $1.Config_LoRaConfig.create)
    ..aOM<$1.Config_BluetoothConfig>(7, _omitFieldNames ? '' : 'bluetooth', subBuilder: $1.Config_BluetoothConfig.create)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'version', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LocalConfig clone() => LocalConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LocalConfig copyWith(void Function(LocalConfig) updates) => super.copyWith((message) => updates(message as LocalConfig)) as LocalConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LocalConfig create() => LocalConfig._();
  LocalConfig createEmptyInstance() => create();
  static $pb.PbList<LocalConfig> createRepeated() => $pb.PbList<LocalConfig>();
  @$core.pragma('dart2js:noInline')
  static LocalConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LocalConfig>(create);
  static LocalConfig? _defaultInstance;

  ///
  ///  The part of the config that is specific to the Device
  @$pb.TagNumber(1)
  $1.Config_DeviceConfig get device => $_getN(0);
  @$pb.TagNumber(1)
  set device($1.Config_DeviceConfig v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDevice() => $_has(0);
  @$pb.TagNumber(1)
  void clearDevice() => clearField(1);
  @$pb.TagNumber(1)
  $1.Config_DeviceConfig ensureDevice() => $_ensure(0);

  ///
  ///  The part of the config that is specific to the GPS Position
  @$pb.TagNumber(2)
  $1.Config_PositionConfig get position => $_getN(1);
  @$pb.TagNumber(2)
  set position($1.Config_PositionConfig v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => clearField(2);
  @$pb.TagNumber(2)
  $1.Config_PositionConfig ensurePosition() => $_ensure(1);

  ///
  ///  The part of the config that is specific to the Power settings
  @$pb.TagNumber(3)
  $1.Config_PowerConfig get power => $_getN(2);
  @$pb.TagNumber(3)
  set power($1.Config_PowerConfig v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPower() => $_has(2);
  @$pb.TagNumber(3)
  void clearPower() => clearField(3);
  @$pb.TagNumber(3)
  $1.Config_PowerConfig ensurePower() => $_ensure(2);

  ///
  ///  The part of the config that is specific to the Wifi Settings
  @$pb.TagNumber(4)
  $1.Config_NetworkConfig get network => $_getN(3);
  @$pb.TagNumber(4)
  set network($1.Config_NetworkConfig v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasNetwork() => $_has(3);
  @$pb.TagNumber(4)
  void clearNetwork() => clearField(4);
  @$pb.TagNumber(4)
  $1.Config_NetworkConfig ensureNetwork() => $_ensure(3);

  ///
  ///  The part of the config that is specific to the Display
  @$pb.TagNumber(5)
  $1.Config_DisplayConfig get display => $_getN(4);
  @$pb.TagNumber(5)
  set display($1.Config_DisplayConfig v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDisplay() => $_has(4);
  @$pb.TagNumber(5)
  void clearDisplay() => clearField(5);
  @$pb.TagNumber(5)
  $1.Config_DisplayConfig ensureDisplay() => $_ensure(4);

  ///
  ///  The part of the config that is specific to the Lora Radio
  @$pb.TagNumber(6)
  $1.Config_LoRaConfig get lora => $_getN(5);
  @$pb.TagNumber(6)
  set lora($1.Config_LoRaConfig v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasLora() => $_has(5);
  @$pb.TagNumber(6)
  void clearLora() => clearField(6);
  @$pb.TagNumber(6)
  $1.Config_LoRaConfig ensureLora() => $_ensure(5);

  ///
  ///  The part of the config that is specific to the Bluetooth settings
  @$pb.TagNumber(7)
  $1.Config_BluetoothConfig get bluetooth => $_getN(6);
  @$pb.TagNumber(7)
  set bluetooth($1.Config_BluetoothConfig v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasBluetooth() => $_has(6);
  @$pb.TagNumber(7)
  void clearBluetooth() => clearField(7);
  @$pb.TagNumber(7)
  $1.Config_BluetoothConfig ensureBluetooth() => $_ensure(6);

  ///
  ///  A version integer used to invalidate old save files when we make
  ///  incompatible changes This integer is set at build time and is private to
  ///  NodeDB.cpp in the device code.
  @$pb.TagNumber(8)
  $core.int get version => $_getIZ(7);
  @$pb.TagNumber(8)
  set version($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasVersion() => $_has(7);
  @$pb.TagNumber(8)
  void clearVersion() => clearField(8);
}

class LocalModuleConfig extends $pb.GeneratedMessage {
  factory LocalModuleConfig({
    $2.ModuleConfig_MQTTConfig? mqtt,
    $2.ModuleConfig_SerialConfig? serial,
    $2.ModuleConfig_ExternalNotificationConfig? externalNotification,
    $2.ModuleConfig_StoreForwardConfig? storeForward,
    $2.ModuleConfig_RangeTestConfig? rangeTest,
    $2.ModuleConfig_TelemetryConfig? telemetry,
    $2.ModuleConfig_CannedMessageConfig? cannedMessage,
    $core.int? version,
    $2.ModuleConfig_AudioConfig? audio,
    $2.ModuleConfig_RemoteHardwareConfig? remoteHardware,
    $2.ModuleConfig_NeighborInfoConfig? neighborInfo,
    $2.ModuleConfig_AmbientLightingConfig? ambientLighting,
    $2.ModuleConfig_DetectionSensorConfig? detectionSensor,
    $2.ModuleConfig_PaxcounterConfig? paxcounter,
  }) {
    final $result = create();
    if (mqtt != null) {
      $result.mqtt = mqtt;
    }
    if (serial != null) {
      $result.serial = serial;
    }
    if (externalNotification != null) {
      $result.externalNotification = externalNotification;
    }
    if (storeForward != null) {
      $result.storeForward = storeForward;
    }
    if (rangeTest != null) {
      $result.rangeTest = rangeTest;
    }
    if (telemetry != null) {
      $result.telemetry = telemetry;
    }
    if (cannedMessage != null) {
      $result.cannedMessage = cannedMessage;
    }
    if (version != null) {
      $result.version = version;
    }
    if (audio != null) {
      $result.audio = audio;
    }
    if (remoteHardware != null) {
      $result.remoteHardware = remoteHardware;
    }
    if (neighborInfo != null) {
      $result.neighborInfo = neighborInfo;
    }
    if (ambientLighting != null) {
      $result.ambientLighting = ambientLighting;
    }
    if (detectionSensor != null) {
      $result.detectionSensor = detectionSensor;
    }
    if (paxcounter != null) {
      $result.paxcounter = paxcounter;
    }
    return $result;
  }
  LocalModuleConfig._() : super();
  factory LocalModuleConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LocalModuleConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LocalModuleConfig', package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'), createEmptyInstance: create)
    ..aOM<$2.ModuleConfig_MQTTConfig>(1, _omitFieldNames ? '' : 'mqtt', subBuilder: $2.ModuleConfig_MQTTConfig.create)
    ..aOM<$2.ModuleConfig_SerialConfig>(2, _omitFieldNames ? '' : 'serial', subBuilder: $2.ModuleConfig_SerialConfig.create)
    ..aOM<$2.ModuleConfig_ExternalNotificationConfig>(3, _omitFieldNames ? '' : 'externalNotification', subBuilder: $2.ModuleConfig_ExternalNotificationConfig.create)
    ..aOM<$2.ModuleConfig_StoreForwardConfig>(4, _omitFieldNames ? '' : 'storeForward', subBuilder: $2.ModuleConfig_StoreForwardConfig.create)
    ..aOM<$2.ModuleConfig_RangeTestConfig>(5, _omitFieldNames ? '' : 'rangeTest', subBuilder: $2.ModuleConfig_RangeTestConfig.create)
    ..aOM<$2.ModuleConfig_TelemetryConfig>(6, _omitFieldNames ? '' : 'telemetry', subBuilder: $2.ModuleConfig_TelemetryConfig.create)
    ..aOM<$2.ModuleConfig_CannedMessageConfig>(7, _omitFieldNames ? '' : 'cannedMessage', subBuilder: $2.ModuleConfig_CannedMessageConfig.create)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'version', $pb.PbFieldType.OU3)
    ..aOM<$2.ModuleConfig_AudioConfig>(9, _omitFieldNames ? '' : 'audio', subBuilder: $2.ModuleConfig_AudioConfig.create)
    ..aOM<$2.ModuleConfig_RemoteHardwareConfig>(10, _omitFieldNames ? '' : 'remoteHardware', subBuilder: $2.ModuleConfig_RemoteHardwareConfig.create)
    ..aOM<$2.ModuleConfig_NeighborInfoConfig>(11, _omitFieldNames ? '' : 'neighborInfo', subBuilder: $2.ModuleConfig_NeighborInfoConfig.create)
    ..aOM<$2.ModuleConfig_AmbientLightingConfig>(12, _omitFieldNames ? '' : 'ambientLighting', subBuilder: $2.ModuleConfig_AmbientLightingConfig.create)
    ..aOM<$2.ModuleConfig_DetectionSensorConfig>(13, _omitFieldNames ? '' : 'detectionSensor', subBuilder: $2.ModuleConfig_DetectionSensorConfig.create)
    ..aOM<$2.ModuleConfig_PaxcounterConfig>(14, _omitFieldNames ? '' : 'paxcounter', subBuilder: $2.ModuleConfig_PaxcounterConfig.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LocalModuleConfig clone() => LocalModuleConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LocalModuleConfig copyWith(void Function(LocalModuleConfig) updates) => super.copyWith((message) => updates(message as LocalModuleConfig)) as LocalModuleConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LocalModuleConfig create() => LocalModuleConfig._();
  LocalModuleConfig createEmptyInstance() => create();
  static $pb.PbList<LocalModuleConfig> createRepeated() => $pb.PbList<LocalModuleConfig>();
  @$core.pragma('dart2js:noInline')
  static LocalModuleConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LocalModuleConfig>(create);
  static LocalModuleConfig? _defaultInstance;

  ///
  ///  The part of the config that is specific to the MQTT module
  @$pb.TagNumber(1)
  $2.ModuleConfig_MQTTConfig get mqtt => $_getN(0);
  @$pb.TagNumber(1)
  set mqtt($2.ModuleConfig_MQTTConfig v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMqtt() => $_has(0);
  @$pb.TagNumber(1)
  void clearMqtt() => clearField(1);
  @$pb.TagNumber(1)
  $2.ModuleConfig_MQTTConfig ensureMqtt() => $_ensure(0);

  ///
  ///  The part of the config that is specific to the Serial module
  @$pb.TagNumber(2)
  $2.ModuleConfig_SerialConfig get serial => $_getN(1);
  @$pb.TagNumber(2)
  set serial($2.ModuleConfig_SerialConfig v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSerial() => $_has(1);
  @$pb.TagNumber(2)
  void clearSerial() => clearField(2);
  @$pb.TagNumber(2)
  $2.ModuleConfig_SerialConfig ensureSerial() => $_ensure(1);

  ///
  ///  The part of the config that is specific to the ExternalNotification module
  @$pb.TagNumber(3)
  $2.ModuleConfig_ExternalNotificationConfig get externalNotification => $_getN(2);
  @$pb.TagNumber(3)
  set externalNotification($2.ModuleConfig_ExternalNotificationConfig v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasExternalNotification() => $_has(2);
  @$pb.TagNumber(3)
  void clearExternalNotification() => clearField(3);
  @$pb.TagNumber(3)
  $2.ModuleConfig_ExternalNotificationConfig ensureExternalNotification() => $_ensure(2);

  ///
  ///  The part of the config that is specific to the Store & Forward module
  @$pb.TagNumber(4)
  $2.ModuleConfig_StoreForwardConfig get storeForward => $_getN(3);
  @$pb.TagNumber(4)
  set storeForward($2.ModuleConfig_StoreForwardConfig v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStoreForward() => $_has(3);
  @$pb.TagNumber(4)
  void clearStoreForward() => clearField(4);
  @$pb.TagNumber(4)
  $2.ModuleConfig_StoreForwardConfig ensureStoreForward() => $_ensure(3);

  ///
  ///  The part of the config that is specific to the RangeTest module
  @$pb.TagNumber(5)
  $2.ModuleConfig_RangeTestConfig get rangeTest => $_getN(4);
  @$pb.TagNumber(5)
  set rangeTest($2.ModuleConfig_RangeTestConfig v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasRangeTest() => $_has(4);
  @$pb.TagNumber(5)
  void clearRangeTest() => clearField(5);
  @$pb.TagNumber(5)
  $2.ModuleConfig_RangeTestConfig ensureRangeTest() => $_ensure(4);

  ///
  ///  The part of the config that is specific to the Telemetry module
  @$pb.TagNumber(6)
  $2.ModuleConfig_TelemetryConfig get telemetry => $_getN(5);
  @$pb.TagNumber(6)
  set telemetry($2.ModuleConfig_TelemetryConfig v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasTelemetry() => $_has(5);
  @$pb.TagNumber(6)
  void clearTelemetry() => clearField(6);
  @$pb.TagNumber(6)
  $2.ModuleConfig_TelemetryConfig ensureTelemetry() => $_ensure(5);

  ///
  ///  The part of the config that is specific to the Canned Message module
  @$pb.TagNumber(7)
  $2.ModuleConfig_CannedMessageConfig get cannedMessage => $_getN(6);
  @$pb.TagNumber(7)
  set cannedMessage($2.ModuleConfig_CannedMessageConfig v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCannedMessage() => $_has(6);
  @$pb.TagNumber(7)
  void clearCannedMessage() => clearField(7);
  @$pb.TagNumber(7)
  $2.ModuleConfig_CannedMessageConfig ensureCannedMessage() => $_ensure(6);

  ///
  ///  A version integer used to invalidate old save files when we make
  ///  incompatible changes This integer is set at build time and is private to
  ///  NodeDB.cpp in the device code.
  @$pb.TagNumber(8)
  $core.int get version => $_getIZ(7);
  @$pb.TagNumber(8)
  set version($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasVersion() => $_has(7);
  @$pb.TagNumber(8)
  void clearVersion() => clearField(8);

  ///
  ///  The part of the config that is specific to the Audio module
  @$pb.TagNumber(9)
  $2.ModuleConfig_AudioConfig get audio => $_getN(8);
  @$pb.TagNumber(9)
  set audio($2.ModuleConfig_AudioConfig v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasAudio() => $_has(8);
  @$pb.TagNumber(9)
  void clearAudio() => clearField(9);
  @$pb.TagNumber(9)
  $2.ModuleConfig_AudioConfig ensureAudio() => $_ensure(8);

  ///
  ///  The part of the config that is specific to the Remote Hardware module
  @$pb.TagNumber(10)
  $2.ModuleConfig_RemoteHardwareConfig get remoteHardware => $_getN(9);
  @$pb.TagNumber(10)
  set remoteHardware($2.ModuleConfig_RemoteHardwareConfig v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasRemoteHardware() => $_has(9);
  @$pb.TagNumber(10)
  void clearRemoteHardware() => clearField(10);
  @$pb.TagNumber(10)
  $2.ModuleConfig_RemoteHardwareConfig ensureRemoteHardware() => $_ensure(9);

  ///
  ///  The part of the config that is specific to the Neighbor Info module
  @$pb.TagNumber(11)
  $2.ModuleConfig_NeighborInfoConfig get neighborInfo => $_getN(10);
  @$pb.TagNumber(11)
  set neighborInfo($2.ModuleConfig_NeighborInfoConfig v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasNeighborInfo() => $_has(10);
  @$pb.TagNumber(11)
  void clearNeighborInfo() => clearField(11);
  @$pb.TagNumber(11)
  $2.ModuleConfig_NeighborInfoConfig ensureNeighborInfo() => $_ensure(10);

  ///
  ///  The part of the config that is specific to the Ambient Lighting module
  @$pb.TagNumber(12)
  $2.ModuleConfig_AmbientLightingConfig get ambientLighting => $_getN(11);
  @$pb.TagNumber(12)
  set ambientLighting($2.ModuleConfig_AmbientLightingConfig v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasAmbientLighting() => $_has(11);
  @$pb.TagNumber(12)
  void clearAmbientLighting() => clearField(12);
  @$pb.TagNumber(12)
  $2.ModuleConfig_AmbientLightingConfig ensureAmbientLighting() => $_ensure(11);

  ///
  ///  The part of the config that is specific to the Detection Sensor module
  @$pb.TagNumber(13)
  $2.ModuleConfig_DetectionSensorConfig get detectionSensor => $_getN(12);
  @$pb.TagNumber(13)
  set detectionSensor($2.ModuleConfig_DetectionSensorConfig v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasDetectionSensor() => $_has(12);
  @$pb.TagNumber(13)
  void clearDetectionSensor() => clearField(13);
  @$pb.TagNumber(13)
  $2.ModuleConfig_DetectionSensorConfig ensureDetectionSensor() => $_ensure(12);

  ///
  ///  Paxcounter Config
  @$pb.TagNumber(14)
  $2.ModuleConfig_PaxcounterConfig get paxcounter => $_getN(13);
  @$pb.TagNumber(14)
  set paxcounter($2.ModuleConfig_PaxcounterConfig v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasPaxcounter() => $_has(13);
  @$pb.TagNumber(14)
  void clearPaxcounter() => clearField(14);
  @$pb.TagNumber(14)
  $2.ModuleConfig_PaxcounterConfig ensurePaxcounter() => $_ensure(13);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
