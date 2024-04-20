//
//  Generated code. Do not modify.
//  source: meshtastic/apponly.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'channel.pb.dart' as $3;
import 'config.pb.dart' as $1;

///
///  This is the most compact possible representation for a set of channels.
///  It includes only one PRIMARY channel (which must be first) and
///  any SECONDARY channels.
///  No DISABLED channels are included.
///  This abstraction is used only on the the 'app side' of the world (ie python, javascript and android etc) to show a group of Channels as a (long) URL
class ChannelSet extends $pb.GeneratedMessage {
  factory ChannelSet({
    $core.Iterable<$3.ChannelSettings>? settings,
    $1.Config_LoRaConfig? loraConfig,
  }) {
    final $result = create();
    if (settings != null) {
      $result.settings.addAll(settings);
    }
    if (loraConfig != null) {
      $result.loraConfig = loraConfig;
    }
    return $result;
  }
  ChannelSet._() : super();
  factory ChannelSet.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ChannelSet.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelSet',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..pc<$3.ChannelSettings>(
        1, _omitFieldNames ? '' : 'settings', $pb.PbFieldType.PM,
        subBuilder: $3.ChannelSettings.create)
    ..aOM<$1.Config_LoRaConfig>(2, _omitFieldNames ? '' : 'loraConfig',
        subBuilder: $1.Config_LoRaConfig.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ChannelSet clone() => ChannelSet()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ChannelSet copyWith(void Function(ChannelSet) updates) =>
      super.copyWith((message) => updates(message as ChannelSet)) as ChannelSet;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelSet create() => ChannelSet._();
  ChannelSet createEmptyInstance() => create();
  static $pb.PbList<ChannelSet> createRepeated() => $pb.PbList<ChannelSet>();
  @$core.pragma('dart2js:noInline')
  static ChannelSet getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelSet>(create);
  static ChannelSet? _defaultInstance;

  ///
  ///  Channel list with settings
  @$pb.TagNumber(1)
  $core.List<$3.ChannelSettings> get settings => $_getList(0);

  ///
  ///  LoRa config
  @$pb.TagNumber(2)
  $1.Config_LoRaConfig get loraConfig => $_getN(1);
  @$pb.TagNumber(2)
  set loraConfig($1.Config_LoRaConfig v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLoraConfig() => $_has(1);
  @$pb.TagNumber(2)
  void clearLoraConfig() => clearField(2);
  @$pb.TagNumber(2)
  $1.Config_LoRaConfig ensureLoraConfig() => $_ensure(1);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
