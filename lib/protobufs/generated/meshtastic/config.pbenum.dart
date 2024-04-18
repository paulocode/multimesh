//
//  Generated code. Do not modify.
//  source: meshtastic/config.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

///
///  Defines the device's role on the Mesh network
class Config_DeviceConfig_Role extends $pb.ProtobufEnum {
  static const Config_DeviceConfig_Role CLIENT = Config_DeviceConfig_Role._(0, _omitEnumNames ? '' : 'CLIENT');
  static const Config_DeviceConfig_Role CLIENT_MUTE = Config_DeviceConfig_Role._(1, _omitEnumNames ? '' : 'CLIENT_MUTE');
  static const Config_DeviceConfig_Role ROUTER = Config_DeviceConfig_Role._(2, _omitEnumNames ? '' : 'ROUTER');
  static const Config_DeviceConfig_Role ROUTER_CLIENT = Config_DeviceConfig_Role._(3, _omitEnumNames ? '' : 'ROUTER_CLIENT');
  static const Config_DeviceConfig_Role REPEATER = Config_DeviceConfig_Role._(4, _omitEnumNames ? '' : 'REPEATER');
  static const Config_DeviceConfig_Role TRACKER = Config_DeviceConfig_Role._(5, _omitEnumNames ? '' : 'TRACKER');
  static const Config_DeviceConfig_Role SENSOR = Config_DeviceConfig_Role._(6, _omitEnumNames ? '' : 'SENSOR');
  static const Config_DeviceConfig_Role TAK = Config_DeviceConfig_Role._(7, _omitEnumNames ? '' : 'TAK');
  static const Config_DeviceConfig_Role CLIENT_HIDDEN = Config_DeviceConfig_Role._(8, _omitEnumNames ? '' : 'CLIENT_HIDDEN');
  static const Config_DeviceConfig_Role LOST_AND_FOUND = Config_DeviceConfig_Role._(9, _omitEnumNames ? '' : 'LOST_AND_FOUND');
  static const Config_DeviceConfig_Role TAK_TRACKER = Config_DeviceConfig_Role._(10, _omitEnumNames ? '' : 'TAK_TRACKER');

  static const $core.List<Config_DeviceConfig_Role> values = <Config_DeviceConfig_Role> [
    CLIENT,
    CLIENT_MUTE,
    ROUTER,
    ROUTER_CLIENT,
    REPEATER,
    TRACKER,
    SENSOR,
    TAK,
    CLIENT_HIDDEN,
    LOST_AND_FOUND,
    TAK_TRACKER,
  ];

  static final $core.Map<$core.int, Config_DeviceConfig_Role> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Config_DeviceConfig_Role? valueOf($core.int value) => _byValue[value];

  const Config_DeviceConfig_Role._($core.int v, $core.String n) : super(v, n);
}

///
///  Defines the device's behavior for how messages are rebroadcast
class Config_DeviceConfig_RebroadcastMode extends $pb.ProtobufEnum {
  static const Config_DeviceConfig_RebroadcastMode ALL = Config_DeviceConfig_RebroadcastMode._(0, _omitEnumNames ? '' : 'ALL');
  static const Config_DeviceConfig_RebroadcastMode ALL_SKIP_DECODING = Config_DeviceConfig_RebroadcastMode._(1, _omitEnumNames ? '' : 'ALL_SKIP_DECODING');
  static const Config_DeviceConfig_RebroadcastMode LOCAL_ONLY = Config_DeviceConfig_RebroadcastMode._(2, _omitEnumNames ? '' : 'LOCAL_ONLY');
  static const Config_DeviceConfig_RebroadcastMode KNOWN_ONLY = Config_DeviceConfig_RebroadcastMode._(3, _omitEnumNames ? '' : 'KNOWN_ONLY');

  static const $core.List<Config_DeviceConfig_RebroadcastMode> values = <Config_DeviceConfig_RebroadcastMode> [
    ALL,
    ALL_SKIP_DECODING,
    LOCAL_ONLY,
    KNOWN_ONLY,
  ];

  static final $core.Map<$core.int, Config_DeviceConfig_RebroadcastMode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Config_DeviceConfig_RebroadcastMode? valueOf($core.int value) => _byValue[value];

  const Config_DeviceConfig_RebroadcastMode._($core.int v, $core.String n) : super(v, n);
}

///
///  Bit field of boolean configuration options, indicating which optional
///  fields to include when assembling POSITION messages.
///  Longitude, latitude, altitude, speed, heading, and DOP
///  are always included (also time if GPS-synced)
///  NOTE: the more fields are included, the larger the message will be -
///    leading to longer airtime and a higher risk of packet loss
class Config_PositionConfig_PositionFlags extends $pb.ProtobufEnum {
  static const Config_PositionConfig_PositionFlags UNSET = Config_PositionConfig_PositionFlags._(0, _omitEnumNames ? '' : 'UNSET');
  static const Config_PositionConfig_PositionFlags ALTITUDE = Config_PositionConfig_PositionFlags._(1, _omitEnumNames ? '' : 'ALTITUDE');
  static const Config_PositionConfig_PositionFlags ALTITUDE_MSL = Config_PositionConfig_PositionFlags._(2, _omitEnumNames ? '' : 'ALTITUDE_MSL');
  static const Config_PositionConfig_PositionFlags GEOIDAL_SEPARATION = Config_PositionConfig_PositionFlags._(4, _omitEnumNames ? '' : 'GEOIDAL_SEPARATION');
  static const Config_PositionConfig_PositionFlags DOP = Config_PositionConfig_PositionFlags._(8, _omitEnumNames ? '' : 'DOP');
  static const Config_PositionConfig_PositionFlags HVDOP = Config_PositionConfig_PositionFlags._(16, _omitEnumNames ? '' : 'HVDOP');
  static const Config_PositionConfig_PositionFlags SATINVIEW = Config_PositionConfig_PositionFlags._(32, _omitEnumNames ? '' : 'SATINVIEW');
  static const Config_PositionConfig_PositionFlags SEQ_NO = Config_PositionConfig_PositionFlags._(64, _omitEnumNames ? '' : 'SEQ_NO');
  static const Config_PositionConfig_PositionFlags TIMESTAMP = Config_PositionConfig_PositionFlags._(128, _omitEnumNames ? '' : 'TIMESTAMP');
  static const Config_PositionConfig_PositionFlags HEADING = Config_PositionConfig_PositionFlags._(256, _omitEnumNames ? '' : 'HEADING');
  static const Config_PositionConfig_PositionFlags SPEED = Config_PositionConfig_PositionFlags._(512, _omitEnumNames ? '' : 'SPEED');

  static const $core.List<Config_PositionConfig_PositionFlags> values = <Config_PositionConfig_PositionFlags> [
    UNSET,
    ALTITUDE,
    ALTITUDE_MSL,
    GEOIDAL_SEPARATION,
    DOP,
    HVDOP,
    SATINVIEW,
    SEQ_NO,
    TIMESTAMP,
    HEADING,
    SPEED,
  ];

  static final $core.Map<$core.int, Config_PositionConfig_PositionFlags> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Config_PositionConfig_PositionFlags? valueOf($core.int value) => _byValue[value];

  const Config_PositionConfig_PositionFlags._($core.int v, $core.String n) : super(v, n);
}

class Config_PositionConfig_GpsMode extends $pb.ProtobufEnum {
  static const Config_PositionConfig_GpsMode DISABLED = Config_PositionConfig_GpsMode._(0, _omitEnumNames ? '' : 'DISABLED');
  static const Config_PositionConfig_GpsMode ENABLED = Config_PositionConfig_GpsMode._(1, _omitEnumNames ? '' : 'ENABLED');
  static const Config_PositionConfig_GpsMode NOT_PRESENT = Config_PositionConfig_GpsMode._(2, _omitEnumNames ? '' : 'NOT_PRESENT');

  static const $core.List<Config_PositionConfig_GpsMode> values = <Config_PositionConfig_GpsMode> [
    DISABLED,
    ENABLED,
    NOT_PRESENT,
  ];

  static final $core.Map<$core.int, Config_PositionConfig_GpsMode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Config_PositionConfig_GpsMode? valueOf($core.int value) => _byValue[value];

  const Config_PositionConfig_GpsMode._($core.int v, $core.String n) : super(v, n);
}

class Config_NetworkConfig_AddressMode extends $pb.ProtobufEnum {
  static const Config_NetworkConfig_AddressMode DHCP = Config_NetworkConfig_AddressMode._(0, _omitEnumNames ? '' : 'DHCP');
  static const Config_NetworkConfig_AddressMode STATIC = Config_NetworkConfig_AddressMode._(1, _omitEnumNames ? '' : 'STATIC');

  static const $core.List<Config_NetworkConfig_AddressMode> values = <Config_NetworkConfig_AddressMode> [
    DHCP,
    STATIC,
  ];

  static final $core.Map<$core.int, Config_NetworkConfig_AddressMode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Config_NetworkConfig_AddressMode? valueOf($core.int value) => _byValue[value];

  const Config_NetworkConfig_AddressMode._($core.int v, $core.String n) : super(v, n);
}

///
///  How the GPS coordinates are displayed on the OLED screen.
class Config_DisplayConfig_GpsCoordinateFormat extends $pb.ProtobufEnum {
  static const Config_DisplayConfig_GpsCoordinateFormat DEC = Config_DisplayConfig_GpsCoordinateFormat._(0, _omitEnumNames ? '' : 'DEC');
  static const Config_DisplayConfig_GpsCoordinateFormat DMS = Config_DisplayConfig_GpsCoordinateFormat._(1, _omitEnumNames ? '' : 'DMS');
  static const Config_DisplayConfig_GpsCoordinateFormat UTM = Config_DisplayConfig_GpsCoordinateFormat._(2, _omitEnumNames ? '' : 'UTM');
  static const Config_DisplayConfig_GpsCoordinateFormat MGRS = Config_DisplayConfig_GpsCoordinateFormat._(3, _omitEnumNames ? '' : 'MGRS');
  static const Config_DisplayConfig_GpsCoordinateFormat OLC = Config_DisplayConfig_GpsCoordinateFormat._(4, _omitEnumNames ? '' : 'OLC');
  static const Config_DisplayConfig_GpsCoordinateFormat OSGR = Config_DisplayConfig_GpsCoordinateFormat._(5, _omitEnumNames ? '' : 'OSGR');

  static const $core.List<Config_DisplayConfig_GpsCoordinateFormat> values = <Config_DisplayConfig_GpsCoordinateFormat> [
    DEC,
    DMS,
    UTM,
    MGRS,
    OLC,
    OSGR,
  ];

  static final $core.Map<$core.int, Config_DisplayConfig_GpsCoordinateFormat> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Config_DisplayConfig_GpsCoordinateFormat? valueOf($core.int value) => _byValue[value];

  const Config_DisplayConfig_GpsCoordinateFormat._($core.int v, $core.String n) : super(v, n);
}

///
///  Unit display preference
class Config_DisplayConfig_DisplayUnits extends $pb.ProtobufEnum {
  static const Config_DisplayConfig_DisplayUnits METRIC = Config_DisplayConfig_DisplayUnits._(0, _omitEnumNames ? '' : 'METRIC');
  static const Config_DisplayConfig_DisplayUnits IMPERIAL = Config_DisplayConfig_DisplayUnits._(1, _omitEnumNames ? '' : 'IMPERIAL');

  static const $core.List<Config_DisplayConfig_DisplayUnits> values = <Config_DisplayConfig_DisplayUnits> [
    METRIC,
    IMPERIAL,
  ];

  static final $core.Map<$core.int, Config_DisplayConfig_DisplayUnits> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Config_DisplayConfig_DisplayUnits? valueOf($core.int value) => _byValue[value];

  const Config_DisplayConfig_DisplayUnits._($core.int v, $core.String n) : super(v, n);
}

///
///  Override OLED outo detect with this if it fails.
class Config_DisplayConfig_OledType extends $pb.ProtobufEnum {
  static const Config_DisplayConfig_OledType OLED_AUTO = Config_DisplayConfig_OledType._(0, _omitEnumNames ? '' : 'OLED_AUTO');
  static const Config_DisplayConfig_OledType OLED_SSD1306 = Config_DisplayConfig_OledType._(1, _omitEnumNames ? '' : 'OLED_SSD1306');
  static const Config_DisplayConfig_OledType OLED_SH1106 = Config_DisplayConfig_OledType._(2, _omitEnumNames ? '' : 'OLED_SH1106');
  static const Config_DisplayConfig_OledType OLED_SH1107 = Config_DisplayConfig_OledType._(3, _omitEnumNames ? '' : 'OLED_SH1107');

  static const $core.List<Config_DisplayConfig_OledType> values = <Config_DisplayConfig_OledType> [
    OLED_AUTO,
    OLED_SSD1306,
    OLED_SH1106,
    OLED_SH1107,
  ];

  static final $core.Map<$core.int, Config_DisplayConfig_OledType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Config_DisplayConfig_OledType? valueOf($core.int value) => _byValue[value];

  const Config_DisplayConfig_OledType._($core.int v, $core.String n) : super(v, n);
}

class Config_DisplayConfig_DisplayMode extends $pb.ProtobufEnum {
  static const Config_DisplayConfig_DisplayMode DEFAULT = Config_DisplayConfig_DisplayMode._(0, _omitEnumNames ? '' : 'DEFAULT');
  static const Config_DisplayConfig_DisplayMode TWOCOLOR = Config_DisplayConfig_DisplayMode._(1, _omitEnumNames ? '' : 'TWOCOLOR');
  static const Config_DisplayConfig_DisplayMode INVERTED = Config_DisplayConfig_DisplayMode._(2, _omitEnumNames ? '' : 'INVERTED');
  static const Config_DisplayConfig_DisplayMode COLOR = Config_DisplayConfig_DisplayMode._(3, _omitEnumNames ? '' : 'COLOR');

  static const $core.List<Config_DisplayConfig_DisplayMode> values = <Config_DisplayConfig_DisplayMode> [
    DEFAULT,
    TWOCOLOR,
    INVERTED,
    COLOR,
  ];

  static final $core.Map<$core.int, Config_DisplayConfig_DisplayMode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Config_DisplayConfig_DisplayMode? valueOf($core.int value) => _byValue[value];

  const Config_DisplayConfig_DisplayMode._($core.int v, $core.String n) : super(v, n);
}

class Config_LoRaConfig_RegionCode extends $pb.ProtobufEnum {
  static const Config_LoRaConfig_RegionCode UNSET = Config_LoRaConfig_RegionCode._(0, _omitEnumNames ? '' : 'UNSET');
  static const Config_LoRaConfig_RegionCode US = Config_LoRaConfig_RegionCode._(1, _omitEnumNames ? '' : 'US');
  static const Config_LoRaConfig_RegionCode EU_433 = Config_LoRaConfig_RegionCode._(2, _omitEnumNames ? '' : 'EU_433');
  static const Config_LoRaConfig_RegionCode EU_868 = Config_LoRaConfig_RegionCode._(3, _omitEnumNames ? '' : 'EU_868');
  static const Config_LoRaConfig_RegionCode CN = Config_LoRaConfig_RegionCode._(4, _omitEnumNames ? '' : 'CN');
  static const Config_LoRaConfig_RegionCode JP = Config_LoRaConfig_RegionCode._(5, _omitEnumNames ? '' : 'JP');
  static const Config_LoRaConfig_RegionCode ANZ = Config_LoRaConfig_RegionCode._(6, _omitEnumNames ? '' : 'ANZ');
  static const Config_LoRaConfig_RegionCode KR = Config_LoRaConfig_RegionCode._(7, _omitEnumNames ? '' : 'KR');
  static const Config_LoRaConfig_RegionCode TW = Config_LoRaConfig_RegionCode._(8, _omitEnumNames ? '' : 'TW');
  static const Config_LoRaConfig_RegionCode RU = Config_LoRaConfig_RegionCode._(9, _omitEnumNames ? '' : 'RU');
  static const Config_LoRaConfig_RegionCode IN = Config_LoRaConfig_RegionCode._(10, _omitEnumNames ? '' : 'IN');
  static const Config_LoRaConfig_RegionCode NZ_865 = Config_LoRaConfig_RegionCode._(11, _omitEnumNames ? '' : 'NZ_865');
  static const Config_LoRaConfig_RegionCode TH = Config_LoRaConfig_RegionCode._(12, _omitEnumNames ? '' : 'TH');
  static const Config_LoRaConfig_RegionCode LORA_24 = Config_LoRaConfig_RegionCode._(13, _omitEnumNames ? '' : 'LORA_24');
  static const Config_LoRaConfig_RegionCode UA_433 = Config_LoRaConfig_RegionCode._(14, _omitEnumNames ? '' : 'UA_433');
  static const Config_LoRaConfig_RegionCode UA_868 = Config_LoRaConfig_RegionCode._(15, _omitEnumNames ? '' : 'UA_868');
  static const Config_LoRaConfig_RegionCode MY_433 = Config_LoRaConfig_RegionCode._(16, _omitEnumNames ? '' : 'MY_433');
  static const Config_LoRaConfig_RegionCode MY_919 = Config_LoRaConfig_RegionCode._(17, _omitEnumNames ? '' : 'MY_919');
  static const Config_LoRaConfig_RegionCode SG_923 = Config_LoRaConfig_RegionCode._(18, _omitEnumNames ? '' : 'SG_923');

  static const $core.List<Config_LoRaConfig_RegionCode> values = <Config_LoRaConfig_RegionCode> [
    UNSET,
    US,
    EU_433,
    EU_868,
    CN,
    JP,
    ANZ,
    KR,
    TW,
    RU,
    IN,
    NZ_865,
    TH,
    LORA_24,
    UA_433,
    UA_868,
    MY_433,
    MY_919,
    SG_923,
  ];

  static final $core.Map<$core.int, Config_LoRaConfig_RegionCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Config_LoRaConfig_RegionCode? valueOf($core.int value) => _byValue[value];

  const Config_LoRaConfig_RegionCode._($core.int v, $core.String n) : super(v, n);
}

///
///  Standard predefined channel settings
///  Note: these mappings must match ModemPreset Choice in the device code.
class Config_LoRaConfig_ModemPreset extends $pb.ProtobufEnum {
  static const Config_LoRaConfig_ModemPreset LONG_FAST = Config_LoRaConfig_ModemPreset._(0, _omitEnumNames ? '' : 'LONG_FAST');
  static const Config_LoRaConfig_ModemPreset LONG_SLOW = Config_LoRaConfig_ModemPreset._(1, _omitEnumNames ? '' : 'LONG_SLOW');
  static const Config_LoRaConfig_ModemPreset VERY_LONG_SLOW = Config_LoRaConfig_ModemPreset._(2, _omitEnumNames ? '' : 'VERY_LONG_SLOW');
  static const Config_LoRaConfig_ModemPreset MEDIUM_SLOW = Config_LoRaConfig_ModemPreset._(3, _omitEnumNames ? '' : 'MEDIUM_SLOW');
  static const Config_LoRaConfig_ModemPreset MEDIUM_FAST = Config_LoRaConfig_ModemPreset._(4, _omitEnumNames ? '' : 'MEDIUM_FAST');
  static const Config_LoRaConfig_ModemPreset SHORT_SLOW = Config_LoRaConfig_ModemPreset._(5, _omitEnumNames ? '' : 'SHORT_SLOW');
  static const Config_LoRaConfig_ModemPreset SHORT_FAST = Config_LoRaConfig_ModemPreset._(6, _omitEnumNames ? '' : 'SHORT_FAST');
  static const Config_LoRaConfig_ModemPreset LONG_MODERATE = Config_LoRaConfig_ModemPreset._(7, _omitEnumNames ? '' : 'LONG_MODERATE');

  static const $core.List<Config_LoRaConfig_ModemPreset> values = <Config_LoRaConfig_ModemPreset> [
    LONG_FAST,
    LONG_SLOW,
    VERY_LONG_SLOW,
    MEDIUM_SLOW,
    MEDIUM_FAST,
    SHORT_SLOW,
    SHORT_FAST,
    LONG_MODERATE,
  ];

  static final $core.Map<$core.int, Config_LoRaConfig_ModemPreset> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Config_LoRaConfig_ModemPreset? valueOf($core.int value) => _byValue[value];

  const Config_LoRaConfig_ModemPreset._($core.int v, $core.String n) : super(v, n);
}

class Config_BluetoothConfig_PairingMode extends $pb.ProtobufEnum {
  static const Config_BluetoothConfig_PairingMode RANDOM_PIN = Config_BluetoothConfig_PairingMode._(0, _omitEnumNames ? '' : 'RANDOM_PIN');
  static const Config_BluetoothConfig_PairingMode FIXED_PIN = Config_BluetoothConfig_PairingMode._(1, _omitEnumNames ? '' : 'FIXED_PIN');
  static const Config_BluetoothConfig_PairingMode NO_PIN = Config_BluetoothConfig_PairingMode._(2, _omitEnumNames ? '' : 'NO_PIN');

  static const $core.List<Config_BluetoothConfig_PairingMode> values = <Config_BluetoothConfig_PairingMode> [
    RANDOM_PIN,
    FIXED_PIN,
    NO_PIN,
  ];

  static final $core.Map<$core.int, Config_BluetoothConfig_PairingMode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Config_BluetoothConfig_PairingMode? valueOf($core.int value) => _byValue[value];

  const Config_BluetoothConfig_PairingMode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
