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

import 'atak.pbenum.dart';

export 'atak.pbenum.dart';

enum TAKPacket_PayloadVariant {
  pli, 
  chat, 
  notSet
}

///
///  Packets for the official ATAK Plugin
class TAKPacket extends $pb.GeneratedMessage {
  factory TAKPacket({
    $core.bool? isCompressed,
    Contact? contact,
    Group? group,
    Status? status,
    PLI? pli,
    GeoChat? chat,
  }) {
    final $result = create();
    if (isCompressed != null) {
      $result.isCompressed = isCompressed;
    }
    if (contact != null) {
      $result.contact = contact;
    }
    if (group != null) {
      $result.group = group;
    }
    if (status != null) {
      $result.status = status;
    }
    if (pli != null) {
      $result.pli = pli;
    }
    if (chat != null) {
      $result.chat = chat;
    }
    return $result;
  }
  TAKPacket._() : super();
  factory TAKPacket.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TAKPacket.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, TAKPacket_PayloadVariant> _TAKPacket_PayloadVariantByTag = {
    5 : TAKPacket_PayloadVariant.pli,
    6 : TAKPacket_PayloadVariant.chat,
    0 : TAKPacket_PayloadVariant.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TAKPacket', package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'), createEmptyInstance: create)
    ..oo(0, [5, 6])
    ..aOB(1, _omitFieldNames ? '' : 'isCompressed')
    ..aOM<Contact>(2, _omitFieldNames ? '' : 'contact', subBuilder: Contact.create)
    ..aOM<Group>(3, _omitFieldNames ? '' : 'group', subBuilder: Group.create)
    ..aOM<Status>(4, _omitFieldNames ? '' : 'status', subBuilder: Status.create)
    ..aOM<PLI>(5, _omitFieldNames ? '' : 'pli', subBuilder: PLI.create)
    ..aOM<GeoChat>(6, _omitFieldNames ? '' : 'chat', subBuilder: GeoChat.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TAKPacket clone() => TAKPacket()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TAKPacket copyWith(void Function(TAKPacket) updates) => super.copyWith((message) => updates(message as TAKPacket)) as TAKPacket;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TAKPacket create() => TAKPacket._();
  TAKPacket createEmptyInstance() => create();
  static $pb.PbList<TAKPacket> createRepeated() => $pb.PbList<TAKPacket>();
  @$core.pragma('dart2js:noInline')
  static TAKPacket getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TAKPacket>(create);
  static TAKPacket? _defaultInstance;

  TAKPacket_PayloadVariant whichPayloadVariant() => _TAKPacket_PayloadVariantByTag[$_whichOneof(0)]!;
  void clearPayloadVariant() => clearField($_whichOneof(0));

  ///
  ///  Are the payloads strings compressed for LoRA transport?
  @$pb.TagNumber(1)
  $core.bool get isCompressed => $_getBF(0);
  @$pb.TagNumber(1)
  set isCompressed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsCompressed() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsCompressed() => clearField(1);

  ///
  ///  The contact / callsign for ATAK user
  @$pb.TagNumber(2)
  Contact get contact => $_getN(1);
  @$pb.TagNumber(2)
  set contact(Contact v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContact() => $_has(1);
  @$pb.TagNumber(2)
  void clearContact() => clearField(2);
  @$pb.TagNumber(2)
  Contact ensureContact() => $_ensure(1);

  ///
  ///  The group for ATAK user
  @$pb.TagNumber(3)
  Group get group => $_getN(2);
  @$pb.TagNumber(3)
  set group(Group v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasGroup() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroup() => clearField(3);
  @$pb.TagNumber(3)
  Group ensureGroup() => $_ensure(2);

  ///
  ///  The status of the ATAK EUD
  @$pb.TagNumber(4)
  Status get status => $_getN(3);
  @$pb.TagNumber(4)
  set status(Status v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);
  @$pb.TagNumber(4)
  Status ensureStatus() => $_ensure(3);

  ///
  ///  TAK position report
  @$pb.TagNumber(5)
  PLI get pli => $_getN(4);
  @$pb.TagNumber(5)
  set pli(PLI v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasPli() => $_has(4);
  @$pb.TagNumber(5)
  void clearPli() => clearField(5);
  @$pb.TagNumber(5)
  PLI ensurePli() => $_ensure(4);

  ///
  ///  ATAK GeoChat message
  @$pb.TagNumber(6)
  GeoChat get chat => $_getN(5);
  @$pb.TagNumber(6)
  set chat(GeoChat v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasChat() => $_has(5);
  @$pb.TagNumber(6)
  void clearChat() => clearField(6);
  @$pb.TagNumber(6)
  GeoChat ensureChat() => $_ensure(5);
}

///
///  ATAK GeoChat message
class GeoChat extends $pb.GeneratedMessage {
  factory GeoChat({
    $core.String? message,
    $core.String? to,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    if (to != null) {
      $result.to = to;
    }
    return $result;
  }
  GeoChat._() : super();
  factory GeoChat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GeoChat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GeoChat', package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..aOS(2, _omitFieldNames ? '' : 'to')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GeoChat clone() => GeoChat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GeoChat copyWith(void Function(GeoChat) updates) => super.copyWith((message) => updates(message as GeoChat)) as GeoChat;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GeoChat create() => GeoChat._();
  GeoChat createEmptyInstance() => create();
  static $pb.PbList<GeoChat> createRepeated() => $pb.PbList<GeoChat>();
  @$core.pragma('dart2js:noInline')
  static GeoChat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GeoChat>(create);
  static GeoChat? _defaultInstance;

  ///
  ///  The text message
  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  ///
  ///  Uid recipient of the message
  @$pb.TagNumber(2)
  $core.String get to => $_getSZ(1);
  @$pb.TagNumber(2)
  set to($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => clearField(2);
}

///
///  ATAK Group
///  <__group role='Team Member' name='Cyan'/>
class Group extends $pb.GeneratedMessage {
  factory Group({
    MemberRole? role,
    Team? team,
  }) {
    final $result = create();
    if (role != null) {
      $result.role = role;
    }
    if (team != null) {
      $result.team = team;
    }
    return $result;
  }
  Group._() : super();
  factory Group.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Group.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Group', package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'), createEmptyInstance: create)
    ..e<MemberRole>(1, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: MemberRole.Unspecifed, valueOf: MemberRole.valueOf, enumValues: MemberRole.values)
    ..e<Team>(2, _omitFieldNames ? '' : 'team', $pb.PbFieldType.OE, defaultOrMaker: Team.Unspecifed_Color, valueOf: Team.valueOf, enumValues: Team.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Group clone() => Group()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Group copyWith(void Function(Group) updates) => super.copyWith((message) => updates(message as Group)) as Group;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Group create() => Group._();
  Group createEmptyInstance() => create();
  static $pb.PbList<Group> createRepeated() => $pb.PbList<Group>();
  @$core.pragma('dart2js:noInline')
  static Group getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Group>(create);
  static Group? _defaultInstance;

  ///
  ///  Role of the group member
  @$pb.TagNumber(1)
  MemberRole get role => $_getN(0);
  @$pb.TagNumber(1)
  set role(MemberRole v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRole() => $_has(0);
  @$pb.TagNumber(1)
  void clearRole() => clearField(1);

  ///
  ///  Team (color)
  ///  Default Cyan
  @$pb.TagNumber(2)
  Team get team => $_getN(1);
  @$pb.TagNumber(2)
  set team(Team v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTeam() => $_has(1);
  @$pb.TagNumber(2)
  void clearTeam() => clearField(2);
}

///
///  ATAK EUD Status
///  <status battery='100' />
class Status extends $pb.GeneratedMessage {
  factory Status({
    $core.int? battery,
  }) {
    final $result = create();
    if (battery != null) {
      $result.battery = battery;
    }
    return $result;
  }
  Status._() : super();
  factory Status.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Status.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Status', package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'battery', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Status clone() => Status()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Status copyWith(void Function(Status) updates) => super.copyWith((message) => updates(message as Status)) as Status;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Status create() => Status._();
  Status createEmptyInstance() => create();
  static $pb.PbList<Status> createRepeated() => $pb.PbList<Status>();
  @$core.pragma('dart2js:noInline')
  static Status getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Status>(create);
  static Status? _defaultInstance;

  ///
  ///  Battery level
  @$pb.TagNumber(1)
  $core.int get battery => $_getIZ(0);
  @$pb.TagNumber(1)
  set battery($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBattery() => $_has(0);
  @$pb.TagNumber(1)
  void clearBattery() => clearField(1);
}

///
///  ATAK Contact
///  <contact endpoint='0.0.0.0:4242:tcp' phone='+12345678' callsign='FALKE'/>
class Contact extends $pb.GeneratedMessage {
  factory Contact({
    $core.String? callsign,
    $core.String? deviceCallsign,
  }) {
    final $result = create();
    if (callsign != null) {
      $result.callsign = callsign;
    }
    if (deviceCallsign != null) {
      $result.deviceCallsign = deviceCallsign;
    }
    return $result;
  }
  Contact._() : super();
  factory Contact.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Contact.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Contact', package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'callsign')
    ..aOS(2, _omitFieldNames ? '' : 'deviceCallsign')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Contact clone() => Contact()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Contact copyWith(void Function(Contact) updates) => super.copyWith((message) => updates(message as Contact)) as Contact;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Contact create() => Contact._();
  Contact createEmptyInstance() => create();
  static $pb.PbList<Contact> createRepeated() => $pb.PbList<Contact>();
  @$core.pragma('dart2js:noInline')
  static Contact getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Contact>(create);
  static Contact? _defaultInstance;

  ///
  ///  Callsign
  @$pb.TagNumber(1)
  $core.String get callsign => $_getSZ(0);
  @$pb.TagNumber(1)
  set callsign($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCallsign() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallsign() => clearField(1);

  ///
  ///  Device callsign
  @$pb.TagNumber(2)
  $core.String get deviceCallsign => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceCallsign($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceCallsign() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceCallsign() => clearField(2);
}

///
///  Position Location Information from ATAK
class PLI extends $pb.GeneratedMessage {
  factory PLI({
    $core.int? latitudeI,
    $core.int? longitudeI,
    $core.int? altitude,
    $core.int? speed,
    $core.int? course,
  }) {
    final $result = create();
    if (latitudeI != null) {
      $result.latitudeI = latitudeI;
    }
    if (longitudeI != null) {
      $result.longitudeI = longitudeI;
    }
    if (altitude != null) {
      $result.altitude = altitude;
    }
    if (speed != null) {
      $result.speed = speed;
    }
    if (course != null) {
      $result.course = course;
    }
    return $result;
  }
  PLI._() : super();
  factory PLI.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PLI.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PLI', package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'latitudeI', $pb.PbFieldType.OSF3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'longitudeI', $pb.PbFieldType.OSF3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'altitude', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'speed', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'course', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PLI clone() => PLI()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PLI copyWith(void Function(PLI) updates) => super.copyWith((message) => updates(message as PLI)) as PLI;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PLI create() => PLI._();
  PLI createEmptyInstance() => create();
  static $pb.PbList<PLI> createRepeated() => $pb.PbList<PLI>();
  @$core.pragma('dart2js:noInline')
  static PLI getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PLI>(create);
  static PLI? _defaultInstance;

  ///
  ///  The new preferred location encoding, multiply by 1e-7 to get degrees
  ///  in floating point
  @$pb.TagNumber(1)
  $core.int get latitudeI => $_getIZ(0);
  @$pb.TagNumber(1)
  set latitudeI($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLatitudeI() => $_has(0);
  @$pb.TagNumber(1)
  void clearLatitudeI() => clearField(1);

  ///
  ///  The new preferred location encoding, multiply by 1e-7 to get degrees
  ///  in floating point
  @$pb.TagNumber(2)
  $core.int get longitudeI => $_getIZ(1);
  @$pb.TagNumber(2)
  set longitudeI($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLongitudeI() => $_has(1);
  @$pb.TagNumber(2)
  void clearLongitudeI() => clearField(2);

  ///
  ///  Altitude (ATAK prefers HAE)
  @$pb.TagNumber(3)
  $core.int get altitude => $_getIZ(2);
  @$pb.TagNumber(3)
  set altitude($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAltitude() => $_has(2);
  @$pb.TagNumber(3)
  void clearAltitude() => clearField(3);

  ///
  ///  Speed
  @$pb.TagNumber(4)
  $core.int get speed => $_getIZ(3);
  @$pb.TagNumber(4)
  set speed($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSpeed() => $_has(3);
  @$pb.TagNumber(4)
  void clearSpeed() => clearField(4);

  ///
  ///  Course in degrees
  @$pb.TagNumber(5)
  $core.int get course => $_getIZ(4);
  @$pb.TagNumber(5)
  set course($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCourse() => $_has(4);
  @$pb.TagNumber(5)
  void clearCourse() => clearField(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
