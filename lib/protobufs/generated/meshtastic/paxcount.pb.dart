//
//  Generated code. Do not modify.
//  source: meshtastic/paxcount.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

///
///  TODO: REPLACE
class Paxcount extends $pb.GeneratedMessage {
  factory Paxcount({
    $core.int? wifi,
    $core.int? ble,
    $core.int? uptime,
  }) {
    final $result = create();
    if (wifi != null) {
      $result.wifi = wifi;
    }
    if (ble != null) {
      $result.ble = ble;
    }
    if (uptime != null) {
      $result.uptime = uptime;
    }
    return $result;
  }
  Paxcount._() : super();
  factory Paxcount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Paxcount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Paxcount', package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'wifi', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'ble', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'uptime', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Paxcount clone() => Paxcount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Paxcount copyWith(void Function(Paxcount) updates) => super.copyWith((message) => updates(message as Paxcount)) as Paxcount;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Paxcount create() => Paxcount._();
  Paxcount createEmptyInstance() => create();
  static $pb.PbList<Paxcount> createRepeated() => $pb.PbList<Paxcount>();
  @$core.pragma('dart2js:noInline')
  static Paxcount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Paxcount>(create);
  static Paxcount? _defaultInstance;

  ///
  ///  seen Wifi devices
  @$pb.TagNumber(1)
  $core.int get wifi => $_getIZ(0);
  @$pb.TagNumber(1)
  set wifi($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWifi() => $_has(0);
  @$pb.TagNumber(1)
  void clearWifi() => clearField(1);

  ///
  ///  Seen BLE devices
  @$pb.TagNumber(2)
  $core.int get ble => $_getIZ(1);
  @$pb.TagNumber(2)
  set ble($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBle() => $_has(1);
  @$pb.TagNumber(2)
  void clearBle() => clearField(2);

  ///
  ///  Uptime in seconds
  @$pb.TagNumber(3)
  $core.int get uptime => $_getIZ(2);
  @$pb.TagNumber(3)
  set uptime($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUptime() => $_has(2);
  @$pb.TagNumber(3)
  void clearUptime() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
