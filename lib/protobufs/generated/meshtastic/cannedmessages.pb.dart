//
//  Generated code. Do not modify.
//  source: meshtastic/cannedmessages.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

///
///  Canned message module configuration.
class CannedMessageModuleConfig extends $pb.GeneratedMessage {
  factory CannedMessageModuleConfig({
    $core.String? messages,
  }) {
    final $result = create();
    if (messages != null) {
      $result.messages = messages;
    }
    return $result;
  }
  CannedMessageModuleConfig._() : super();
  factory CannedMessageModuleConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CannedMessageModuleConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CannedMessageModuleConfig', package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'messages')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CannedMessageModuleConfig clone() => CannedMessageModuleConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CannedMessageModuleConfig copyWith(void Function(CannedMessageModuleConfig) updates) => super.copyWith((message) => updates(message as CannedMessageModuleConfig)) as CannedMessageModuleConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CannedMessageModuleConfig create() => CannedMessageModuleConfig._();
  CannedMessageModuleConfig createEmptyInstance() => create();
  static $pb.PbList<CannedMessageModuleConfig> createRepeated() => $pb.PbList<CannedMessageModuleConfig>();
  @$core.pragma('dart2js:noInline')
  static CannedMessageModuleConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CannedMessageModuleConfig>(create);
  static CannedMessageModuleConfig? _defaultInstance;

  ///
  ///  Predefined messages for canned message module separated by '|' characters.
  @$pb.TagNumber(1)
  $core.String get messages => $_getSZ(0);
  @$pb.TagNumber(1)
  set messages($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessages() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessages() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
