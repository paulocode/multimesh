//
//  Generated code. Do not modify.
//  source: meshtastic/deviceonly.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'channel.pb.dart' as $3;
import 'deviceonly.pbenum.dart';
import 'localonly.pb.dart' as $8;
import 'mesh.pb.dart' as $6;
import 'mesh.pbenum.dart' as $6;
import 'telemetry.pb.dart' as $0;

export 'deviceonly.pbenum.dart';

///
///  Position with static location information only for NodeDBLite
class PositionLite extends $pb.GeneratedMessage {
  factory PositionLite({
    $core.int? latitudeI,
    $core.int? longitudeI,
    $core.int? altitude,
    $core.int? time,
    $6.Position_LocSource? locationSource,
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
    if (time != null) {
      $result.time = time;
    }
    if (locationSource != null) {
      $result.locationSource = locationSource;
    }
    return $result;
  }
  PositionLite._() : super();
  factory PositionLite.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PositionLite.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PositionLite',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'latitudeI', $pb.PbFieldType.OSF3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'longitudeI', $pb.PbFieldType.OSF3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'altitude', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OF3)
    ..e<$6.Position_LocSource>(
        5, _omitFieldNames ? '' : 'locationSource', $pb.PbFieldType.OE,
        defaultOrMaker: $6.Position_LocSource.LOC_UNSET,
        valueOf: $6.Position_LocSource.valueOf,
        enumValues: $6.Position_LocSource.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PositionLite clone() => PositionLite()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PositionLite copyWith(void Function(PositionLite) updates) =>
      super.copyWith((message) => updates(message as PositionLite))
          as PositionLite;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PositionLite create() => PositionLite._();
  PositionLite createEmptyInstance() => create();
  static $pb.PbList<PositionLite> createRepeated() =>
      $pb.PbList<PositionLite>();
  @$core.pragma('dart2js:noInline')
  static PositionLite getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PositionLite>(create);
  static PositionLite? _defaultInstance;

  ///
  ///  The new preferred location encoding, multiply by 1e-7 to get degrees
  ///  in floating point
  @$pb.TagNumber(1)
  $core.int get latitudeI => $_getIZ(0);
  @$pb.TagNumber(1)
  set latitudeI($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLatitudeI() => $_has(0);
  @$pb.TagNumber(1)
  void clearLatitudeI() => clearField(1);

  ///
  ///  TODO: REPLACE
  @$pb.TagNumber(2)
  $core.int get longitudeI => $_getIZ(1);
  @$pb.TagNumber(2)
  set longitudeI($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLongitudeI() => $_has(1);
  @$pb.TagNumber(2)
  void clearLongitudeI() => clearField(2);

  ///
  ///  In meters above MSL (but see issue #359)
  @$pb.TagNumber(3)
  $core.int get altitude => $_getIZ(2);
  @$pb.TagNumber(3)
  set altitude($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAltitude() => $_has(2);
  @$pb.TagNumber(3)
  void clearAltitude() => clearField(3);

  ///
  ///  This is usually not sent over the mesh (to save space), but it is sent
  ///  from the phone so that the local device can set its RTC If it is sent over
  ///  the mesh (because there are devices on the mesh without GPS), it will only
  ///  be sent by devices which has a hardware GPS clock.
  ///  seconds since 1970
  @$pb.TagNumber(4)
  $core.int get time => $_getIZ(3);
  @$pb.TagNumber(4)
  set time($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearTime() => clearField(4);

  ///
  ///  TODO: REPLACE
  @$pb.TagNumber(5)
  $6.Position_LocSource get locationSource => $_getN(4);
  @$pb.TagNumber(5)
  set locationSource($6.Position_LocSource v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLocationSource() => $_has(4);
  @$pb.TagNumber(5)
  void clearLocationSource() => clearField(5);
}

class NodeInfoLite extends $pb.GeneratedMessage {
  factory NodeInfoLite({
    $core.int? num,
    $6.User? user,
    PositionLite? position,
    $core.double? snr,
    $core.int? lastHeard,
    $0.DeviceMetrics? deviceMetrics,
    $core.int? channel,
    $core.bool? viaMqtt,
    $core.int? hopsAway,
    $core.bool? isFavorite,
  }) {
    final $result = create();
    if (num != null) {
      $result.num = num;
    }
    if (user != null) {
      $result.user = user;
    }
    if (position != null) {
      $result.position = position;
    }
    if (snr != null) {
      $result.snr = snr;
    }
    if (lastHeard != null) {
      $result.lastHeard = lastHeard;
    }
    if (deviceMetrics != null) {
      $result.deviceMetrics = deviceMetrics;
    }
    if (channel != null) {
      $result.channel = channel;
    }
    if (viaMqtt != null) {
      $result.viaMqtt = viaMqtt;
    }
    if (hopsAway != null) {
      $result.hopsAway = hopsAway;
    }
    if (isFavorite != null) {
      $result.isFavorite = isFavorite;
    }
    return $result;
  }
  NodeInfoLite._() : super();
  factory NodeInfoLite.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NodeInfoLite.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NodeInfoLite',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'num', $pb.PbFieldType.OU3)
    ..aOM<$6.User>(2, _omitFieldNames ? '' : 'user', subBuilder: $6.User.create)
    ..aOM<PositionLite>(3, _omitFieldNames ? '' : 'position',
        subBuilder: PositionLite.create)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'snr', $pb.PbFieldType.OF)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'lastHeard', $pb.PbFieldType.OF3)
    ..aOM<$0.DeviceMetrics>(6, _omitFieldNames ? '' : 'deviceMetrics',
        subBuilder: $0.DeviceMetrics.create)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'channel', $pb.PbFieldType.OU3)
    ..aOB(8, _omitFieldNames ? '' : 'viaMqtt')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'hopsAway', $pb.PbFieldType.OU3)
    ..aOB(10, _omitFieldNames ? '' : 'isFavorite')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NodeInfoLite clone() => NodeInfoLite()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NodeInfoLite copyWith(void Function(NodeInfoLite) updates) =>
      super.copyWith((message) => updates(message as NodeInfoLite))
          as NodeInfoLite;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NodeInfoLite create() => NodeInfoLite._();
  NodeInfoLite createEmptyInstance() => create();
  static $pb.PbList<NodeInfoLite> createRepeated() =>
      $pb.PbList<NodeInfoLite>();
  @$core.pragma('dart2js:noInline')
  static NodeInfoLite getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NodeInfoLite>(create);
  static NodeInfoLite? _defaultInstance;

  ///
  ///  The node number
  @$pb.TagNumber(1)
  $core.int get num => $_getIZ(0);
  @$pb.TagNumber(1)
  set num($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearNum() => clearField(1);

  ///
  ///  The user info for this node
  @$pb.TagNumber(2)
  $6.User get user => $_getN(1);
  @$pb.TagNumber(2)
  set user($6.User v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  $6.User ensureUser() => $_ensure(1);

  ///
  ///  This position data. Note: before 1.2.14 we would also store the last time we've heard from this node in position.time, that is no longer true.
  ///  Position.time now indicates the last time we received a POSITION from that node.
  @$pb.TagNumber(3)
  PositionLite get position => $_getN(2);
  @$pb.TagNumber(3)
  set position(PositionLite v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearPosition() => clearField(3);
  @$pb.TagNumber(3)
  PositionLite ensurePosition() => $_ensure(2);

  ///
  ///  Returns the Signal-to-noise ratio (SNR) of the last received message,
  ///  as measured by the receiver. Return SNR of the last received message in dB
  @$pb.TagNumber(4)
  $core.double get snr => $_getN(3);
  @$pb.TagNumber(4)
  set snr($core.double v) {
    $_setFloat(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSnr() => $_has(3);
  @$pb.TagNumber(4)
  void clearSnr() => clearField(4);

  ///
  ///  Set to indicate the last time we received a packet from this node
  @$pb.TagNumber(5)
  $core.int get lastHeard => $_getIZ(4);
  @$pb.TagNumber(5)
  set lastHeard($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLastHeard() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastHeard() => clearField(5);

  ///
  ///  The latest device metrics for the node.
  @$pb.TagNumber(6)
  $0.DeviceMetrics get deviceMetrics => $_getN(5);
  @$pb.TagNumber(6)
  set deviceMetrics($0.DeviceMetrics v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDeviceMetrics() => $_has(5);
  @$pb.TagNumber(6)
  void clearDeviceMetrics() => clearField(6);
  @$pb.TagNumber(6)
  $0.DeviceMetrics ensureDeviceMetrics() => $_ensure(5);

  ///
  ///  local channel index we heard that node on. Only populated if its not the default channel.
  @$pb.TagNumber(7)
  $core.int get channel => $_getIZ(6);
  @$pb.TagNumber(7)
  set channel($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasChannel() => $_has(6);
  @$pb.TagNumber(7)
  void clearChannel() => clearField(7);

  ///
  ///  True if we witnessed the node over MQTT instead of LoRA transport
  @$pb.TagNumber(8)
  $core.bool get viaMqtt => $_getBF(7);
  @$pb.TagNumber(8)
  set viaMqtt($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasViaMqtt() => $_has(7);
  @$pb.TagNumber(8)
  void clearViaMqtt() => clearField(8);

  ///
  ///  Number of hops away from us this node is (0 if adjacent)
  @$pb.TagNumber(9)
  $core.int get hopsAway => $_getIZ(8);
  @$pb.TagNumber(9)
  set hopsAway($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasHopsAway() => $_has(8);
  @$pb.TagNumber(9)
  void clearHopsAway() => clearField(9);

  ///
  ///  True if node is in our favorites list
  ///  Persists between NodeDB internal clean ups
  @$pb.TagNumber(10)
  $core.bool get isFavorite => $_getBF(9);
  @$pb.TagNumber(10)
  set isFavorite($core.bool v) {
    $_setBool(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasIsFavorite() => $_has(9);
  @$pb.TagNumber(10)
  void clearIsFavorite() => clearField(10);
}

///
///  This message is never sent over the wire, but it is used for serializing DB
///  state to flash in the device code
///  FIXME, since we write this each time we enter deep sleep (and have infinite
///  flash) it would be better to use some sort of append only data structure for
///  the receive queue and use the preferences store for the other stuff
class DeviceState extends $pb.GeneratedMessage {
  factory DeviceState({
    $6.MyNodeInfo? myNode,
    $6.User? owner,
    $core.Iterable<$6.MeshPacket>? receiveQueue,
    $6.MeshPacket? rxTextMessage,
    $core.int? version,
    @$core.Deprecated('This field is deprecated.') $core.bool? noSave,
    $core.bool? didGpsReset,
    $6.MeshPacket? rxWaypoint,
    $core.Iterable<$6.NodeRemoteHardwarePin>? nodeRemoteHardwarePins,
    $core.Iterable<NodeInfoLite>? nodeDbLite,
  }) {
    final $result = create();
    if (myNode != null) {
      $result.myNode = myNode;
    }
    if (owner != null) {
      $result.owner = owner;
    }
    if (receiveQueue != null) {
      $result.receiveQueue.addAll(receiveQueue);
    }
    if (rxTextMessage != null) {
      $result.rxTextMessage = rxTextMessage;
    }
    if (version != null) {
      $result.version = version;
    }
    if (noSave != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.noSave = noSave;
    }
    if (didGpsReset != null) {
      $result.didGpsReset = didGpsReset;
    }
    if (rxWaypoint != null) {
      $result.rxWaypoint = rxWaypoint;
    }
    if (nodeRemoteHardwarePins != null) {
      $result.nodeRemoteHardwarePins.addAll(nodeRemoteHardwarePins);
    }
    if (nodeDbLite != null) {
      $result.nodeDbLite.addAll(nodeDbLite);
    }
    return $result;
  }
  DeviceState._() : super();
  factory DeviceState.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DeviceState.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeviceState',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..aOM<$6.MyNodeInfo>(2, _omitFieldNames ? '' : 'myNode',
        subBuilder: $6.MyNodeInfo.create)
    ..aOM<$6.User>(3, _omitFieldNames ? '' : 'owner',
        subBuilder: $6.User.create)
    ..pc<$6.MeshPacket>(
        5, _omitFieldNames ? '' : 'receiveQueue', $pb.PbFieldType.PM,
        subBuilder: $6.MeshPacket.create)
    ..aOM<$6.MeshPacket>(7, _omitFieldNames ? '' : 'rxTextMessage',
        subBuilder: $6.MeshPacket.create)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'version', $pb.PbFieldType.OU3)
    ..aOB(9, _omitFieldNames ? '' : 'noSave')
    ..aOB(11, _omitFieldNames ? '' : 'didGpsReset')
    ..aOM<$6.MeshPacket>(12, _omitFieldNames ? '' : 'rxWaypoint',
        subBuilder: $6.MeshPacket.create)
    ..pc<$6.NodeRemoteHardwarePin>(
        13, _omitFieldNames ? '' : 'nodeRemoteHardwarePins', $pb.PbFieldType.PM,
        subBuilder: $6.NodeRemoteHardwarePin.create)
    ..pc<NodeInfoLite>(
        14, _omitFieldNames ? '' : 'nodeDbLite', $pb.PbFieldType.PM,
        subBuilder: NodeInfoLite.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DeviceState clone() => DeviceState()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DeviceState copyWith(void Function(DeviceState) updates) =>
      super.copyWith((message) => updates(message as DeviceState))
          as DeviceState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceState create() => DeviceState._();
  DeviceState createEmptyInstance() => create();
  static $pb.PbList<DeviceState> createRepeated() => $pb.PbList<DeviceState>();
  @$core.pragma('dart2js:noInline')
  static DeviceState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeviceState>(create);
  static DeviceState? _defaultInstance;

  ///
  ///  Read only settings/info about this node
  @$pb.TagNumber(2)
  $6.MyNodeInfo get myNode => $_getN(0);
  @$pb.TagNumber(2)
  set myNode($6.MyNodeInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMyNode() => $_has(0);
  @$pb.TagNumber(2)
  void clearMyNode() => clearField(2);
  @$pb.TagNumber(2)
  $6.MyNodeInfo ensureMyNode() => $_ensure(0);

  ///
  ///  My owner info
  @$pb.TagNumber(3)
  $6.User get owner => $_getN(1);
  @$pb.TagNumber(3)
  set owner($6.User v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOwner() => $_has(1);
  @$pb.TagNumber(3)
  void clearOwner() => clearField(3);
  @$pb.TagNumber(3)
  $6.User ensureOwner() => $_ensure(1);

  ///
  ///  Received packets saved for delivery to the phone
  @$pb.TagNumber(5)
  $core.List<$6.MeshPacket> get receiveQueue => $_getList(2);

  ///
  ///  We keep the last received text message (only) stored in the device flash,
  ///  so we can show it on the screen.
  ///  Might be null
  @$pb.TagNumber(7)
  $6.MeshPacket get rxTextMessage => $_getN(3);
  @$pb.TagNumber(7)
  set rxTextMessage($6.MeshPacket v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRxTextMessage() => $_has(3);
  @$pb.TagNumber(7)
  void clearRxTextMessage() => clearField(7);
  @$pb.TagNumber(7)
  $6.MeshPacket ensureRxTextMessage() => $_ensure(3);

  ///
  ///  A version integer used to invalidate old save files when we make
  ///  incompatible changes This integer is set at build time and is private to
  ///  NodeDB.cpp in the device code.
  @$pb.TagNumber(8)
  $core.int get version => $_getIZ(4);
  @$pb.TagNumber(8)
  set version($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasVersion() => $_has(4);
  @$pb.TagNumber(8)
  void clearVersion() => clearField(8);

  ///
  ///  Used only during development.
  ///  Indicates developer is testing and changes should never be saved to flash.
  ///  Deprecated in 2.3.1
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  $core.bool get noSave => $_getBF(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  set noSave($core.bool v) {
    $_setBool(5, v);
  }

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  $core.bool hasNoSave() => $_has(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  void clearNoSave() => clearField(9);

  ///
  ///  Some GPS receivers seem to have bogus settings from the factory, so we always do one factory reset.
  @$pb.TagNumber(11)
  $core.bool get didGpsReset => $_getBF(6);
  @$pb.TagNumber(11)
  set didGpsReset($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasDidGpsReset() => $_has(6);
  @$pb.TagNumber(11)
  void clearDidGpsReset() => clearField(11);

  ///
  ///  We keep the last received waypoint stored in the device flash,
  ///  so we can show it on the screen.
  ///  Might be null
  @$pb.TagNumber(12)
  $6.MeshPacket get rxWaypoint => $_getN(7);
  @$pb.TagNumber(12)
  set rxWaypoint($6.MeshPacket v) {
    setField(12, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasRxWaypoint() => $_has(7);
  @$pb.TagNumber(12)
  void clearRxWaypoint() => clearField(12);
  @$pb.TagNumber(12)
  $6.MeshPacket ensureRxWaypoint() => $_ensure(7);

  ///
  ///  The mesh's nodes with their available gpio pins for RemoteHardware module
  @$pb.TagNumber(13)
  $core.List<$6.NodeRemoteHardwarePin> get nodeRemoteHardwarePins =>
      $_getList(8);

  ///
  ///  New lite version of NodeDB to decrease memory footprint
  @$pb.TagNumber(14)
  $core.List<NodeInfoLite> get nodeDbLite => $_getList(9);
}

///
///  The on-disk saved channels
class ChannelFile extends $pb.GeneratedMessage {
  factory ChannelFile({
    $core.Iterable<$3.Channel>? channels,
    $core.int? version,
  }) {
    final $result = create();
    if (channels != null) {
      $result.channels.addAll(channels);
    }
    if (version != null) {
      $result.version = version;
    }
    return $result;
  }
  ChannelFile._() : super();
  factory ChannelFile.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ChannelFile.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelFile',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..pc<$3.Channel>(1, _omitFieldNames ? '' : 'channels', $pb.PbFieldType.PM,
        subBuilder: $3.Channel.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'version', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ChannelFile clone() => ChannelFile()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ChannelFile copyWith(void Function(ChannelFile) updates) =>
      super.copyWith((message) => updates(message as ChannelFile))
          as ChannelFile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelFile create() => ChannelFile._();
  ChannelFile createEmptyInstance() => create();
  static $pb.PbList<ChannelFile> createRepeated() => $pb.PbList<ChannelFile>();
  @$core.pragma('dart2js:noInline')
  static ChannelFile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelFile>(create);
  static ChannelFile? _defaultInstance;

  ///
  ///  The channels our node knows about
  @$pb.TagNumber(1)
  $core.List<$3.Channel> get channels => $_getList(0);

  ///
  ///  A version integer used to invalidate old save files when we make
  ///  incompatible changes This integer is set at build time and is private to
  ///  NodeDB.cpp in the device code.
  @$pb.TagNumber(2)
  $core.int get version => $_getIZ(1);
  @$pb.TagNumber(2)
  set version($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => clearField(2);
}

///
///  This can be used for customizing the firmware distribution. If populated,
///  show a secondary bootup screen with custom logo and text for 2.5 seconds.
class OEMStore extends $pb.GeneratedMessage {
  factory OEMStore({
    $core.int? oemIconWidth,
    $core.int? oemIconHeight,
    $core.List<$core.int>? oemIconBits,
    ScreenFonts? oemFont,
    $core.String? oemText,
    $core.List<$core.int>? oemAesKey,
    $8.LocalConfig? oemLocalConfig,
    $8.LocalModuleConfig? oemLocalModuleConfig,
  }) {
    final $result = create();
    if (oemIconWidth != null) {
      $result.oemIconWidth = oemIconWidth;
    }
    if (oemIconHeight != null) {
      $result.oemIconHeight = oemIconHeight;
    }
    if (oemIconBits != null) {
      $result.oemIconBits = oemIconBits;
    }
    if (oemFont != null) {
      $result.oemFont = oemFont;
    }
    if (oemText != null) {
      $result.oemText = oemText;
    }
    if (oemAesKey != null) {
      $result.oemAesKey = oemAesKey;
    }
    if (oemLocalConfig != null) {
      $result.oemLocalConfig = oemLocalConfig;
    }
    if (oemLocalModuleConfig != null) {
      $result.oemLocalModuleConfig = oemLocalModuleConfig;
    }
    return $result;
  }
  OEMStore._() : super();
  factory OEMStore.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OEMStore.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OEMStore',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1, _omitFieldNames ? '' : 'oemIconWidth', $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2, _omitFieldNames ? '' : 'oemIconHeight', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'oemIconBits', $pb.PbFieldType.OY)
    ..e<ScreenFonts>(4, _omitFieldNames ? '' : 'oemFont', $pb.PbFieldType.OE,
        defaultOrMaker: ScreenFonts.FONT_SMALL,
        valueOf: ScreenFonts.valueOf,
        enumValues: ScreenFonts.values)
    ..aOS(5, _omitFieldNames ? '' : 'oemText')
    ..a<$core.List<$core.int>>(
        6, _omitFieldNames ? '' : 'oemAesKey', $pb.PbFieldType.OY)
    ..aOM<$8.LocalConfig>(7, _omitFieldNames ? '' : 'oemLocalConfig',
        subBuilder: $8.LocalConfig.create)
    ..aOM<$8.LocalModuleConfig>(
        8, _omitFieldNames ? '' : 'oemLocalModuleConfig',
        subBuilder: $8.LocalModuleConfig.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OEMStore clone() => OEMStore()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OEMStore copyWith(void Function(OEMStore) updates) =>
      super.copyWith((message) => updates(message as OEMStore)) as OEMStore;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OEMStore create() => OEMStore._();
  OEMStore createEmptyInstance() => create();
  static $pb.PbList<OEMStore> createRepeated() => $pb.PbList<OEMStore>();
  @$core.pragma('dart2js:noInline')
  static OEMStore getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OEMStore>(create);
  static OEMStore? _defaultInstance;

  ///
  ///  The Logo width in Px
  @$pb.TagNumber(1)
  $core.int get oemIconWidth => $_getIZ(0);
  @$pb.TagNumber(1)
  set oemIconWidth($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOemIconWidth() => $_has(0);
  @$pb.TagNumber(1)
  void clearOemIconWidth() => clearField(1);

  ///
  ///  The Logo height in Px
  @$pb.TagNumber(2)
  $core.int get oemIconHeight => $_getIZ(1);
  @$pb.TagNumber(2)
  set oemIconHeight($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOemIconHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearOemIconHeight() => clearField(2);

  ///
  ///  The Logo in XBM bytechar format
  @$pb.TagNumber(3)
  $core.List<$core.int> get oemIconBits => $_getN(2);
  @$pb.TagNumber(3)
  set oemIconBits($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOemIconBits() => $_has(2);
  @$pb.TagNumber(3)
  void clearOemIconBits() => clearField(3);

  ///
  ///  Use this font for the OEM text.
  @$pb.TagNumber(4)
  ScreenFonts get oemFont => $_getN(3);
  @$pb.TagNumber(4)
  set oemFont(ScreenFonts v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOemFont() => $_has(3);
  @$pb.TagNumber(4)
  void clearOemFont() => clearField(4);

  ///
  ///  Use this font for the OEM text.
  @$pb.TagNumber(5)
  $core.String get oemText => $_getSZ(4);
  @$pb.TagNumber(5)
  set oemText($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOemText() => $_has(4);
  @$pb.TagNumber(5)
  void clearOemText() => clearField(5);

  ///
  ///  The default device encryption key, 16 or 32 byte
  @$pb.TagNumber(6)
  $core.List<$core.int> get oemAesKey => $_getN(5);
  @$pb.TagNumber(6)
  set oemAesKey($core.List<$core.int> v) {
    $_setBytes(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasOemAesKey() => $_has(5);
  @$pb.TagNumber(6)
  void clearOemAesKey() => clearField(6);

  ///
  ///  A Preset LocalConfig to apply during factory reset
  @$pb.TagNumber(7)
  $8.LocalConfig get oemLocalConfig => $_getN(6);
  @$pb.TagNumber(7)
  set oemLocalConfig($8.LocalConfig v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasOemLocalConfig() => $_has(6);
  @$pb.TagNumber(7)
  void clearOemLocalConfig() => clearField(7);
  @$pb.TagNumber(7)
  $8.LocalConfig ensureOemLocalConfig() => $_ensure(6);

  ///
  ///  A Preset LocalModuleConfig to apply during factory reset
  @$pb.TagNumber(8)
  $8.LocalModuleConfig get oemLocalModuleConfig => $_getN(7);
  @$pb.TagNumber(8)
  set oemLocalModuleConfig($8.LocalModuleConfig v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasOemLocalModuleConfig() => $_has(7);
  @$pb.TagNumber(8)
  void clearOemLocalModuleConfig() => clearField(8);
  @$pb.TagNumber(8)
  $8.LocalModuleConfig ensureOemLocalModuleConfig() => $_ensure(7);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
