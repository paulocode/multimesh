//
//  Generated code. Do not modify.
//  source: meshtastic/mqtt.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'mesh.pb.dart' as $6;

///
///  This message wraps a MeshPacket with extra metadata about the sender and how it arrived.
class ServiceEnvelope extends $pb.GeneratedMessage {
  factory ServiceEnvelope({
    $6.MeshPacket? packet,
    $core.String? channelId,
    $core.String? gatewayId,
  }) {
    final $result = create();
    if (packet != null) {
      $result.packet = packet;
    }
    if (channelId != null) {
      $result.channelId = channelId;
    }
    if (gatewayId != null) {
      $result.gatewayId = gatewayId;
    }
    return $result;
  }

  ServiceEnvelope._() : super();

  factory ServiceEnvelope.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory ServiceEnvelope.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ServiceEnvelope',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..aOM<$6.MeshPacket>(1, _omitFieldNames ? '' : 'packet',
        subBuilder: $6.MeshPacket.create)
    ..aOS(2, _omitFieldNames ? '' : 'channelId')
    ..aOS(3, _omitFieldNames ? '' : 'gatewayId')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ServiceEnvelope clone() => ServiceEnvelope()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ServiceEnvelope copyWith(void Function(ServiceEnvelope) updates) =>
      super.copyWith((message) => updates(message as ServiceEnvelope))
          as ServiceEnvelope;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServiceEnvelope create() => ServiceEnvelope._();

  ServiceEnvelope createEmptyInstance() => create();

  static $pb.PbList<ServiceEnvelope> createRepeated() =>
      $pb.PbList<ServiceEnvelope>();

  @$core.pragma('dart2js:noInline')
  static ServiceEnvelope getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ServiceEnvelope>(create);
  static ServiceEnvelope? _defaultInstance;

  ///
  ///  The (probably encrypted) packet
  @$pb.TagNumber(1)
  $6.MeshPacket get packet => $_getN(0);

  @$pb.TagNumber(1)
  set packet($6.MeshPacket v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPacket() => $_has(0);

  @$pb.TagNumber(1)
  void clearPacket() => clearField(1);

  @$pb.TagNumber(1)
  $6.MeshPacket ensurePacket() => $_ensure(0);

  ///
  ///  The global channel ID it was sent on
  @$pb.TagNumber(2)
  $core.String get channelId => $_getSZ(1);

  @$pb.TagNumber(2)
  set channelId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);

  @$pb.TagNumber(2)
  void clearChannelId() => clearField(2);

  ///
  ///  The sending gateway node ID. Can we use this to authenticate/prevent fake
  ///  nodeid impersonation for senders? - i.e. use gateway/mesh id (which is authenticated) + local node id as
  ///  the globally trusted nodenum
  @$pb.TagNumber(3)
  $core.String get gatewayId => $_getSZ(2);

  @$pb.TagNumber(3)
  set gatewayId($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGatewayId() => $_has(2);

  @$pb.TagNumber(3)
  void clearGatewayId() => clearField(3);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
