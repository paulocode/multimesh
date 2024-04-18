//
//  Generated code. Do not modify.
//  source: meshtastic/rtttl.proto
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
class RTTTLConfig extends $pb.GeneratedMessage {
  factory RTTTLConfig({
    $core.String? ringtone,
  }) {
    final $result = create();
    if (ringtone != null) {
      $result.ringtone = ringtone;
    }
    return $result;
  }
  RTTTLConfig._() : super();
  factory RTTTLConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RTTTLConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RTTTLConfig', package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ringtone')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RTTTLConfig clone() => RTTTLConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RTTTLConfig copyWith(void Function(RTTTLConfig) updates) => super.copyWith((message) => updates(message as RTTTLConfig)) as RTTTLConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RTTTLConfig create() => RTTTLConfig._();
  RTTTLConfig createEmptyInstance() => create();
  static $pb.PbList<RTTTLConfig> createRepeated() => $pb.PbList<RTTTLConfig>();
  @$core.pragma('dart2js:noInline')
  static RTTTLConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RTTTLConfig>(create);
  static RTTTLConfig? _defaultInstance;

  ///
  ///  Ringtone for PWM Buzzer in RTTTL Format.
  @$pb.TagNumber(1)
  $core.String get ringtone => $_getSZ(0);
  @$pb.TagNumber(1)
  set ringtone($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRingtone() => $_has(0);
  @$pb.TagNumber(1)
  void clearRingtone() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
