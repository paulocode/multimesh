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

import 'channel.pbenum.dart';

export 'channel.pbenum.dart';

///
///  This information can be encoded as a QRcode/url so that other users can configure
///  their radio to join the same channel.
///  A note about how channel names are shown to users: channelname-X
///  poundsymbol is a prefix used to indicate this is a channel name (idea from @professr).
///  Where X is a letter from A-Z (base 26) representing a hash of the PSK for this
///  channel - so that if the user changes anything about the channel (which does
///  force a new PSK) this letter will also change. Thus preventing user confusion if
///  two friends try to type in a channel name of "BobsChan" and then can't talk
///  because their PSKs will be different.
///  The PSK is hashed into this letter by "0x41 + [xor all bytes of the psk ] modulo 26"
///  This also allows the option of someday if people have the PSK off (zero), the
///  users COULD type in a channel name and be able to talk.
///  FIXME: Add description of multi-channel support and how primary vs secondary channels are used.
///  FIXME: explain how apps use channels for security.
///  explain how remote settings and remote gpio are managed as an example
class ChannelSettings extends $pb.GeneratedMessage {
  factory ChannelSettings({
    @$core.Deprecated('This field is deprecated.') $core.int? channelNum,
    $core.List<$core.int>? psk,
    $core.String? name,
    $core.int? id,
    $core.bool? uplinkEnabled,
    $core.bool? downlinkEnabled,
    ModuleSettings? moduleSettings,
  }) {
    final $result = create();
    if (channelNum != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.channelNum = channelNum;
    }
    if (psk != null) {
      $result.psk = psk;
    }
    if (name != null) {
      $result.name = name;
    }
    if (id != null) {
      $result.id = id;
    }
    if (uplinkEnabled != null) {
      $result.uplinkEnabled = uplinkEnabled;
    }
    if (downlinkEnabled != null) {
      $result.downlinkEnabled = downlinkEnabled;
    }
    if (moduleSettings != null) {
      $result.moduleSettings = moduleSettings;
    }
    return $result;
  }
  ChannelSettings._() : super();
  factory ChannelSettings.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ChannelSettings.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelSettings',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'channelNum', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'psk', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OF3)
    ..aOB(5, _omitFieldNames ? '' : 'uplinkEnabled')
    ..aOB(6, _omitFieldNames ? '' : 'downlinkEnabled')
    ..aOM<ModuleSettings>(7, _omitFieldNames ? '' : 'moduleSettings',
        subBuilder: ModuleSettings.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ChannelSettings clone() => ChannelSettings()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ChannelSettings copyWith(void Function(ChannelSettings) updates) =>
      super.copyWith((message) => updates(message as ChannelSettings))
          as ChannelSettings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelSettings create() => ChannelSettings._();
  ChannelSettings createEmptyInstance() => create();
  static $pb.PbList<ChannelSettings> createRepeated() =>
      $pb.PbList<ChannelSettings>();
  @$core.pragma('dart2js:noInline')
  static ChannelSettings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelSettings>(create);
  static ChannelSettings? _defaultInstance;

  ///
  ///  Deprecated in favor of LoraConfig.channel_num
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.int get channelNum => $_getIZ(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  set channelNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool hasChannelNum() => $_has(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  void clearChannelNum() => clearField(1);

  ///
  ///  A simple pre-shared key for now for crypto.
  ///  Must be either 0 bytes (no crypto), 16 bytes (AES128), or 32 bytes (AES256).
  ///  A special shorthand is used for 1 byte long psks.
  ///  These psks should be treated as only minimally secure,
  ///  because they are listed in this source code.
  ///  Those bytes are mapped using the following scheme:
  ///  `0` = No crypto
  ///  `1` = The special "default" channel key: {0xd4, 0xf1, 0xbb, 0x3a, 0x20, 0x29, 0x07, 0x59, 0xf0, 0xbc, 0xff, 0xab, 0xcf, 0x4e, 0x69, 0x01}
  ///  `2` through 10 = The default channel key, except with 1 through 9 added to the last byte.
  ///  Shown to user as simple1 through 10
  @$pb.TagNumber(2)
  $core.List<$core.int> get psk => $_getN(1);
  @$pb.TagNumber(2)
  set psk($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPsk() => $_has(1);
  @$pb.TagNumber(2)
  void clearPsk() => clearField(2);

  ///
  ///  A SHORT name that will be packed into the URL.
  ///  Less than 12 bytes.
  ///  Something for end users to call the channel
  ///  If this is the empty string it is assumed that this channel
  ///  is the special (minimally secure) "Default"channel.
  ///  In user interfaces it should be rendered as a local language translation of "X".
  ///  For channel_num hashing empty string will be treated as "X".
  ///  Where "X" is selected based on the English words listed above for ModemPreset
  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  ///
  ///  Used to construct a globally unique channel ID.
  ///  The full globally unique ID will be: "name.id" where ID is shown as base36.
  ///  Assuming that the number of meshtastic users is below 20K (true for a long time)
  ///  the chance of this 64 bit random number colliding with anyone else is super low.
  ///  And the penalty for collision is low as well, it just means that anyone trying to decrypt channel messages might need to
  ///  try multiple candidate channels.
  ///  Any time a non wire compatible change is made to a channel, this field should be regenerated.
  ///  There are a small number of 'special' globally known (and fairly) insecure standard channels.
  ///  Those channels do not have a numeric id included in the settings, but instead it is pulled from
  ///  a table of well known IDs.
  ///  (see Well Known Channels FIXME)
  @$pb.TagNumber(4)
  $core.int get id => $_getIZ(3);
  @$pb.TagNumber(4)
  set id($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(4)
  void clearId() => clearField(4);

  ///
  ///  If true, messages on the mesh will be sent to the *public* internet by any gateway ndoe
  @$pb.TagNumber(5)
  $core.bool get uplinkEnabled => $_getBF(4);
  @$pb.TagNumber(5)
  set uplinkEnabled($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUplinkEnabled() => $_has(4);
  @$pb.TagNumber(5)
  void clearUplinkEnabled() => clearField(5);

  ///
  ///  If true, messages seen on the internet will be forwarded to the local mesh.
  @$pb.TagNumber(6)
  $core.bool get downlinkEnabled => $_getBF(5);
  @$pb.TagNumber(6)
  set downlinkEnabled($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDownlinkEnabled() => $_has(5);
  @$pb.TagNumber(6)
  void clearDownlinkEnabled() => clearField(6);

  ///
  ///  Per-channel module settings.
  @$pb.TagNumber(7)
  ModuleSettings get moduleSettings => $_getN(6);
  @$pb.TagNumber(7)
  set moduleSettings(ModuleSettings v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasModuleSettings() => $_has(6);
  @$pb.TagNumber(7)
  void clearModuleSettings() => clearField(7);
  @$pb.TagNumber(7)
  ModuleSettings ensureModuleSettings() => $_ensure(6);
}

///
///  This message is specifically for modules to store per-channel configuration data.
class ModuleSettings extends $pb.GeneratedMessage {
  factory ModuleSettings({
    $core.int? positionPrecision,
  }) {
    final $result = create();
    if (positionPrecision != null) {
      $result.positionPrecision = positionPrecision;
    }
    return $result;
  }
  ModuleSettings._() : super();
  factory ModuleSettings.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ModuleSettings.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ModuleSettings',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1, _omitFieldNames ? '' : 'positionPrecision', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ModuleSettings clone() => ModuleSettings()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ModuleSettings copyWith(void Function(ModuleSettings) updates) =>
      super.copyWith((message) => updates(message as ModuleSettings))
          as ModuleSettings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ModuleSettings create() => ModuleSettings._();
  ModuleSettings createEmptyInstance() => create();
  static $pb.PbList<ModuleSettings> createRepeated() =>
      $pb.PbList<ModuleSettings>();
  @$core.pragma('dart2js:noInline')
  static ModuleSettings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ModuleSettings>(create);
  static ModuleSettings? _defaultInstance;

  ///
  ///  Bits of precision for the location sent in position packets.
  @$pb.TagNumber(1)
  $core.int get positionPrecision => $_getIZ(0);
  @$pb.TagNumber(1)
  set positionPrecision($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPositionPrecision() => $_has(0);
  @$pb.TagNumber(1)
  void clearPositionPrecision() => clearField(1);
}

///
///  A pair of a channel number, mode and the (sharable) settings for that channel
class Channel extends $pb.GeneratedMessage {
  factory Channel({
    $core.int? index,
    ChannelSettings? settings,
    Channel_Role? role,
  }) {
    final $result = create();
    if (index != null) {
      $result.index = index;
    }
    if (settings != null) {
      $result.settings = settings;
    }
    if (role != null) {
      $result.role = role;
    }
    return $result;
  }
  Channel._() : super();
  factory Channel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Channel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Channel',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'index', $pb.PbFieldType.O3)
    ..aOM<ChannelSettings>(2, _omitFieldNames ? '' : 'settings',
        subBuilder: ChannelSettings.create)
    ..e<Channel_Role>(3, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE,
        defaultOrMaker: Channel_Role.DISABLED,
        valueOf: Channel_Role.valueOf,
        enumValues: Channel_Role.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Channel clone() => Channel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Channel copyWith(void Function(Channel) updates) =>
      super.copyWith((message) => updates(message as Channel)) as Channel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Channel create() => Channel._();
  Channel createEmptyInstance() => create();
  static $pb.PbList<Channel> createRepeated() => $pb.PbList<Channel>();
  @$core.pragma('dart2js:noInline')
  static Channel getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Channel>(create);
  static Channel? _defaultInstance;

  ///
  ///  The index of this channel in the channel table (from 0 to MAX_NUM_CHANNELS-1)
  ///  (Someday - not currently implemented) An index of -1 could be used to mean "set by name",
  ///  in which case the target node will find and set the channel by settings.name.
  @$pb.TagNumber(1)
  $core.int get index => $_getIZ(0);
  @$pb.TagNumber(1)
  set index($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => clearField(1);

  ///
  ///  The new settings, or NULL to disable that channel
  @$pb.TagNumber(2)
  ChannelSettings get settings => $_getN(1);
  @$pb.TagNumber(2)
  set settings(ChannelSettings v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSettings() => $_has(1);
  @$pb.TagNumber(2)
  void clearSettings() => clearField(2);
  @$pb.TagNumber(2)
  ChannelSettings ensureSettings() => $_ensure(1);

  ///
  ///  TODO: REPLACE
  @$pb.TagNumber(3)
  Channel_Role get role => $_getN(2);
  @$pb.TagNumber(3)
  set role(Channel_Role v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearRole() => clearField(3);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
