//
//  Generated code. Do not modify.
//  source: meshtastic/deviceonly.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

///
///  Font sizes for the device screen
class ScreenFonts extends $pb.ProtobufEnum {
  static const ScreenFonts FONT_SMALL =
      ScreenFonts._(0, _omitEnumNames ? '' : 'FONT_SMALL');
  static const ScreenFonts FONT_MEDIUM =
      ScreenFonts._(1, _omitEnumNames ? '' : 'FONT_MEDIUM');
  static const ScreenFonts FONT_LARGE =
      ScreenFonts._(2, _omitEnumNames ? '' : 'FONT_LARGE');

  static const $core.List<ScreenFonts> values = <ScreenFonts>[
    FONT_SMALL,
    FONT_MEDIUM,
    FONT_LARGE,
  ];

  static final $core.Map<$core.int, ScreenFonts> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ScreenFonts? valueOf($core.int value) => _byValue[value];

  const ScreenFonts._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
