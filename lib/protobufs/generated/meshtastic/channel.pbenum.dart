//
//  Generated code. Do not modify.
//  source: meshtastic/channel.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

///
///  How this channel is being used (or not).
///  Note: this field is an enum to give us options for the future.
///  In particular, someday we might make a 'SCANNING' option.
///  SCANNING channels could have different frequencies and the radio would
///  occasionally check that freq to see if anything is being transmitted.
///  For devices that have multiple physical radios attached, we could keep multiple PRIMARY/SCANNING channels active at once to allow
///  cross band routing as needed.
///  If a device has only a single radio (the common case) only one channel can be PRIMARY at a time
///  (but any number of SECONDARY channels can't be sent received on that common frequency)
class Channel_Role extends $pb.ProtobufEnum {
  static const Channel_Role DISABLED = Channel_Role._(0, _omitEnumNames ? '' : 'DISABLED');
  static const Channel_Role PRIMARY = Channel_Role._(1, _omitEnumNames ? '' : 'PRIMARY');
  static const Channel_Role SECONDARY = Channel_Role._(2, _omitEnumNames ? '' : 'SECONDARY');

  static const $core.List<Channel_Role> values = <Channel_Role> [
    DISABLED,
    PRIMARY,
    SECONDARY,
  ];

  static final $core.Map<$core.int, Channel_Role> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Channel_Role? valueOf($core.int value) => _byValue[value];

  const Channel_Role._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
