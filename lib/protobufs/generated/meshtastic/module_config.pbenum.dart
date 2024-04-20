//
//  Generated code. Do not modify.
//  source: meshtastic/module_config.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RemoteHardwarePinType extends $pb.ProtobufEnum {
  static const RemoteHardwarePinType UNKNOWN =
      RemoteHardwarePinType._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const RemoteHardwarePinType DIGITAL_READ =
      RemoteHardwarePinType._(1, _omitEnumNames ? '' : 'DIGITAL_READ');
  static const RemoteHardwarePinType DIGITAL_WRITE =
      RemoteHardwarePinType._(2, _omitEnumNames ? '' : 'DIGITAL_WRITE');

  static const $core.List<RemoteHardwarePinType> values =
      <RemoteHardwarePinType>[
    UNKNOWN,
    DIGITAL_READ,
    DIGITAL_WRITE,
  ];

  static final $core.Map<$core.int, RemoteHardwarePinType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RemoteHardwarePinType? valueOf($core.int value) => _byValue[value];

  const RemoteHardwarePinType._($core.int v, $core.String n) : super(v, n);
}

///
///  Baudrate for codec2 voice
class ModuleConfig_AudioConfig_Audio_Baud extends $pb.ProtobufEnum {
  static const ModuleConfig_AudioConfig_Audio_Baud CODEC2_DEFAULT =
      ModuleConfig_AudioConfig_Audio_Baud._(
          0, _omitEnumNames ? '' : 'CODEC2_DEFAULT');
  static const ModuleConfig_AudioConfig_Audio_Baud CODEC2_3200 =
      ModuleConfig_AudioConfig_Audio_Baud._(
          1, _omitEnumNames ? '' : 'CODEC2_3200');
  static const ModuleConfig_AudioConfig_Audio_Baud CODEC2_2400 =
      ModuleConfig_AudioConfig_Audio_Baud._(
          2, _omitEnumNames ? '' : 'CODEC2_2400');
  static const ModuleConfig_AudioConfig_Audio_Baud CODEC2_1600 =
      ModuleConfig_AudioConfig_Audio_Baud._(
          3, _omitEnumNames ? '' : 'CODEC2_1600');
  static const ModuleConfig_AudioConfig_Audio_Baud CODEC2_1400 =
      ModuleConfig_AudioConfig_Audio_Baud._(
          4, _omitEnumNames ? '' : 'CODEC2_1400');
  static const ModuleConfig_AudioConfig_Audio_Baud CODEC2_1300 =
      ModuleConfig_AudioConfig_Audio_Baud._(
          5, _omitEnumNames ? '' : 'CODEC2_1300');
  static const ModuleConfig_AudioConfig_Audio_Baud CODEC2_1200 =
      ModuleConfig_AudioConfig_Audio_Baud._(
          6, _omitEnumNames ? '' : 'CODEC2_1200');
  static const ModuleConfig_AudioConfig_Audio_Baud CODEC2_700 =
      ModuleConfig_AudioConfig_Audio_Baud._(
          7, _omitEnumNames ? '' : 'CODEC2_700');
  static const ModuleConfig_AudioConfig_Audio_Baud CODEC2_700B =
      ModuleConfig_AudioConfig_Audio_Baud._(
          8, _omitEnumNames ? '' : 'CODEC2_700B');

  static const $core.List<ModuleConfig_AudioConfig_Audio_Baud> values =
      <ModuleConfig_AudioConfig_Audio_Baud>[
    CODEC2_DEFAULT,
    CODEC2_3200,
    CODEC2_2400,
    CODEC2_1600,
    CODEC2_1400,
    CODEC2_1300,
    CODEC2_1200,
    CODEC2_700,
    CODEC2_700B,
  ];

  static final $core.Map<$core.int, ModuleConfig_AudioConfig_Audio_Baud>
      _byValue = $pb.ProtobufEnum.initByValue(values);
  static ModuleConfig_AudioConfig_Audio_Baud? valueOf($core.int value) =>
      _byValue[value];

  const ModuleConfig_AudioConfig_Audio_Baud._($core.int v, $core.String n)
      : super(v, n);
}

///
///  TODO: REPLACE
class ModuleConfig_SerialConfig_Serial_Baud extends $pb.ProtobufEnum {
  static const ModuleConfig_SerialConfig_Serial_Baud BAUD_DEFAULT =
      ModuleConfig_SerialConfig_Serial_Baud._(
          0, _omitEnumNames ? '' : 'BAUD_DEFAULT');
  static const ModuleConfig_SerialConfig_Serial_Baud BAUD_110 =
      ModuleConfig_SerialConfig_Serial_Baud._(
          1, _omitEnumNames ? '' : 'BAUD_110');
  static const ModuleConfig_SerialConfig_Serial_Baud BAUD_300 =
      ModuleConfig_SerialConfig_Serial_Baud._(
          2, _omitEnumNames ? '' : 'BAUD_300');
  static const ModuleConfig_SerialConfig_Serial_Baud BAUD_600 =
      ModuleConfig_SerialConfig_Serial_Baud._(
          3, _omitEnumNames ? '' : 'BAUD_600');
  static const ModuleConfig_SerialConfig_Serial_Baud BAUD_1200 =
      ModuleConfig_SerialConfig_Serial_Baud._(
          4, _omitEnumNames ? '' : 'BAUD_1200');
  static const ModuleConfig_SerialConfig_Serial_Baud BAUD_2400 =
      ModuleConfig_SerialConfig_Serial_Baud._(
          5, _omitEnumNames ? '' : 'BAUD_2400');
  static const ModuleConfig_SerialConfig_Serial_Baud BAUD_4800 =
      ModuleConfig_SerialConfig_Serial_Baud._(
          6, _omitEnumNames ? '' : 'BAUD_4800');
  static const ModuleConfig_SerialConfig_Serial_Baud BAUD_9600 =
      ModuleConfig_SerialConfig_Serial_Baud._(
          7, _omitEnumNames ? '' : 'BAUD_9600');
  static const ModuleConfig_SerialConfig_Serial_Baud BAUD_19200 =
      ModuleConfig_SerialConfig_Serial_Baud._(
          8, _omitEnumNames ? '' : 'BAUD_19200');
  static const ModuleConfig_SerialConfig_Serial_Baud BAUD_38400 =
      ModuleConfig_SerialConfig_Serial_Baud._(
          9, _omitEnumNames ? '' : 'BAUD_38400');
  static const ModuleConfig_SerialConfig_Serial_Baud BAUD_57600 =
      ModuleConfig_SerialConfig_Serial_Baud._(
          10, _omitEnumNames ? '' : 'BAUD_57600');
  static const ModuleConfig_SerialConfig_Serial_Baud BAUD_115200 =
      ModuleConfig_SerialConfig_Serial_Baud._(
          11, _omitEnumNames ? '' : 'BAUD_115200');
  static const ModuleConfig_SerialConfig_Serial_Baud BAUD_230400 =
      ModuleConfig_SerialConfig_Serial_Baud._(
          12, _omitEnumNames ? '' : 'BAUD_230400');
  static const ModuleConfig_SerialConfig_Serial_Baud BAUD_460800 =
      ModuleConfig_SerialConfig_Serial_Baud._(
          13, _omitEnumNames ? '' : 'BAUD_460800');
  static const ModuleConfig_SerialConfig_Serial_Baud BAUD_576000 =
      ModuleConfig_SerialConfig_Serial_Baud._(
          14, _omitEnumNames ? '' : 'BAUD_576000');
  static const ModuleConfig_SerialConfig_Serial_Baud BAUD_921600 =
      ModuleConfig_SerialConfig_Serial_Baud._(
          15, _omitEnumNames ? '' : 'BAUD_921600');

  static const $core.List<ModuleConfig_SerialConfig_Serial_Baud> values =
      <ModuleConfig_SerialConfig_Serial_Baud>[
    BAUD_DEFAULT,
    BAUD_110,
    BAUD_300,
    BAUD_600,
    BAUD_1200,
    BAUD_2400,
    BAUD_4800,
    BAUD_9600,
    BAUD_19200,
    BAUD_38400,
    BAUD_57600,
    BAUD_115200,
    BAUD_230400,
    BAUD_460800,
    BAUD_576000,
    BAUD_921600,
  ];

  static final $core.Map<$core.int, ModuleConfig_SerialConfig_Serial_Baud>
      _byValue = $pb.ProtobufEnum.initByValue(values);
  static ModuleConfig_SerialConfig_Serial_Baud? valueOf($core.int value) =>
      _byValue[value];

  const ModuleConfig_SerialConfig_Serial_Baud._($core.int v, $core.String n)
      : super(v, n);
}

///
///  TODO: REPLACE
class ModuleConfig_SerialConfig_Serial_Mode extends $pb.ProtobufEnum {
  static const ModuleConfig_SerialConfig_Serial_Mode DEFAULT =
      ModuleConfig_SerialConfig_Serial_Mode._(
          0, _omitEnumNames ? '' : 'DEFAULT');
  static const ModuleConfig_SerialConfig_Serial_Mode SIMPLE =
      ModuleConfig_SerialConfig_Serial_Mode._(
          1, _omitEnumNames ? '' : 'SIMPLE');
  static const ModuleConfig_SerialConfig_Serial_Mode PROTO =
      ModuleConfig_SerialConfig_Serial_Mode._(2, _omitEnumNames ? '' : 'PROTO');
  static const ModuleConfig_SerialConfig_Serial_Mode TEXTMSG =
      ModuleConfig_SerialConfig_Serial_Mode._(
          3, _omitEnumNames ? '' : 'TEXTMSG');
  static const ModuleConfig_SerialConfig_Serial_Mode NMEA =
      ModuleConfig_SerialConfig_Serial_Mode._(4, _omitEnumNames ? '' : 'NMEA');
  static const ModuleConfig_SerialConfig_Serial_Mode CALTOPO =
      ModuleConfig_SerialConfig_Serial_Mode._(
          5, _omitEnumNames ? '' : 'CALTOPO');

  static const $core.List<ModuleConfig_SerialConfig_Serial_Mode> values =
      <ModuleConfig_SerialConfig_Serial_Mode>[
    DEFAULT,
    SIMPLE,
    PROTO,
    TEXTMSG,
    NMEA,
    CALTOPO,
  ];

  static final $core.Map<$core.int, ModuleConfig_SerialConfig_Serial_Mode>
      _byValue = $pb.ProtobufEnum.initByValue(values);
  static ModuleConfig_SerialConfig_Serial_Mode? valueOf($core.int value) =>
      _byValue[value];

  const ModuleConfig_SerialConfig_Serial_Mode._($core.int v, $core.String n)
      : super(v, n);
}

///
///  TODO: REPLACE
class ModuleConfig_CannedMessageConfig_InputEventChar extends $pb.ProtobufEnum {
  static const ModuleConfig_CannedMessageConfig_InputEventChar NONE =
      ModuleConfig_CannedMessageConfig_InputEventChar._(
          0, _omitEnumNames ? '' : 'NONE');
  static const ModuleConfig_CannedMessageConfig_InputEventChar UP =
      ModuleConfig_CannedMessageConfig_InputEventChar._(
          17, _omitEnumNames ? '' : 'UP');
  static const ModuleConfig_CannedMessageConfig_InputEventChar DOWN =
      ModuleConfig_CannedMessageConfig_InputEventChar._(
          18, _omitEnumNames ? '' : 'DOWN');
  static const ModuleConfig_CannedMessageConfig_InputEventChar LEFT =
      ModuleConfig_CannedMessageConfig_InputEventChar._(
          19, _omitEnumNames ? '' : 'LEFT');
  static const ModuleConfig_CannedMessageConfig_InputEventChar RIGHT =
      ModuleConfig_CannedMessageConfig_InputEventChar._(
          20, _omitEnumNames ? '' : 'RIGHT');
  static const ModuleConfig_CannedMessageConfig_InputEventChar SELECT =
      ModuleConfig_CannedMessageConfig_InputEventChar._(
          10, _omitEnumNames ? '' : 'SELECT');
  static const ModuleConfig_CannedMessageConfig_InputEventChar BACK =
      ModuleConfig_CannedMessageConfig_InputEventChar._(
          27, _omitEnumNames ? '' : 'BACK');
  static const ModuleConfig_CannedMessageConfig_InputEventChar CANCEL =
      ModuleConfig_CannedMessageConfig_InputEventChar._(
          24, _omitEnumNames ? '' : 'CANCEL');

  static const $core.List<ModuleConfig_CannedMessageConfig_InputEventChar>
      values = <ModuleConfig_CannedMessageConfig_InputEventChar>[
    NONE,
    UP,
    DOWN,
    LEFT,
    RIGHT,
    SELECT,
    BACK,
    CANCEL,
  ];

  static final $core
      .Map<$core.int, ModuleConfig_CannedMessageConfig_InputEventChar>
      _byValue = $pb.ProtobufEnum.initByValue(values);
  static ModuleConfig_CannedMessageConfig_InputEventChar? valueOf(
          $core.int value) =>
      _byValue[value];

  const ModuleConfig_CannedMessageConfig_InputEventChar._(
      $core.int v, $core.String n)
      : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
