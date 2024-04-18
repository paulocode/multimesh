//
//  Generated code. Do not modify.
//  source: meshtastic/atak.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Team extends $pb.ProtobufEnum {
  static const Team Unspecifed_Color = Team._(0, _omitEnumNames ? '' : 'Unspecifed_Color');
  static const Team White = Team._(1, _omitEnumNames ? '' : 'White');
  static const Team Yellow = Team._(2, _omitEnumNames ? '' : 'Yellow');
  static const Team Orange = Team._(3, _omitEnumNames ? '' : 'Orange');
  static const Team Magenta = Team._(4, _omitEnumNames ? '' : 'Magenta');
  static const Team Red = Team._(5, _omitEnumNames ? '' : 'Red');
  static const Team Maroon = Team._(6, _omitEnumNames ? '' : 'Maroon');
  static const Team Purple = Team._(7, _omitEnumNames ? '' : 'Purple');
  static const Team Dark_Blue = Team._(8, _omitEnumNames ? '' : 'Dark_Blue');
  static const Team Blue = Team._(9, _omitEnumNames ? '' : 'Blue');
  static const Team Cyan = Team._(10, _omitEnumNames ? '' : 'Cyan');
  static const Team Teal = Team._(11, _omitEnumNames ? '' : 'Teal');
  static const Team Green = Team._(12, _omitEnumNames ? '' : 'Green');
  static const Team Dark_Green = Team._(13, _omitEnumNames ? '' : 'Dark_Green');
  static const Team Brown = Team._(14, _omitEnumNames ? '' : 'Brown');

  static const $core.List<Team> values = <Team> [
    Unspecifed_Color,
    White,
    Yellow,
    Orange,
    Magenta,
    Red,
    Maroon,
    Purple,
    Dark_Blue,
    Blue,
    Cyan,
    Teal,
    Green,
    Dark_Green,
    Brown,
  ];

  static final $core.Map<$core.int, Team> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Team? valueOf($core.int value) => _byValue[value];

  const Team._($core.int v, $core.String n) : super(v, n);
}

///
///  Role of the group member
class MemberRole extends $pb.ProtobufEnum {
  static const MemberRole Unspecifed = MemberRole._(0, _omitEnumNames ? '' : 'Unspecifed');
  static const MemberRole TeamMember = MemberRole._(1, _omitEnumNames ? '' : 'TeamMember');
  static const MemberRole TeamLead = MemberRole._(2, _omitEnumNames ? '' : 'TeamLead');
  static const MemberRole HQ = MemberRole._(3, _omitEnumNames ? '' : 'HQ');
  static const MemberRole Sniper = MemberRole._(4, _omitEnumNames ? '' : 'Sniper');
  static const MemberRole Medic = MemberRole._(5, _omitEnumNames ? '' : 'Medic');
  static const MemberRole ForwardObserver = MemberRole._(6, _omitEnumNames ? '' : 'ForwardObserver');
  static const MemberRole RTO = MemberRole._(7, _omitEnumNames ? '' : 'RTO');
  static const MemberRole K9 = MemberRole._(8, _omitEnumNames ? '' : 'K9');

  static const $core.List<MemberRole> values = <MemberRole> [
    Unspecifed,
    TeamMember,
    TeamLead,
    HQ,
    Sniper,
    Medic,
    ForwardObserver,
    RTO,
    K9,
  ];

  static final $core.Map<$core.int, MemberRole> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MemberRole? valueOf($core.int value) => _byValue[value];

  const MemberRole._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
