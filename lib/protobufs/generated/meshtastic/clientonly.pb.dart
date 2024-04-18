//
//  Generated code. Do not modify.
//  source: meshtastic/clientonly.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'localonly.pb.dart' as $8;

///
///  This abstraction is used to contain any configuration for provisioning a node on any client.
///  It is useful for importing and exporting configurations.
class DeviceProfile extends $pb.GeneratedMessage {
  factory DeviceProfile({
    $core.String? longName,
    $core.String? shortName,
    $core.String? channelUrl,
    $8.LocalConfig? config,
    $8.LocalModuleConfig? moduleConfig,
  }) {
    final $result = create();
    if (longName != null) {
      $result.longName = longName;
    }
    if (shortName != null) {
      $result.shortName = shortName;
    }
    if (channelUrl != null) {
      $result.channelUrl = channelUrl;
    }
    if (config != null) {
      $result.config = config;
    }
    if (moduleConfig != null) {
      $result.moduleConfig = moduleConfig;
    }
    return $result;
  }
  DeviceProfile._() : super();
  factory DeviceProfile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeviceProfile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeviceProfile', package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'longName')
    ..aOS(2, _omitFieldNames ? '' : 'shortName')
    ..aOS(3, _omitFieldNames ? '' : 'channelUrl')
    ..aOM<$8.LocalConfig>(4, _omitFieldNames ? '' : 'config', subBuilder: $8.LocalConfig.create)
    ..aOM<$8.LocalModuleConfig>(5, _omitFieldNames ? '' : 'moduleConfig', subBuilder: $8.LocalModuleConfig.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeviceProfile clone() => DeviceProfile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeviceProfile copyWith(void Function(DeviceProfile) updates) => super.copyWith((message) => updates(message as DeviceProfile)) as DeviceProfile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceProfile create() => DeviceProfile._();
  DeviceProfile createEmptyInstance() => create();
  static $pb.PbList<DeviceProfile> createRepeated() => $pb.PbList<DeviceProfile>();
  @$core.pragma('dart2js:noInline')
  static DeviceProfile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeviceProfile>(create);
  static DeviceProfile? _defaultInstance;

  ///
  ///  Long name for the node
  @$pb.TagNumber(1)
  $core.String get longName => $_getSZ(0);
  @$pb.TagNumber(1)
  set longName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLongName() => $_has(0);
  @$pb.TagNumber(1)
  void clearLongName() => clearField(1);

  ///
  ///  Short name of the node
  @$pb.TagNumber(2)
  $core.String get shortName => $_getSZ(1);
  @$pb.TagNumber(2)
  set shortName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasShortName() => $_has(1);
  @$pb.TagNumber(2)
  void clearShortName() => clearField(2);

  ///
  ///  The url of the channels from our node
  @$pb.TagNumber(3)
  $core.String get channelUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set channelUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChannelUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearChannelUrl() => clearField(3);

  ///
  ///  The Config of the node
  @$pb.TagNumber(4)
  $8.LocalConfig get config => $_getN(3);
  @$pb.TagNumber(4)
  set config($8.LocalConfig v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasConfig() => $_has(3);
  @$pb.TagNumber(4)
  void clearConfig() => clearField(4);
  @$pb.TagNumber(4)
  $8.LocalConfig ensureConfig() => $_ensure(3);

  ///
  ///  The ModuleConfig of the node
  @$pb.TagNumber(5)
  $8.LocalModuleConfig get moduleConfig => $_getN(4);
  @$pb.TagNumber(5)
  set moduleConfig($8.LocalModuleConfig v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasModuleConfig() => $_has(4);
  @$pb.TagNumber(5)
  void clearModuleConfig() => clearField(5);
  @$pb.TagNumber(5)
  $8.LocalModuleConfig ensureModuleConfig() => $_ensure(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
