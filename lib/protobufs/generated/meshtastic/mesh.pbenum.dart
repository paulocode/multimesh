//
//  Generated code. Do not modify.
//  source: meshtastic/mesh.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

///
///  Note: these enum names must EXACTLY match the string used in the device
///  bin/build-all.sh script.
///  Because they will be used to find firmware filenames in the android app for OTA updates.
///  To match the old style filenames, _ is converted to -, p is converted to .
class HardwareModel extends $pb.ProtobufEnum {
  static const HardwareModel UNSET =
      HardwareModel._(0, _omitEnumNames ? '' : 'UNSET');
  static const HardwareModel TLORA_V2 =
      HardwareModel._(1, _omitEnumNames ? '' : 'TLORA_V2');
  static const HardwareModel TLORA_V1 =
      HardwareModel._(2, _omitEnumNames ? '' : 'TLORA_V1');
  static const HardwareModel TLORA_V2_1_1P6 =
      HardwareModel._(3, _omitEnumNames ? '' : 'TLORA_V2_1_1P6');
  static const HardwareModel TBEAM =
      HardwareModel._(4, _omitEnumNames ? '' : 'TBEAM');
  static const HardwareModel HELTEC_V2_0 =
      HardwareModel._(5, _omitEnumNames ? '' : 'HELTEC_V2_0');
  static const HardwareModel TBEAM_V0P7 =
      HardwareModel._(6, _omitEnumNames ? '' : 'TBEAM_V0P7');
  static const HardwareModel T_ECHO =
      HardwareModel._(7, _omitEnumNames ? '' : 'T_ECHO');
  static const HardwareModel TLORA_V1_1P3 =
      HardwareModel._(8, _omitEnumNames ? '' : 'TLORA_V1_1P3');
  static const HardwareModel RAK4631 =
      HardwareModel._(9, _omitEnumNames ? '' : 'RAK4631');
  static const HardwareModel HELTEC_V2_1 =
      HardwareModel._(10, _omitEnumNames ? '' : 'HELTEC_V2_1');
  static const HardwareModel HELTEC_V1 =
      HardwareModel._(11, _omitEnumNames ? '' : 'HELTEC_V1');
  static const HardwareModel LILYGO_TBEAM_S3_CORE =
      HardwareModel._(12, _omitEnumNames ? '' : 'LILYGO_TBEAM_S3_CORE');
  static const HardwareModel RAK11200 =
      HardwareModel._(13, _omitEnumNames ? '' : 'RAK11200');
  static const HardwareModel NANO_G1 =
      HardwareModel._(14, _omitEnumNames ? '' : 'NANO_G1');
  static const HardwareModel TLORA_V2_1_1P8 =
      HardwareModel._(15, _omitEnumNames ? '' : 'TLORA_V2_1_1P8');
  static const HardwareModel TLORA_T3_S3 =
      HardwareModel._(16, _omitEnumNames ? '' : 'TLORA_T3_S3');
  static const HardwareModel NANO_G1_EXPLORER =
      HardwareModel._(17, _omitEnumNames ? '' : 'NANO_G1_EXPLORER');
  static const HardwareModel NANO_G2_ULTRA =
      HardwareModel._(18, _omitEnumNames ? '' : 'NANO_G2_ULTRA');
  static const HardwareModel LORA_TYPE =
      HardwareModel._(19, _omitEnumNames ? '' : 'LORA_TYPE');
  static const HardwareModel STATION_G1 =
      HardwareModel._(25, _omitEnumNames ? '' : 'STATION_G1');
  static const HardwareModel RAK11310 =
      HardwareModel._(26, _omitEnumNames ? '' : 'RAK11310');
  static const HardwareModel SENSELORA_RP2040 =
      HardwareModel._(27, _omitEnumNames ? '' : 'SENSELORA_RP2040');
  static const HardwareModel SENSELORA_S3 =
      HardwareModel._(28, _omitEnumNames ? '' : 'SENSELORA_S3');
  static const HardwareModel LORA_RELAY_V1 =
      HardwareModel._(32, _omitEnumNames ? '' : 'LORA_RELAY_V1');
  static const HardwareModel NRF52840DK =
      HardwareModel._(33, _omitEnumNames ? '' : 'NRF52840DK');
  static const HardwareModel PPR =
      HardwareModel._(34, _omitEnumNames ? '' : 'PPR');
  static const HardwareModel GENIEBLOCKS =
      HardwareModel._(35, _omitEnumNames ? '' : 'GENIEBLOCKS');
  static const HardwareModel NRF52_UNKNOWN =
      HardwareModel._(36, _omitEnumNames ? '' : 'NRF52_UNKNOWN');
  static const HardwareModel PORTDUINO =
      HardwareModel._(37, _omitEnumNames ? '' : 'PORTDUINO');
  static const HardwareModel ANDROID_SIM =
      HardwareModel._(38, _omitEnumNames ? '' : 'ANDROID_SIM');
  static const HardwareModel DIY_V1 =
      HardwareModel._(39, _omitEnumNames ? '' : 'DIY_V1');
  static const HardwareModel NRF52840_PCA10059 =
      HardwareModel._(40, _omitEnumNames ? '' : 'NRF52840_PCA10059');
  static const HardwareModel DR_DEV =
      HardwareModel._(41, _omitEnumNames ? '' : 'DR_DEV');
  static const HardwareModel M5STACK =
      HardwareModel._(42, _omitEnumNames ? '' : 'M5STACK');
  static const HardwareModel HELTEC_V3 =
      HardwareModel._(43, _omitEnumNames ? '' : 'HELTEC_V3');
  static const HardwareModel HELTEC_WSL_V3 =
      HardwareModel._(44, _omitEnumNames ? '' : 'HELTEC_WSL_V3');
  static const HardwareModel BETAFPV_2400_TX =
      HardwareModel._(45, _omitEnumNames ? '' : 'BETAFPV_2400_TX');
  static const HardwareModel BETAFPV_900_NANO_TX =
      HardwareModel._(46, _omitEnumNames ? '' : 'BETAFPV_900_NANO_TX');
  static const HardwareModel RPI_PICO =
      HardwareModel._(47, _omitEnumNames ? '' : 'RPI_PICO');
  static const HardwareModel HELTEC_WIRELESS_TRACKER =
      HardwareModel._(48, _omitEnumNames ? '' : 'HELTEC_WIRELESS_TRACKER');
  static const HardwareModel HELTEC_WIRELESS_PAPER =
      HardwareModel._(49, _omitEnumNames ? '' : 'HELTEC_WIRELESS_PAPER');
  static const HardwareModel T_DECK =
      HardwareModel._(50, _omitEnumNames ? '' : 'T_DECK');
  static const HardwareModel T_WATCH_S3 =
      HardwareModel._(51, _omitEnumNames ? '' : 'T_WATCH_S3');
  static const HardwareModel PICOMPUTER_S3 =
      HardwareModel._(52, _omitEnumNames ? '' : 'PICOMPUTER_S3');
  static const HardwareModel HELTEC_HT62 =
      HardwareModel._(53, _omitEnumNames ? '' : 'HELTEC_HT62');
  static const HardwareModel EBYTE_ESP32_S3 =
      HardwareModel._(54, _omitEnumNames ? '' : 'EBYTE_ESP32_S3');
  static const HardwareModel ESP32_S3_PICO =
      HardwareModel._(55, _omitEnumNames ? '' : 'ESP32_S3_PICO');
  static const HardwareModel PRIVATE_HW =
      HardwareModel._(255, _omitEnumNames ? '' : 'PRIVATE_HW');

  static const $core.List<HardwareModel> values = <HardwareModel>[
    UNSET,
    TLORA_V2,
    TLORA_V1,
    TLORA_V2_1_1P6,
    TBEAM,
    HELTEC_V2_0,
    TBEAM_V0P7,
    T_ECHO,
    TLORA_V1_1P3,
    RAK4631,
    HELTEC_V2_1,
    HELTEC_V1,
    LILYGO_TBEAM_S3_CORE,
    RAK11200,
    NANO_G1,
    TLORA_V2_1_1P8,
    TLORA_T3_S3,
    NANO_G1_EXPLORER,
    NANO_G2_ULTRA,
    LORA_TYPE,
    STATION_G1,
    RAK11310,
    SENSELORA_RP2040,
    SENSELORA_S3,
    LORA_RELAY_V1,
    NRF52840DK,
    PPR,
    GENIEBLOCKS,
    NRF52_UNKNOWN,
    PORTDUINO,
    ANDROID_SIM,
    DIY_V1,
    NRF52840_PCA10059,
    DR_DEV,
    M5STACK,
    HELTEC_V3,
    HELTEC_WSL_V3,
    BETAFPV_2400_TX,
    BETAFPV_900_NANO_TX,
    RPI_PICO,
    HELTEC_WIRELESS_TRACKER,
    HELTEC_WIRELESS_PAPER,
    T_DECK,
    T_WATCH_S3,
    PICOMPUTER_S3,
    HELTEC_HT62,
    EBYTE_ESP32_S3,
    ESP32_S3_PICO,
    PRIVATE_HW,
  ];

  static final $core.Map<$core.int, HardwareModel> _byValue =
      $pb.ProtobufEnum.initByValue(values);

  static HardwareModel? valueOf($core.int value) => _byValue[value];

  const HardwareModel._($core.int v, $core.String n) : super(v, n);
}

///
///  Shared constants between device and phone
class Constants extends $pb.ProtobufEnum {
  static const Constants ZERO = Constants._(0, _omitEnumNames ? '' : 'ZERO');
  static const Constants DATA_PAYLOAD_LEN =
      Constants._(237, _omitEnumNames ? '' : 'DATA_PAYLOAD_LEN');

  static const $core.List<Constants> values = <Constants>[
    ZERO,
    DATA_PAYLOAD_LEN,
  ];

  static final $core.Map<$core.int, Constants> _byValue =
      $pb.ProtobufEnum.initByValue(values);

  static Constants? valueOf($core.int value) => _byValue[value];

  const Constants._($core.int v, $core.String n) : super(v, n);
}

///
///  Error codes for critical errors
///  The device might report these fault codes on the screen.
///  If you encounter a fault code, please post on the meshtastic.discourse.group
///  and we'll try to help.
class CriticalErrorCode extends $pb.ProtobufEnum {
  static const CriticalErrorCode NONE =
      CriticalErrorCode._(0, _omitEnumNames ? '' : 'NONE');
  static const CriticalErrorCode TX_WATCHDOG =
      CriticalErrorCode._(1, _omitEnumNames ? '' : 'TX_WATCHDOG');
  static const CriticalErrorCode SLEEP_ENTER_WAIT =
      CriticalErrorCode._(2, _omitEnumNames ? '' : 'SLEEP_ENTER_WAIT');
  static const CriticalErrorCode NO_RADIO =
      CriticalErrorCode._(3, _omitEnumNames ? '' : 'NO_RADIO');
  static const CriticalErrorCode UNSPECIFIED =
      CriticalErrorCode._(4, _omitEnumNames ? '' : 'UNSPECIFIED');
  static const CriticalErrorCode UBLOX_UNIT_FAILED =
      CriticalErrorCode._(5, _omitEnumNames ? '' : 'UBLOX_UNIT_FAILED');
  static const CriticalErrorCode NO_AXP192 =
      CriticalErrorCode._(6, _omitEnumNames ? '' : 'NO_AXP192');
  static const CriticalErrorCode INVALID_RADIO_SETTING =
      CriticalErrorCode._(7, _omitEnumNames ? '' : 'INVALID_RADIO_SETTING');
  static const CriticalErrorCode TRANSMIT_FAILED =
      CriticalErrorCode._(8, _omitEnumNames ? '' : 'TRANSMIT_FAILED');
  static const CriticalErrorCode BROWNOUT =
      CriticalErrorCode._(9, _omitEnumNames ? '' : 'BROWNOUT');
  static const CriticalErrorCode SX1262_FAILURE =
      CriticalErrorCode._(10, _omitEnumNames ? '' : 'SX1262_FAILURE');
  static const CriticalErrorCode RADIO_SPI_BUG =
      CriticalErrorCode._(11, _omitEnumNames ? '' : 'RADIO_SPI_BUG');

  static const $core.List<CriticalErrorCode> values = <CriticalErrorCode>[
    NONE,
    TX_WATCHDOG,
    SLEEP_ENTER_WAIT,
    NO_RADIO,
    UNSPECIFIED,
    UBLOX_UNIT_FAILED,
    NO_AXP192,
    INVALID_RADIO_SETTING,
    TRANSMIT_FAILED,
    BROWNOUT,
    SX1262_FAILURE,
    RADIO_SPI_BUG,
  ];

  static final $core.Map<$core.int, CriticalErrorCode> _byValue =
      $pb.ProtobufEnum.initByValue(values);

  static CriticalErrorCode? valueOf($core.int value) => _byValue[value];

  const CriticalErrorCode._($core.int v, $core.String n) : super(v, n);
}

///
///  How the location was acquired: manual, onboard GPS, external (EUD) GPS
class Position_LocSource extends $pb.ProtobufEnum {
  static const Position_LocSource LOC_UNSET =
      Position_LocSource._(0, _omitEnumNames ? '' : 'LOC_UNSET');
  static const Position_LocSource LOC_MANUAL =
      Position_LocSource._(1, _omitEnumNames ? '' : 'LOC_MANUAL');
  static const Position_LocSource LOC_INTERNAL =
      Position_LocSource._(2, _omitEnumNames ? '' : 'LOC_INTERNAL');
  static const Position_LocSource LOC_EXTERNAL =
      Position_LocSource._(3, _omitEnumNames ? '' : 'LOC_EXTERNAL');

  static const $core.List<Position_LocSource> values = <Position_LocSource>[
    LOC_UNSET,
    LOC_MANUAL,
    LOC_INTERNAL,
    LOC_EXTERNAL,
  ];

  static final $core.Map<$core.int, Position_LocSource> _byValue =
      $pb.ProtobufEnum.initByValue(values);

  static Position_LocSource? valueOf($core.int value) => _byValue[value];

  const Position_LocSource._($core.int v, $core.String n) : super(v, n);
}

///
///  How the altitude was acquired: manual, GPS int/ext, etc
///  Default: same as location_source if present
class Position_AltSource extends $pb.ProtobufEnum {
  static const Position_AltSource ALT_UNSET =
      Position_AltSource._(0, _omitEnumNames ? '' : 'ALT_UNSET');
  static const Position_AltSource ALT_MANUAL =
      Position_AltSource._(1, _omitEnumNames ? '' : 'ALT_MANUAL');
  static const Position_AltSource ALT_INTERNAL =
      Position_AltSource._(2, _omitEnumNames ? '' : 'ALT_INTERNAL');
  static const Position_AltSource ALT_EXTERNAL =
      Position_AltSource._(3, _omitEnumNames ? '' : 'ALT_EXTERNAL');
  static const Position_AltSource ALT_BAROMETRIC =
      Position_AltSource._(4, _omitEnumNames ? '' : 'ALT_BAROMETRIC');

  static const $core.List<Position_AltSource> values = <Position_AltSource>[
    ALT_UNSET,
    ALT_MANUAL,
    ALT_INTERNAL,
    ALT_EXTERNAL,
    ALT_BAROMETRIC,
  ];

  static final $core.Map<$core.int, Position_AltSource> _byValue =
      $pb.ProtobufEnum.initByValue(values);

  static Position_AltSource? valueOf($core.int value) => _byValue[value];

  const Position_AltSource._($core.int v, $core.String n) : super(v, n);
}

///
///  A failure in delivering a message (usually used for routing control messages, but might be provided in addition to ack.fail_id to provide
///  details on the type of failure).
class Routing_Error extends $pb.ProtobufEnum {
  static const Routing_Error NONE =
      Routing_Error._(0, _omitEnumNames ? '' : 'NONE');
  static const Routing_Error NO_ROUTE =
      Routing_Error._(1, _omitEnumNames ? '' : 'NO_ROUTE');
  static const Routing_Error GOT_NAK =
      Routing_Error._(2, _omitEnumNames ? '' : 'GOT_NAK');
  static const Routing_Error TIMEOUT =
      Routing_Error._(3, _omitEnumNames ? '' : 'TIMEOUT');
  static const Routing_Error NO_INTERFACE =
      Routing_Error._(4, _omitEnumNames ? '' : 'NO_INTERFACE');
  static const Routing_Error MAX_RETRANSMIT =
      Routing_Error._(5, _omitEnumNames ? '' : 'MAX_RETRANSMIT');
  static const Routing_Error NO_CHANNEL =
      Routing_Error._(6, _omitEnumNames ? '' : 'NO_CHANNEL');
  static const Routing_Error TOO_LARGE =
      Routing_Error._(7, _omitEnumNames ? '' : 'TOO_LARGE');
  static const Routing_Error NO_RESPONSE =
      Routing_Error._(8, _omitEnumNames ? '' : 'NO_RESPONSE');
  static const Routing_Error DUTY_CYCLE_LIMIT =
      Routing_Error._(9, _omitEnumNames ? '' : 'DUTY_CYCLE_LIMIT');
  static const Routing_Error BAD_REQUEST =
      Routing_Error._(32, _omitEnumNames ? '' : 'BAD_REQUEST');
  static const Routing_Error NOT_AUTHORIZED =
      Routing_Error._(33, _omitEnumNames ? '' : 'NOT_AUTHORIZED');

  static const $core.List<Routing_Error> values = <Routing_Error>[
    NONE,
    NO_ROUTE,
    GOT_NAK,
    TIMEOUT,
    NO_INTERFACE,
    MAX_RETRANSMIT,
    NO_CHANNEL,
    TOO_LARGE,
    NO_RESPONSE,
    DUTY_CYCLE_LIMIT,
    BAD_REQUEST,
    NOT_AUTHORIZED,
  ];

  static final $core.Map<$core.int, Routing_Error> _byValue =
      $pb.ProtobufEnum.initByValue(values);

  static Routing_Error? valueOf($core.int value) => _byValue[value];

  const Routing_Error._($core.int v, $core.String n) : super(v, n);
}

///
///  The priority of this message for sending.
///  Higher priorities are sent first (when managing the transmit queue).
///  This field is never sent over the air, it is only used internally inside of a local device node.
///  API clients (either on the local node or connected directly to the node)
///  can set this parameter if necessary.
///  (values must be <= 127 to keep protobuf field to one byte in size.
///  Detailed background on this field:
///  I noticed a funny side effect of lora being so slow: Usually when making
///  a protocol there isn’t much need to use message priority to change the order
///  of transmission (because interfaces are fairly fast).
///  But for lora where packets can take a few seconds each, it is very important
///  to make sure that critical packets are sent ASAP.
///  In the case of meshtastic that means we want to send protocol acks as soon as possible
///  (to prevent unneeded retransmissions), we want routing messages to be sent next,
///  then messages marked as reliable and finally 'background' packets like periodic position updates.
///  So I bit the bullet and implemented a new (internal - not sent over the air)
///  field in MeshPacket called 'priority'.
///  And the transmission queue in the router object is now a priority queue.
class MeshPacket_Priority extends $pb.ProtobufEnum {
  static const MeshPacket_Priority UNSET =
      MeshPacket_Priority._(0, _omitEnumNames ? '' : 'UNSET');
  static const MeshPacket_Priority MIN =
      MeshPacket_Priority._(1, _omitEnumNames ? '' : 'MIN');
  static const MeshPacket_Priority BACKGROUND =
      MeshPacket_Priority._(10, _omitEnumNames ? '' : 'BACKGROUND');
  static const MeshPacket_Priority DEFAULT =
      MeshPacket_Priority._(64, _omitEnumNames ? '' : 'DEFAULT');
  static const MeshPacket_Priority RELIABLE =
      MeshPacket_Priority._(70, _omitEnumNames ? '' : 'RELIABLE');
  static const MeshPacket_Priority ACK =
      MeshPacket_Priority._(120, _omitEnumNames ? '' : 'ACK');
  static const MeshPacket_Priority MAX =
      MeshPacket_Priority._(127, _omitEnumNames ? '' : 'MAX');

  static const $core.List<MeshPacket_Priority> values = <MeshPacket_Priority>[
    UNSET,
    MIN,
    BACKGROUND,
    DEFAULT,
    RELIABLE,
    ACK,
    MAX,
  ];

  static final $core.Map<$core.int, MeshPacket_Priority> _byValue =
      $pb.ProtobufEnum.initByValue(values);

  static MeshPacket_Priority? valueOf($core.int value) => _byValue[value];

  const MeshPacket_Priority._($core.int v, $core.String n) : super(v, n);
}

///
///  Identify if this is a delayed packet
class MeshPacket_Delayed extends $pb.ProtobufEnum {
  static const MeshPacket_Delayed NO_DELAY =
      MeshPacket_Delayed._(0, _omitEnumNames ? '' : 'NO_DELAY');
  static const MeshPacket_Delayed DELAYED_BROADCAST =
      MeshPacket_Delayed._(1, _omitEnumNames ? '' : 'DELAYED_BROADCAST');
  static const MeshPacket_Delayed DELAYED_DIRECT =
      MeshPacket_Delayed._(2, _omitEnumNames ? '' : 'DELAYED_DIRECT');

  static const $core.List<MeshPacket_Delayed> values = <MeshPacket_Delayed>[
    NO_DELAY,
    DELAYED_BROADCAST,
    DELAYED_DIRECT,
  ];

  static final $core.Map<$core.int, MeshPacket_Delayed> _byValue =
      $pb.ProtobufEnum.initByValue(values);

  static MeshPacket_Delayed? valueOf($core.int value) => _byValue[value];

  const MeshPacket_Delayed._($core.int v, $core.String n) : super(v, n);
}

///
///  Log levels, chosen to match python logging conventions.
class LogRecord_Level extends $pb.ProtobufEnum {
  static const LogRecord_Level UNSET =
      LogRecord_Level._(0, _omitEnumNames ? '' : 'UNSET');
  static const LogRecord_Level CRITICAL =
      LogRecord_Level._(50, _omitEnumNames ? '' : 'CRITICAL');
  static const LogRecord_Level ERROR =
      LogRecord_Level._(40, _omitEnumNames ? '' : 'ERROR');
  static const LogRecord_Level WARNING =
      LogRecord_Level._(30, _omitEnumNames ? '' : 'WARNING');
  static const LogRecord_Level INFO =
      LogRecord_Level._(20, _omitEnumNames ? '' : 'INFO');
  static const LogRecord_Level DEBUG =
      LogRecord_Level._(10, _omitEnumNames ? '' : 'DEBUG');
  static const LogRecord_Level TRACE =
      LogRecord_Level._(5, _omitEnumNames ? '' : 'TRACE');

  static const $core.List<LogRecord_Level> values = <LogRecord_Level>[
    UNSET,
    CRITICAL,
    ERROR,
    WARNING,
    INFO,
    DEBUG,
    TRACE,
  ];

  static final $core.Map<$core.int, LogRecord_Level> _byValue =
      $pb.ProtobufEnum.initByValue(values);

  static LogRecord_Level? valueOf($core.int value) => _byValue[value];

  const LogRecord_Level._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
