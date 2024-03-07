//
//  Generated code. Do not modify.
//  source: meshtastic/mesh.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'channel.pb.dart' as $3;
import 'config.pb.dart' as $0;
import 'config.pbenum.dart' as $0;
import 'mesh.pbenum.dart';
import 'module_config.pb.dart' as $1;
import 'portnums.pbenum.dart' as $5;
import 'telemetry.pb.dart' as $2;
import 'xmodem.pb.dart' as $4;

export 'mesh.pbenum.dart';

///
///  a gps position
class Position extends $pb.GeneratedMessage {
  factory Position({
    $core.int? latitudeI,
    $core.int? longitudeI,
    $core.int? altitude,
    $core.int? time,
    Position_LocSource? locationSource,
    Position_AltSource? altitudeSource,
    $core.int? timestamp,
    $core.int? timestampMillisAdjust,
    $core.int? altitudeHae,
    $core.int? altitudeGeoidalSeparation,
    $core.int? pDOP,
    $core.int? hDOP,
    $core.int? vDOP,
    $core.int? gpsAccuracy,
    $core.int? groundSpeed,
    $core.int? groundTrack,
    $core.int? fixQuality,
    $core.int? fixType,
    $core.int? satsInView,
    $core.int? sensorId,
    $core.int? nextUpdate,
    $core.int? seqNumber,
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
    if (altitudeSource != null) {
      $result.altitudeSource = altitudeSource;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (timestampMillisAdjust != null) {
      $result.timestampMillisAdjust = timestampMillisAdjust;
    }
    if (altitudeHae != null) {
      $result.altitudeHae = altitudeHae;
    }
    if (altitudeGeoidalSeparation != null) {
      $result.altitudeGeoidalSeparation = altitudeGeoidalSeparation;
    }
    if (pDOP != null) {
      $result.pDOP = pDOP;
    }
    if (hDOP != null) {
      $result.hDOP = hDOP;
    }
    if (vDOP != null) {
      $result.vDOP = vDOP;
    }
    if (gpsAccuracy != null) {
      $result.gpsAccuracy = gpsAccuracy;
    }
    if (groundSpeed != null) {
      $result.groundSpeed = groundSpeed;
    }
    if (groundTrack != null) {
      $result.groundTrack = groundTrack;
    }
    if (fixQuality != null) {
      $result.fixQuality = fixQuality;
    }
    if (fixType != null) {
      $result.fixType = fixType;
    }
    if (satsInView != null) {
      $result.satsInView = satsInView;
    }
    if (sensorId != null) {
      $result.sensorId = sensorId;
    }
    if (nextUpdate != null) {
      $result.nextUpdate = nextUpdate;
    }
    if (seqNumber != null) {
      $result.seqNumber = seqNumber;
    }
    return $result;
  }

  Position._() : super();

  factory Position.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Position.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Position',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'latitudeI', $pb.PbFieldType.OSF3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'longitudeI', $pb.PbFieldType.OSF3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'altitude', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OF3)
    ..e<Position_LocSource>(
        5, _omitFieldNames ? '' : 'locationSource', $pb.PbFieldType.OE,
        defaultOrMaker: Position_LocSource.LOC_UNSET,
        valueOf: Position_LocSource.valueOf,
        enumValues: Position_LocSource.values)
    ..e<Position_AltSource>(
        6, _omitFieldNames ? '' : 'altitudeSource', $pb.PbFieldType.OE,
        defaultOrMaker: Position_AltSource.ALT_UNSET,
        valueOf: Position_AltSource.valueOf,
        enumValues: Position_AltSource.values)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'timestamp', $pb.PbFieldType.OF3)
    ..a<$core.int>(
        8, _omitFieldNames ? '' : 'timestampMillisAdjust', $pb.PbFieldType.O3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'altitudeHae', $pb.PbFieldType.OS3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'altitudeGeoidalSeparation',
        $pb.PbFieldType.OS3)
    ..a<$core.int>(11, _omitFieldNames ? '' : 'PDOP', $pb.PbFieldType.OU3,
        protoName: 'PDOP')
    ..a<$core.int>(12, _omitFieldNames ? '' : 'HDOP', $pb.PbFieldType.OU3,
        protoName: 'HDOP')
    ..a<$core.int>(13, _omitFieldNames ? '' : 'VDOP', $pb.PbFieldType.OU3,
        protoName: 'VDOP')
    ..a<$core.int>(
        14, _omitFieldNames ? '' : 'gpsAccuracy', $pb.PbFieldType.OU3)
    ..a<$core.int>(
        15, _omitFieldNames ? '' : 'groundSpeed', $pb.PbFieldType.OU3)
    ..a<$core.int>(
        16, _omitFieldNames ? '' : 'groundTrack', $pb.PbFieldType.OU3)
    ..a<$core.int>(17, _omitFieldNames ? '' : 'fixQuality', $pb.PbFieldType.OU3)
    ..a<$core.int>(18, _omitFieldNames ? '' : 'fixType', $pb.PbFieldType.OU3)
    ..a<$core.int>(19, _omitFieldNames ? '' : 'satsInView', $pb.PbFieldType.OU3)
    ..a<$core.int>(20, _omitFieldNames ? '' : 'sensorId', $pb.PbFieldType.OU3)
    ..a<$core.int>(21, _omitFieldNames ? '' : 'nextUpdate', $pb.PbFieldType.OU3)
    ..a<$core.int>(22, _omitFieldNames ? '' : 'seqNumber', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Position clone() => Position()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Position copyWith(void Function(Position) updates) =>
      super.copyWith((message) => updates(message as Position)) as Position;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Position create() => Position._();

  Position createEmptyInstance() => create();

  static $pb.PbList<Position> createRepeated() => $pb.PbList<Position>();

  @$core.pragma('dart2js:noInline')
  static Position getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Position>(create);
  static Position? _defaultInstance;

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
  ///  from the phone so that the local device can set its time if it is sent over
  ///  the mesh (because there are devices on the mesh without GPS or RTC).
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
  Position_LocSource get locationSource => $_getN(4);

  @$pb.TagNumber(5)
  set locationSource(Position_LocSource v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLocationSource() => $_has(4);

  @$pb.TagNumber(5)
  void clearLocationSource() => clearField(5);

  ///
  ///  TODO: REPLACE
  @$pb.TagNumber(6)
  Position_AltSource get altitudeSource => $_getN(5);

  @$pb.TagNumber(6)
  set altitudeSource(Position_AltSource v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAltitudeSource() => $_has(5);

  @$pb.TagNumber(6)
  void clearAltitudeSource() => clearField(6);

  ///
  ///  Positional timestamp (actual timestamp of GPS solution) in integer epoch seconds
  @$pb.TagNumber(7)
  $core.int get timestamp => $_getIZ(6);

  @$pb.TagNumber(7)
  set timestamp($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTimestamp() => $_has(6);

  @$pb.TagNumber(7)
  void clearTimestamp() => clearField(7);

  ///
  ///  Pos. timestamp milliseconds adjustment (rarely available or required)
  @$pb.TagNumber(8)
  $core.int get timestampMillisAdjust => $_getIZ(7);

  @$pb.TagNumber(8)
  set timestampMillisAdjust($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTimestampMillisAdjust() => $_has(7);

  @$pb.TagNumber(8)
  void clearTimestampMillisAdjust() => clearField(8);

  ///
  ///  HAE altitude in meters - can be used instead of MSL altitude
  @$pb.TagNumber(9)
  $core.int get altitudeHae => $_getIZ(8);

  @$pb.TagNumber(9)
  set altitudeHae($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasAltitudeHae() => $_has(8);

  @$pb.TagNumber(9)
  void clearAltitudeHae() => clearField(9);

  ///
  ///  Geoidal separation in meters
  @$pb.TagNumber(10)
  $core.int get altitudeGeoidalSeparation => $_getIZ(9);

  @$pb.TagNumber(10)
  set altitudeGeoidalSeparation($core.int v) {
    $_setSignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasAltitudeGeoidalSeparation() => $_has(9);

  @$pb.TagNumber(10)
  void clearAltitudeGeoidalSeparation() => clearField(10);

  ///
  ///  Horizontal, Vertical and Position Dilution of Precision, in 1/100 units
  ///  - PDOP is sufficient for most cases
  ///  - for higher precision scenarios, HDOP and VDOP can be used instead,
  ///    in which case PDOP becomes redundant (PDOP=sqrt(HDOP^2 + VDOP^2))
  ///  TODO: REMOVE/INTEGRATE
  @$pb.TagNumber(11)
  $core.int get pDOP => $_getIZ(10);

  @$pb.TagNumber(11)
  set pDOP($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasPDOP() => $_has(10);

  @$pb.TagNumber(11)
  void clearPDOP() => clearField(11);

  ///
  ///  TODO: REPLACE
  @$pb.TagNumber(12)
  $core.int get hDOP => $_getIZ(11);

  @$pb.TagNumber(12)
  set hDOP($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasHDOP() => $_has(11);

  @$pb.TagNumber(12)
  void clearHDOP() => clearField(12);

  ///
  ///  TODO: REPLACE
  @$pb.TagNumber(13)
  $core.int get vDOP => $_getIZ(12);

  @$pb.TagNumber(13)
  set vDOP($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasVDOP() => $_has(12);

  @$pb.TagNumber(13)
  void clearVDOP() => clearField(13);

  ///
  ///  GPS accuracy (a hardware specific constant) in mm
  ///    multiplied with DOP to calculate positional accuracy
  ///  Default: "'bout three meters-ish" :)
  @$pb.TagNumber(14)
  $core.int get gpsAccuracy => $_getIZ(13);

  @$pb.TagNumber(14)
  set gpsAccuracy($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasGpsAccuracy() => $_has(13);

  @$pb.TagNumber(14)
  void clearGpsAccuracy() => clearField(14);

  ///
  ///  Ground speed in m/s and True North TRACK in 1/100 degrees
  ///  Clarification of terms:
  ///  - "track" is the direction of motion (measured in horizontal plane)
  ///  - "heading" is where the fuselage points (measured in horizontal plane)
  ///  - "yaw" indicates a relative rotation about the vertical axis
  ///  TODO: REMOVE/INTEGRATE
  @$pb.TagNumber(15)
  $core.int get groundSpeed => $_getIZ(14);

  @$pb.TagNumber(15)
  set groundSpeed($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasGroundSpeed() => $_has(14);

  @$pb.TagNumber(15)
  void clearGroundSpeed() => clearField(15);

  ///
  ///  TODO: REPLACE
  @$pb.TagNumber(16)
  $core.int get groundTrack => $_getIZ(15);

  @$pb.TagNumber(16)
  set groundTrack($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasGroundTrack() => $_has(15);

  @$pb.TagNumber(16)
  void clearGroundTrack() => clearField(16);

  ///
  ///  GPS fix quality (from NMEA GxGGA statement or similar)
  @$pb.TagNumber(17)
  $core.int get fixQuality => $_getIZ(16);

  @$pb.TagNumber(17)
  set fixQuality($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasFixQuality() => $_has(16);

  @$pb.TagNumber(17)
  void clearFixQuality() => clearField(17);

  ///
  ///  GPS fix type 2D/3D (from NMEA GxGSA statement)
  @$pb.TagNumber(18)
  $core.int get fixType => $_getIZ(17);

  @$pb.TagNumber(18)
  set fixType($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasFixType() => $_has(17);

  @$pb.TagNumber(18)
  void clearFixType() => clearField(18);

  ///
  ///  GPS "Satellites in View" number
  @$pb.TagNumber(19)
  $core.int get satsInView => $_getIZ(18);

  @$pb.TagNumber(19)
  set satsInView($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasSatsInView() => $_has(18);

  @$pb.TagNumber(19)
  void clearSatsInView() => clearField(19);

  ///
  ///  Sensor ID - in case multiple positioning sensors are being used
  @$pb.TagNumber(20)
  $core.int get sensorId => $_getIZ(19);

  @$pb.TagNumber(20)
  set sensorId($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasSensorId() => $_has(19);

  @$pb.TagNumber(20)
  void clearSensorId() => clearField(20);

  ///
  ///  Estimated/expected time (in seconds) until next update:
  ///  - if we update at fixed intervals of X seconds, use X
  ///  - if we update at dynamic intervals (based on relative movement etc),
  ///    but "AT LEAST every Y seconds", use Y
  @$pb.TagNumber(21)
  $core.int get nextUpdate => $_getIZ(20);

  @$pb.TagNumber(21)
  set nextUpdate($core.int v) {
    $_setUnsignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasNextUpdate() => $_has(20);

  @$pb.TagNumber(21)
  void clearNextUpdate() => clearField(21);

  ///
  ///  A sequence number, incremented with each Position message to help
  ///    detect lost updates if needed
  @$pb.TagNumber(22)
  $core.int get seqNumber => $_getIZ(21);

  @$pb.TagNumber(22)
  set seqNumber($core.int v) {
    $_setUnsignedInt32(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasSeqNumber() => $_has(21);

  @$pb.TagNumber(22)
  void clearSeqNumber() => clearField(22);
}

///
///  Broadcast when a newly powered mesh node wants to find a node num it can use
///  Sent from the phone over bluetooth to set the user id for the owner of this node.
///  Also sent from nodes to each other when a new node signs on (so all clients can have this info)
///  The algorithm is as follows:
///  when a node starts up, it broadcasts their user and the normal flow is for all
///  other nodes to reply with their User as well (so the new node can build its nodedb)
///  If a node ever receives a User (not just the first broadcast) message where
///  the sender node number equals our node number, that indicates a collision has
///  occurred and the following steps should happen:
///  If the receiving node (that was already in the mesh)'s macaddr is LOWER than the
///  new User who just tried to sign in: it gets to keep its nodenum.
///  We send a broadcast message of OUR User (we use a broadcast so that the other node can
///  receive our message, considering we have the same id - it also serves to let
///  observers correct their nodedb) - this case is rare so it should be okay.
///  If any node receives a User where the macaddr is GTE than their local macaddr,
///  they have been vetoed and should pick a new random nodenum (filtering against
///  whatever it knows about the nodedb) and rebroadcast their User.
///  A few nodenums are reserved and will never be requested:
///  0xff - broadcast
///  0 through 3 - for future use
class User extends $pb.GeneratedMessage {
  factory User({
    $core.String? id,
    $core.String? longName,
    $core.String? shortName,
    @$core.Deprecated('This field is deprecated.')
    $core.List<$core.int>? macaddr,
    HardwareModel? hwModel,
    $core.bool? isLicensed,
    $0.Config_DeviceConfig_Role? role,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (longName != null) {
      $result.longName = longName;
    }
    if (shortName != null) {
      $result.shortName = shortName;
    }
    if (macaddr != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.macaddr = macaddr;
    }
    if (hwModel != null) {
      $result.hwModel = hwModel;
    }
    if (isLicensed != null) {
      $result.isLicensed = isLicensed;
    }
    if (role != null) {
      $result.role = role;
    }
    return $result;
  }

  User._() : super();

  factory User.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory User.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'User',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'longName')
    ..aOS(3, _omitFieldNames ? '' : 'shortName')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'macaddr', $pb.PbFieldType.OY)
    ..e<HardwareModel>(5, _omitFieldNames ? '' : 'hwModel', $pb.PbFieldType.OE,
        defaultOrMaker: HardwareModel.UNSET,
        valueOf: HardwareModel.valueOf,
        enumValues: HardwareModel.values)
    ..aOB(6, _omitFieldNames ? '' : 'isLicensed')
    ..e<$0.Config_DeviceConfig_Role>(
        7, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE,
        defaultOrMaker: $0.Config_DeviceConfig_Role.CLIENT,
        valueOf: $0.Config_DeviceConfig_Role.valueOf,
        enumValues: $0.Config_DeviceConfig_Role.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  User clone() => User()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  User copyWith(void Function(User) updates) =>
      super.copyWith((message) => updates(message as User)) as User;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static User create() => User._();

  User createEmptyInstance() => create();

  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();

  @$core.pragma('dart2js:noInline')
  static User getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

  ///
  ///  A globally unique ID string for this user.
  ///  In the case of Signal that would mean +16504442323, for the default macaddr derived id it would be !<8 hexidecimal bytes>.
  ///  Note: app developers are encouraged to also use the following standard
  ///  node IDs "^all" (for broadcast), "^local" (for the locally connected node)
  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);

  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);

  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  ///
  ///  A full name for this user, i.e. "Kevin Hester"
  @$pb.TagNumber(2)
  $core.String get longName => $_getSZ(1);

  @$pb.TagNumber(2)
  set longName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLongName() => $_has(1);

  @$pb.TagNumber(2)
  void clearLongName() => clearField(2);

  ///
  ///  A VERY short name, ideally two characters.
  ///  Suitable for a tiny OLED screen
  @$pb.TagNumber(3)
  $core.String get shortName => $_getSZ(2);

  @$pb.TagNumber(3)
  set shortName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasShortName() => $_has(2);

  @$pb.TagNumber(3)
  void clearShortName() => clearField(3);

  ///
  ///  Deprecated in Meshtastic 2.1.x
  ///  This is the addr of the radio.
  ///  Not populated by the phone, but added by the esp32 when broadcasting
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.List<$core.int> get macaddr => $_getN(3);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  set macaddr($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.bool hasMacaddr() => $_has(3);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  void clearMacaddr() => clearField(4);

  ///
  ///  TBEAM, HELTEC, etc...
  ///  Starting in 1.2.11 moved to hw_model enum in the NodeInfo object.
  ///  Apps will still need the string here for older builds
  ///  (so OTA update can find the right image), but if the enum is available it will be used instead.
  @$pb.TagNumber(5)
  HardwareModel get hwModel => $_getN(4);

  @$pb.TagNumber(5)
  set hwModel(HardwareModel v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHwModel() => $_has(4);

  @$pb.TagNumber(5)
  void clearHwModel() => clearField(5);

  ///
  ///  In some regions Ham radio operators have different bandwidth limitations than others.
  ///  If this user is a licensed operator, set this flag.
  ///  Also, "long_name" should be their licence number.
  @$pb.TagNumber(6)
  $core.bool get isLicensed => $_getBF(5);

  @$pb.TagNumber(6)
  set isLicensed($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIsLicensed() => $_has(5);

  @$pb.TagNumber(6)
  void clearIsLicensed() => clearField(6);

  ///
  ///  Indicates that the user's role in the mesh
  @$pb.TagNumber(7)
  $0.Config_DeviceConfig_Role get role => $_getN(6);

  @$pb.TagNumber(7)
  set role($0.Config_DeviceConfig_Role v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRole() => $_has(6);

  @$pb.TagNumber(7)
  void clearRole() => clearField(7);
}

///
///  A message used in our Dynamic Source Routing protocol (RFC 4728 based)
class RouteDiscovery extends $pb.GeneratedMessage {
  factory RouteDiscovery({
    $core.Iterable<$core.int>? route,
  }) {
    final $result = create();
    if (route != null) {
      $result.route.addAll(route);
    }
    return $result;
  }

  RouteDiscovery._() : super();

  factory RouteDiscovery.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory RouteDiscovery.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RouteDiscovery',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'route', $pb.PbFieldType.KF3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RouteDiscovery clone() => RouteDiscovery()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RouteDiscovery copyWith(void Function(RouteDiscovery) updates) =>
      super.copyWith((message) => updates(message as RouteDiscovery))
          as RouteDiscovery;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RouteDiscovery create() => RouteDiscovery._();

  RouteDiscovery createEmptyInstance() => create();

  static $pb.PbList<RouteDiscovery> createRepeated() =>
      $pb.PbList<RouteDiscovery>();

  @$core.pragma('dart2js:noInline')
  static RouteDiscovery getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RouteDiscovery>(create);
  static RouteDiscovery? _defaultInstance;

  ///
  ///  The list of nodenums this packet has visited so far
  @$pb.TagNumber(1)
  $core.List<$core.int> get route => $_getList(0);
}

enum Routing_Variant { routeRequest, routeReply, errorReason, notSet }

///
///  A Routing control Data packet handled by the routing module
class Routing extends $pb.GeneratedMessage {
  factory Routing({
    RouteDiscovery? routeRequest,
    RouteDiscovery? routeReply,
    Routing_Error? errorReason,
  }) {
    final $result = create();
    if (routeRequest != null) {
      $result.routeRequest = routeRequest;
    }
    if (routeReply != null) {
      $result.routeReply = routeReply;
    }
    if (errorReason != null) {
      $result.errorReason = errorReason;
    }
    return $result;
  }

  Routing._() : super();

  factory Routing.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Routing.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Routing_Variant> _Routing_VariantByTag = {
    1: Routing_Variant.routeRequest,
    2: Routing_Variant.routeReply,
    3: Routing_Variant.errorReason,
    0: Routing_Variant.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Routing',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<RouteDiscovery>(1, _omitFieldNames ? '' : 'routeRequest',
        subBuilder: RouteDiscovery.create)
    ..aOM<RouteDiscovery>(2, _omitFieldNames ? '' : 'routeReply',
        subBuilder: RouteDiscovery.create)
    ..e<Routing_Error>(
        3, _omitFieldNames ? '' : 'errorReason', $pb.PbFieldType.OE,
        defaultOrMaker: Routing_Error.NONE,
        valueOf: Routing_Error.valueOf,
        enumValues: Routing_Error.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Routing clone() => Routing()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Routing copyWith(void Function(Routing) updates) =>
      super.copyWith((message) => updates(message as Routing)) as Routing;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Routing create() => Routing._();

  Routing createEmptyInstance() => create();

  static $pb.PbList<Routing> createRepeated() => $pb.PbList<Routing>();

  @$core.pragma('dart2js:noInline')
  static Routing getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Routing>(create);
  static Routing? _defaultInstance;

  Routing_Variant whichVariant() => _Routing_VariantByTag[$_whichOneof(0)]!;

  void clearVariant() => clearField($_whichOneof(0));

  ///
  ///  A route request going from the requester
  @$pb.TagNumber(1)
  RouteDiscovery get routeRequest => $_getN(0);

  @$pb.TagNumber(1)
  set routeRequest(RouteDiscovery v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRouteRequest() => $_has(0);

  @$pb.TagNumber(1)
  void clearRouteRequest() => clearField(1);

  @$pb.TagNumber(1)
  RouteDiscovery ensureRouteRequest() => $_ensure(0);

  ///
  ///  A route reply
  @$pb.TagNumber(2)
  RouteDiscovery get routeReply => $_getN(1);

  @$pb.TagNumber(2)
  set routeReply(RouteDiscovery v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRouteReply() => $_has(1);

  @$pb.TagNumber(2)
  void clearRouteReply() => clearField(2);

  @$pb.TagNumber(2)
  RouteDiscovery ensureRouteReply() => $_ensure(1);

  ///
  ///  A failure in delivering a message (usually used for routing control messages, but might be provided
  ///  in addition to ack.fail_id to provide details on the type of failure).
  @$pb.TagNumber(3)
  Routing_Error get errorReason => $_getN(2);

  @$pb.TagNumber(3)
  set errorReason(Routing_Error v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasErrorReason() => $_has(2);

  @$pb.TagNumber(3)
  void clearErrorReason() => clearField(3);
}

///
///  (Formerly called SubPacket)
///  The payload portion fo a packet, this is the actual bytes that are sent
///  inside a radio packet (because from/to are broken out by the comms library)
class Data extends $pb.GeneratedMessage {
  factory Data({
    $5.PortNum? portnum,
    $core.List<$core.int>? payload,
    $core.bool? wantResponse,
    $core.int? dest,
    $core.int? source,
    $core.int? requestId,
    $core.int? replyId,
    $core.int? emoji,
  }) {
    final $result = create();
    if (portnum != null) {
      $result.portnum = portnum;
    }
    if (payload != null) {
      $result.payload = payload;
    }
    if (wantResponse != null) {
      $result.wantResponse = wantResponse;
    }
    if (dest != null) {
      $result.dest = dest;
    }
    if (source != null) {
      $result.source = source;
    }
    if (requestId != null) {
      $result.requestId = requestId;
    }
    if (replyId != null) {
      $result.replyId = replyId;
    }
    if (emoji != null) {
      $result.emoji = emoji;
    }
    return $result;
  }

  Data._() : super();

  factory Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Data',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..e<$5.PortNum>(1, _omitFieldNames ? '' : 'portnum', $pb.PbFieldType.OE,
        defaultOrMaker: $5.PortNum.UNKNOWN_APP,
        valueOf: $5.PortNum.valueOf,
        enumValues: $5.PortNum.values)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'payload', $pb.PbFieldType.OY)
    ..aOB(3, _omitFieldNames ? '' : 'wantResponse')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'dest', $pb.PbFieldType.OF3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'source', $pb.PbFieldType.OF3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'requestId', $pb.PbFieldType.OF3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'replyId', $pb.PbFieldType.OF3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'emoji', $pb.PbFieldType.OF3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Data clone() => Data()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Data copyWith(void Function(Data) updates) =>
      super.copyWith((message) => updates(message as Data)) as Data;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Data create() => Data._();

  Data createEmptyInstance() => create();

  static $pb.PbList<Data> createRepeated() => $pb.PbList<Data>();

  @$core.pragma('dart2js:noInline')
  static Data getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Data>(create);
  static Data? _defaultInstance;

  ///
  ///  Formerly named typ and of type Type
  @$pb.TagNumber(1)
  $5.PortNum get portnum => $_getN(0);

  @$pb.TagNumber(1)
  set portnum($5.PortNum v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPortnum() => $_has(0);

  @$pb.TagNumber(1)
  void clearPortnum() => clearField(1);

  ///
  ///  TODO: REPLACE
  @$pb.TagNumber(2)
  $core.List<$core.int> get payload => $_getN(1);

  @$pb.TagNumber(2)
  set payload($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPayload() => $_has(1);

  @$pb.TagNumber(2)
  void clearPayload() => clearField(2);

  ///
  ///  Not normally used, but for testing a sender can request that recipient
  ///  responds in kind (i.e. if it received a position, it should unicast back it's position).
  ///  Note: that if you set this on a broadcast you will receive many replies.
  @$pb.TagNumber(3)
  $core.bool get wantResponse => $_getBF(2);

  @$pb.TagNumber(3)
  set wantResponse($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasWantResponse() => $_has(2);

  @$pb.TagNumber(3)
  void clearWantResponse() => clearField(3);

  ///
  ///  The address of the destination node.
  ///  This field is is filled in by the mesh radio device software, application
  ///  layer software should never need it.
  ///  RouteDiscovery messages _must_ populate this.
  ///  Other message types might need to if they are doing multihop routing.
  @$pb.TagNumber(4)
  $core.int get dest => $_getIZ(3);

  @$pb.TagNumber(4)
  set dest($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDest() => $_has(3);

  @$pb.TagNumber(4)
  void clearDest() => clearField(4);

  ///
  ///  The address of the original sender for this message.
  ///  This field should _only_ be populated for reliable multihop packets (to keep
  ///  packets small).
  @$pb.TagNumber(5)
  $core.int get source => $_getIZ(4);

  @$pb.TagNumber(5)
  set source($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSource() => $_has(4);

  @$pb.TagNumber(5)
  void clearSource() => clearField(5);

  ///
  ///  Only used in routing or response messages.
  ///  Indicates the original message ID that this message is reporting failure on. (formerly called original_id)
  @$pb.TagNumber(6)
  $core.int get requestId => $_getIZ(5);

  @$pb.TagNumber(6)
  set requestId($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRequestId() => $_has(5);

  @$pb.TagNumber(6)
  void clearRequestId() => clearField(6);

  ///
  ///  If set, this message is intened to be a reply to a previously sent message with the defined id.
  @$pb.TagNumber(7)
  $core.int get replyId => $_getIZ(6);

  @$pb.TagNumber(7)
  set replyId($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasReplyId() => $_has(6);

  @$pb.TagNumber(7)
  void clearReplyId() => clearField(7);

  ///
  ///  Defaults to false. If true, then what is in the payload should be treated as an emoji like giving
  ///  a message a heart or poop emoji.
  @$pb.TagNumber(8)
  $core.int get emoji => $_getIZ(7);

  @$pb.TagNumber(8)
  set emoji($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasEmoji() => $_has(7);

  @$pb.TagNumber(8)
  void clearEmoji() => clearField(8);
}

///
///  Waypoint message, used to share arbitrary locations across the mesh
class Waypoint extends $pb.GeneratedMessage {
  factory Waypoint({
    $core.int? id,
    $core.int? latitudeI,
    $core.int? longitudeI,
    $core.int? expire,
    $core.int? lockedTo,
    $core.String? name,
    $core.String? description,
    $core.int? icon,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (latitudeI != null) {
      $result.latitudeI = latitudeI;
    }
    if (longitudeI != null) {
      $result.longitudeI = longitudeI;
    }
    if (expire != null) {
      $result.expire = expire;
    }
    if (lockedTo != null) {
      $result.lockedTo = lockedTo;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (icon != null) {
      $result.icon = icon;
    }
    return $result;
  }

  Waypoint._() : super();

  factory Waypoint.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Waypoint.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Waypoint',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'latitudeI', $pb.PbFieldType.OSF3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'longitudeI', $pb.PbFieldType.OSF3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'expire', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'lockedTo', $pb.PbFieldType.OU3)
    ..aOS(6, _omitFieldNames ? '' : 'name')
    ..aOS(7, _omitFieldNames ? '' : 'description')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'icon', $pb.PbFieldType.OF3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Waypoint clone() => Waypoint()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Waypoint copyWith(void Function(Waypoint) updates) =>
      super.copyWith((message) => updates(message as Waypoint)) as Waypoint;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Waypoint create() => Waypoint._();

  Waypoint createEmptyInstance() => create();

  static $pb.PbList<Waypoint> createRepeated() => $pb.PbList<Waypoint>();

  @$core.pragma('dart2js:noInline')
  static Waypoint getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Waypoint>(create);
  static Waypoint? _defaultInstance;

  ///
  ///  Id of the waypoint
  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);

  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);

  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  ///
  ///  latitude_i
  @$pb.TagNumber(2)
  $core.int get latitudeI => $_getIZ(1);

  @$pb.TagNumber(2)
  set latitudeI($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLatitudeI() => $_has(1);

  @$pb.TagNumber(2)
  void clearLatitudeI() => clearField(2);

  ///
  ///  longitude_i
  @$pb.TagNumber(3)
  $core.int get longitudeI => $_getIZ(2);

  @$pb.TagNumber(3)
  set longitudeI($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLongitudeI() => $_has(2);

  @$pb.TagNumber(3)
  void clearLongitudeI() => clearField(3);

  ///
  ///  Time the waypoint is to expire (epoch)
  @$pb.TagNumber(4)
  $core.int get expire => $_getIZ(3);

  @$pb.TagNumber(4)
  set expire($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasExpire() => $_has(3);

  @$pb.TagNumber(4)
  void clearExpire() => clearField(4);

  ///
  ///  If greater than zero, treat the value as a nodenum only allowing them to update the waypoint.
  ///  If zero, the waypoint is open to be edited by any member of the mesh.
  @$pb.TagNumber(5)
  $core.int get lockedTo => $_getIZ(4);

  @$pb.TagNumber(5)
  set lockedTo($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLockedTo() => $_has(4);

  @$pb.TagNumber(5)
  void clearLockedTo() => clearField(5);

  ///
  ///  Name of the waypoint - max 30 chars
  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);

  @$pb.TagNumber(6)
  set name($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);

  @$pb.TagNumber(6)
  void clearName() => clearField(6);

  ///
  ///  Description of the waypoint - max 100 chars
  @$pb.TagNumber(7)
  $core.String get description => $_getSZ(6);

  @$pb.TagNumber(7)
  set description($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasDescription() => $_has(6);

  @$pb.TagNumber(7)
  void clearDescription() => clearField(7);

  ///
  ///  Designator icon for the waypoint in the form of a unicode emoji
  @$pb.TagNumber(8)
  $core.int get icon => $_getIZ(7);

  @$pb.TagNumber(8)
  set icon($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasIcon() => $_has(7);

  @$pb.TagNumber(8)
  void clearIcon() => clearField(8);
}

enum MqttClientProxyMessage_PayloadVariant { data, text, notSet }

///
///  This message will be proxied over the PhoneAPI for the client to deliver to the MQTT server
class MqttClientProxyMessage extends $pb.GeneratedMessage {
  factory MqttClientProxyMessage({
    $core.String? topic,
    $core.List<$core.int>? data,
    $core.String? text,
    $core.bool? retained,
  }) {
    final $result = create();
    if (topic != null) {
      $result.topic = topic;
    }
    if (data != null) {
      $result.data = data;
    }
    if (text != null) {
      $result.text = text;
    }
    if (retained != null) {
      $result.retained = retained;
    }
    return $result;
  }

  MqttClientProxyMessage._() : super();

  factory MqttClientProxyMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory MqttClientProxyMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, MqttClientProxyMessage_PayloadVariant>
      _MqttClientProxyMessage_PayloadVariantByTag = {
    2: MqttClientProxyMessage_PayloadVariant.data,
    3: MqttClientProxyMessage_PayloadVariant.text,
    0: MqttClientProxyMessage_PayloadVariant.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MqttClientProxyMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..aOS(1, _omitFieldNames ? '' : 'topic')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'text')
    ..aOB(4, _omitFieldNames ? '' : 'retained')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MqttClientProxyMessage clone() =>
      MqttClientProxyMessage()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MqttClientProxyMessage copyWith(
          void Function(MqttClientProxyMessage) updates) =>
      super.copyWith((message) => updates(message as MqttClientProxyMessage))
          as MqttClientProxyMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MqttClientProxyMessage create() => MqttClientProxyMessage._();

  MqttClientProxyMessage createEmptyInstance() => create();

  static $pb.PbList<MqttClientProxyMessage> createRepeated() =>
      $pb.PbList<MqttClientProxyMessage>();

  @$core.pragma('dart2js:noInline')
  static MqttClientProxyMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MqttClientProxyMessage>(create);
  static MqttClientProxyMessage? _defaultInstance;

  MqttClientProxyMessage_PayloadVariant whichPayloadVariant() =>
      _MqttClientProxyMessage_PayloadVariantByTag[$_whichOneof(0)]!;

  void clearPayloadVariant() => clearField($_whichOneof(0));

  ///
  ///  The MQTT topic this message will be sent /received on
  @$pb.TagNumber(1)
  $core.String get topic => $_getSZ(0);

  @$pb.TagNumber(1)
  set topic($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTopic() => $_has(0);

  @$pb.TagNumber(1)
  void clearTopic() => clearField(1);

  ///
  ///  Bytes
  @$pb.TagNumber(2)
  $core.List<$core.int> get data => $_getN(1);

  @$pb.TagNumber(2)
  set data($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);

  @$pb.TagNumber(2)
  void clearData() => clearField(2);

  ///
  ///  Text
  @$pb.TagNumber(3)
  $core.String get text => $_getSZ(2);

  @$pb.TagNumber(3)
  set text($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasText() => $_has(2);

  @$pb.TagNumber(3)
  void clearText() => clearField(3);

  ///
  ///  Whether the message should be retained (or not)
  @$pb.TagNumber(4)
  $core.bool get retained => $_getBF(3);

  @$pb.TagNumber(4)
  set retained($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRetained() => $_has(3);

  @$pb.TagNumber(4)
  void clearRetained() => clearField(4);
}

enum MeshPacket_PayloadVariant { decoded, encrypted, notSet }

///
///  A packet envelope sent/received over the mesh
///  only payload_variant is sent in the payload portion of the LORA packet.
///  The other fields are either not sent at all, or sent in the special 16 byte LORA header.
class MeshPacket extends $pb.GeneratedMessage {
  factory MeshPacket({
    $core.int? from,
    $core.int? to,
    $core.int? channel,
    Data? decoded,
    $core.List<$core.int>? encrypted,
    $core.int? id,
    $core.int? rxTime,
    $core.double? rxSnr,
    $core.int? hopLimit,
    $core.bool? wantAck,
    MeshPacket_Priority? priority,
    $core.int? rxRssi,
    @$core.Deprecated('This field is deprecated.') MeshPacket_Delayed? delayed,
  }) {
    final $result = create();
    if (from != null) {
      $result.from = from;
    }
    if (to != null) {
      $result.to = to;
    }
    if (channel != null) {
      $result.channel = channel;
    }
    if (decoded != null) {
      $result.decoded = decoded;
    }
    if (encrypted != null) {
      $result.encrypted = encrypted;
    }
    if (id != null) {
      $result.id = id;
    }
    if (rxTime != null) {
      $result.rxTime = rxTime;
    }
    if (rxSnr != null) {
      $result.rxSnr = rxSnr;
    }
    if (hopLimit != null) {
      $result.hopLimit = hopLimit;
    }
    if (wantAck != null) {
      $result.wantAck = wantAck;
    }
    if (priority != null) {
      $result.priority = priority;
    }
    if (rxRssi != null) {
      $result.rxRssi = rxRssi;
    }
    if (delayed != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.delayed = delayed;
    }
    return $result;
  }

  MeshPacket._() : super();

  factory MeshPacket.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory MeshPacket.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, MeshPacket_PayloadVariant>
      _MeshPacket_PayloadVariantByTag = {
    4: MeshPacket_PayloadVariant.decoded,
    5: MeshPacket_PayloadVariant.encrypted,
    0: MeshPacket_PayloadVariant.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MeshPacket',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..oo(0, [4, 5])
    ..a<$core.int>(1, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OF3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'to', $pb.PbFieldType.OF3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'channel', $pb.PbFieldType.OU3)
    ..aOM<Data>(4, _omitFieldNames ? '' : 'decoded', subBuilder: Data.create)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'encrypted', $pb.PbFieldType.OY)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OF3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'rxTime', $pb.PbFieldType.OF3)
    ..a<$core.double>(8, _omitFieldNames ? '' : 'rxSnr', $pb.PbFieldType.OF)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'hopLimit', $pb.PbFieldType.OU3)
    ..aOB(10, _omitFieldNames ? '' : 'wantAck')
    ..e<MeshPacket_Priority>(
        11, _omitFieldNames ? '' : 'priority', $pb.PbFieldType.OE,
        defaultOrMaker: MeshPacket_Priority.UNSET,
        valueOf: MeshPacket_Priority.valueOf,
        enumValues: MeshPacket_Priority.values)
    ..a<$core.int>(12, _omitFieldNames ? '' : 'rxRssi', $pb.PbFieldType.O3)
    ..e<MeshPacket_Delayed>(
        13, _omitFieldNames ? '' : 'delayed', $pb.PbFieldType.OE,
        defaultOrMaker: MeshPacket_Delayed.NO_DELAY,
        valueOf: MeshPacket_Delayed.valueOf,
        enumValues: MeshPacket_Delayed.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MeshPacket clone() => MeshPacket()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MeshPacket copyWith(void Function(MeshPacket) updates) =>
      super.copyWith((message) => updates(message as MeshPacket)) as MeshPacket;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MeshPacket create() => MeshPacket._();

  MeshPacket createEmptyInstance() => create();

  static $pb.PbList<MeshPacket> createRepeated() => $pb.PbList<MeshPacket>();

  @$core.pragma('dart2js:noInline')
  static MeshPacket getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MeshPacket>(create);
  static MeshPacket? _defaultInstance;

  MeshPacket_PayloadVariant whichPayloadVariant() =>
      _MeshPacket_PayloadVariantByTag[$_whichOneof(0)]!;

  void clearPayloadVariant() => clearField($_whichOneof(0));

  ///
  ///  The sending node number.
  ///  Note: Our crypto implementation uses this field as well.
  ///  See [crypto](/docs/overview/encryption) for details.
  ///  FIXME - really should be fixed32 instead, this encoding only hurts the ble link though.
  @$pb.TagNumber(1)
  $core.int get from => $_getIZ(0);

  @$pb.TagNumber(1)
  set from($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);

  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);

  ///
  ///  The (immediatSee Priority description for more details.y should be fixed32 instead, this encoding only
  ///  hurts the ble link though.
  @$pb.TagNumber(2)
  $core.int get to => $_getIZ(1);

  @$pb.TagNumber(2)
  set to($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);

  @$pb.TagNumber(2)
  void clearTo() => clearField(2);

  ///
  ///  (Usually) If set, this indicates the index in the secondary_channels table that this packet was sent/received on.
  ///  If unset, packet was on the primary channel.
  ///  A particular node might know only a subset of channels in use on the mesh.
  ///  Therefore channel_index is inherently a local concept and meaningless to send between nodes.
  ///  Very briefly, while sending and receiving deep inside the device Router code, this field instead
  ///  contains the 'channel hash' instead of the index.
  ///  This 'trick' is only used while the payload_variant is an 'encrypted'.
  @$pb.TagNumber(3)
  $core.int get channel => $_getIZ(2);

  @$pb.TagNumber(3)
  set channel($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasChannel() => $_has(2);

  @$pb.TagNumber(3)
  void clearChannel() => clearField(3);

  ///
  ///  TODO: REPLACE
  @$pb.TagNumber(4)
  Data get decoded => $_getN(3);

  @$pb.TagNumber(4)
  set decoded(Data v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDecoded() => $_has(3);

  @$pb.TagNumber(4)
  void clearDecoded() => clearField(4);

  @$pb.TagNumber(4)
  Data ensureDecoded() => $_ensure(3);

  ///
  ///  TODO: REPLACE
  @$pb.TagNumber(5)
  $core.List<$core.int> get encrypted => $_getN(4);

  @$pb.TagNumber(5)
  set encrypted($core.List<$core.int> v) {
    $_setBytes(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasEncrypted() => $_has(4);

  @$pb.TagNumber(5)
  void clearEncrypted() => clearField(5);

  ///
  ///  A unique ID for this packet.
  ///  Always 0 for no-ack packets or non broadcast packets (and therefore take zero bytes of space).
  ///  Otherwise a unique ID for this packet, useful for flooding algorithms.
  ///  ID only needs to be unique on a _per sender_ basis, and it only
  ///  needs to be unique for a few minutes (long enough to last for the length of
  ///  any ACK or the completion of a mesh broadcast flood).
  ///  Note: Our crypto implementation uses this id as well.
  ///  See [crypto](/docs/overview/encryption) for details.
  ///  FIXME - really should be fixed32 instead, this encoding only
  ///  hurts the ble link though.
  @$pb.TagNumber(6)
  $core.int get id => $_getIZ(5);

  @$pb.TagNumber(6)
  set id($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasId() => $_has(5);

  @$pb.TagNumber(6)
  void clearId() => clearField(6);

  ///
  ///  The time this message was received by the esp32 (secs since 1970).
  ///  Note: this field is _never_ sent on the radio link itself (to save space) Times
  ///  are typically not sent over the mesh, but they will be added to any Packet
  ///  (chain of SubPacket) sent to the phone (so the phone can know exact time of reception)
  @$pb.TagNumber(7)
  $core.int get rxTime => $_getIZ(6);

  @$pb.TagNumber(7)
  set rxTime($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRxTime() => $_has(6);

  @$pb.TagNumber(7)
  void clearRxTime() => clearField(7);

  ///
  ///  *Never* sent over the radio links.
  ///  Set during reception to indicate the SNR of this packet.
  ///  Used to collect statistics on current link quality.
  @$pb.TagNumber(8)
  $core.double get rxSnr => $_getN(7);

  @$pb.TagNumber(8)
  set rxSnr($core.double v) {
    $_setFloat(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasRxSnr() => $_has(7);

  @$pb.TagNumber(8)
  void clearRxSnr() => clearField(8);

  ///
  ///  If unset treated as zero (no forwarding, send to adjacent nodes only)
  ///  if 1, allow hopping through one node, etc...
  ///  For our usecase real world topologies probably have a max of about 3.
  ///  This field is normally placed into a few of bits in the header.
  @$pb.TagNumber(9)
  $core.int get hopLimit => $_getIZ(8);

  @$pb.TagNumber(9)
  set hopLimit($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasHopLimit() => $_has(8);

  @$pb.TagNumber(9)
  void clearHopLimit() => clearField(9);

  ///
  ///  This packet is being sent as a reliable message, we would prefer it to arrive at the destination.
  ///  We would like to receive a ack packet in response.
  ///  Broadcasts messages treat this flag specially: Since acks for broadcasts would
  ///  rapidly flood the channel, the normal ack behavior is suppressed.
  ///  Instead, the original sender listens to see if at least one node is rebroadcasting this packet (because naive flooding algorithm).
  ///  If it hears that the odds (given typical LoRa topologies) the odds are very high that every node should eventually receive the message.
  ///  So FloodingRouter.cpp generates an implicit ack which is delivered to the original sender.
  ///  If after some time we don't hear anyone rebroadcast our packet, we will timeout and retransmit, using the regular resend logic.
  ///  Note: This flag is normally sent in a flag bit in the header when sent over the wire
  @$pb.TagNumber(10)
  $core.bool get wantAck => $_getBF(9);

  @$pb.TagNumber(10)
  set wantAck($core.bool v) {
    $_setBool(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasWantAck() => $_has(9);

  @$pb.TagNumber(10)
  void clearWantAck() => clearField(10);

  ///
  ///  The priority of this message for sending.
  ///  See MeshPacket.Priority description for more details.
  @$pb.TagNumber(11)
  MeshPacket_Priority get priority => $_getN(10);

  @$pb.TagNumber(11)
  set priority(MeshPacket_Priority v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasPriority() => $_has(10);

  @$pb.TagNumber(11)
  void clearPriority() => clearField(11);

  ///
  ///  rssi of received packet. Only sent to phone for dispay purposes.
  @$pb.TagNumber(12)
  $core.int get rxRssi => $_getIZ(11);

  @$pb.TagNumber(12)
  set rxRssi($core.int v) {
    $_setSignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasRxRssi() => $_has(11);

  @$pb.TagNumber(12)
  void clearRxRssi() => clearField(12);

  ///
  ///  Describe if this message is delayed
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(13)
  MeshPacket_Delayed get delayed => $_getN(12);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(13)
  set delayed(MeshPacket_Delayed v) {
    setField(13, v);
  }

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(13)
  $core.bool hasDelayed() => $_has(12);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(13)
  void clearDelayed() => clearField(13);
}

///
///  The bluetooth to device link:
///  Old BTLE protocol docs from TODO, merge in above and make real docs...
///  use protocol buffers, and NanoPB
///  messages from device to phone:
///  POSITION_UPDATE (..., time)
///  TEXT_RECEIVED(from, text, time)
///  OPAQUE_RECEIVED(from, payload, time) (for signal messages or other applications)
///  messages from phone to device:
///  SET_MYID(id, human readable long, human readable short) (send down the unique ID
///  string used for this node, a human readable string shown for that id, and a very
///  short human readable string suitable for oled screen) SEND_OPAQUE(dest, payload)
///  (for signal messages or other applications) SEND_TEXT(dest, text) Get all
///  nodes() (returns list of nodes, with full info, last time seen, loc, battery
///  level etc) SET_CONFIG (switches device to a new set of radio params and
///  preshared key, drops all existing nodes, force our node to rejoin this new group)
///  Full information about a node on the mesh
class NodeInfo extends $pb.GeneratedMessage {
  factory NodeInfo({
    $core.int? num,
    User? user,
    Position? position,
    $core.double? snr,
    $core.int? lastHeard,
    $2.DeviceMetrics? deviceMetrics,
    $core.int? channel,
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
    return $result;
  }

  NodeInfo._() : super();

  factory NodeInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory NodeInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NodeInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'num', $pb.PbFieldType.OU3)
    ..aOM<User>(2, _omitFieldNames ? '' : 'user', subBuilder: User.create)
    ..aOM<Position>(3, _omitFieldNames ? '' : 'position',
        subBuilder: Position.create)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'snr', $pb.PbFieldType.OF)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'lastHeard', $pb.PbFieldType.OF3)
    ..aOM<$2.DeviceMetrics>(6, _omitFieldNames ? '' : 'deviceMetrics',
        subBuilder: $2.DeviceMetrics.create)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'channel', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NodeInfo clone() => NodeInfo()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NodeInfo copyWith(void Function(NodeInfo) updates) =>
      super.copyWith((message) => updates(message as NodeInfo)) as NodeInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NodeInfo create() => NodeInfo._();

  NodeInfo createEmptyInstance() => create();

  static $pb.PbList<NodeInfo> createRepeated() => $pb.PbList<NodeInfo>();

  @$core.pragma('dart2js:noInline')
  static NodeInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NodeInfo>(create);
  static NodeInfo? _defaultInstance;

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
  User get user => $_getN(1);

  @$pb.TagNumber(2)
  set user(User v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);

  @$pb.TagNumber(2)
  void clearUser() => clearField(2);

  @$pb.TagNumber(2)
  User ensureUser() => $_ensure(1);

  ///
  ///  This position data. Note: before 1.2.14 we would also store the last time we've heard from this node in position.time, that is no longer true.
  ///  Position.time now indicates the last time we received a POSITION from that node.
  @$pb.TagNumber(3)
  Position get position => $_getN(2);

  @$pb.TagNumber(3)
  set position(Position v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPosition() => $_has(2);

  @$pb.TagNumber(3)
  void clearPosition() => clearField(3);

  @$pb.TagNumber(3)
  Position ensurePosition() => $_ensure(2);

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
  $2.DeviceMetrics get deviceMetrics => $_getN(5);

  @$pb.TagNumber(6)
  set deviceMetrics($2.DeviceMetrics v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDeviceMetrics() => $_has(5);

  @$pb.TagNumber(6)
  void clearDeviceMetrics() => clearField(6);

  @$pb.TagNumber(6)
  $2.DeviceMetrics ensureDeviceMetrics() => $_ensure(5);

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
}

///
///  Unique local debugging info for this node
///  Note: we don't include position or the user info, because that will come in the
///  Sent to the phone in response to WantNodes.
class MyNodeInfo extends $pb.GeneratedMessage {
  factory MyNodeInfo({
    $core.int? myNodeNum,
    $core.int? rebootCount,
    $core.int? minAppVersion,
  }) {
    final $result = create();
    if (myNodeNum != null) {
      $result.myNodeNum = myNodeNum;
    }
    if (rebootCount != null) {
      $result.rebootCount = rebootCount;
    }
    if (minAppVersion != null) {
      $result.minAppVersion = minAppVersion;
    }
    return $result;
  }

  MyNodeInfo._() : super();

  factory MyNodeInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory MyNodeInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MyNodeInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'myNodeNum', $pb.PbFieldType.OU3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'rebootCount', $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11, _omitFieldNames ? '' : 'minAppVersion', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MyNodeInfo clone() => MyNodeInfo()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MyNodeInfo copyWith(void Function(MyNodeInfo) updates) =>
      super.copyWith((message) => updates(message as MyNodeInfo)) as MyNodeInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MyNodeInfo create() => MyNodeInfo._();

  MyNodeInfo createEmptyInstance() => create();

  static $pb.PbList<MyNodeInfo> createRepeated() => $pb.PbList<MyNodeInfo>();

  @$core.pragma('dart2js:noInline')
  static MyNodeInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MyNodeInfo>(create);
  static MyNodeInfo? _defaultInstance;

  ///
  ///  Tells the phone what our node number is, default starting value is
  ///  lowbyte of macaddr, but it will be fixed if that is already in use
  @$pb.TagNumber(1)
  $core.int get myNodeNum => $_getIZ(0);

  @$pb.TagNumber(1)
  set myNodeNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMyNodeNum() => $_has(0);

  @$pb.TagNumber(1)
  void clearMyNodeNum() => clearField(1);

  ///
  ///  The total number of reboots this node has ever encountered
  ///  (well - since the last time we discarded preferences)
  @$pb.TagNumber(8)
  $core.int get rebootCount => $_getIZ(1);

  @$pb.TagNumber(8)
  set rebootCount($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasRebootCount() => $_has(1);

  @$pb.TagNumber(8)
  void clearRebootCount() => clearField(8);

  ///
  ///  The minimum app version that can talk to this device.
  ///  Phone/PC apps should compare this to their build number and if too low tell the user they must update their app
  @$pb.TagNumber(11)
  $core.int get minAppVersion => $_getIZ(2);

  @$pb.TagNumber(11)
  set minAppVersion($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasMinAppVersion() => $_has(2);

  @$pb.TagNumber(11)
  void clearMinAppVersion() => clearField(11);
}

///
///  Debug output from the device.
///  To minimize the size of records inside the device code, if a time/source/level is not set
///  on the message it is assumed to be a continuation of the previously sent message.
///  This allows the device code to use fixed maxlen 64 byte strings for messages,
///  and then extend as needed by emitting multiple records.
class LogRecord extends $pb.GeneratedMessage {
  factory LogRecord({
    $core.String? message,
    $core.int? time,
    $core.String? source,
    LogRecord_Level? level,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    if (time != null) {
      $result.time = time;
    }
    if (source != null) {
      $result.source = source;
    }
    if (level != null) {
      $result.level = level;
    }
    return $result;
  }

  LogRecord._() : super();

  factory LogRecord.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory LogRecord.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LogRecord',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OF3)
    ..aOS(3, _omitFieldNames ? '' : 'source')
    ..e<LogRecord_Level>(4, _omitFieldNames ? '' : 'level', $pb.PbFieldType.OE,
        defaultOrMaker: LogRecord_Level.UNSET,
        valueOf: LogRecord_Level.valueOf,
        enumValues: LogRecord_Level.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LogRecord clone() => LogRecord()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LogRecord copyWith(void Function(LogRecord) updates) =>
      super.copyWith((message) => updates(message as LogRecord)) as LogRecord;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogRecord create() => LogRecord._();

  LogRecord createEmptyInstance() => create();

  static $pb.PbList<LogRecord> createRepeated() => $pb.PbList<LogRecord>();

  @$core.pragma('dart2js:noInline')
  static LogRecord getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogRecord>(create);
  static LogRecord? _defaultInstance;

  ///
  ///  Log levels, chosen to match python logging conventions.
  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);

  @$pb.TagNumber(1)
  set message($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);

  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  ///
  ///  Seconds since 1970 - or 0 for unknown/unset
  @$pb.TagNumber(2)
  $core.int get time => $_getIZ(1);

  @$pb.TagNumber(2)
  set time($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTime() => $_has(1);

  @$pb.TagNumber(2)
  void clearTime() => clearField(2);

  ///
  ///  Usually based on thread name - if known
  @$pb.TagNumber(3)
  $core.String get source => $_getSZ(2);

  @$pb.TagNumber(3)
  set source($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSource() => $_has(2);

  @$pb.TagNumber(3)
  void clearSource() => clearField(3);

  ///
  ///  Not yet set
  @$pb.TagNumber(4)
  LogRecord_Level get level => $_getN(3);

  @$pb.TagNumber(4)
  set level(LogRecord_Level v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);

  @$pb.TagNumber(4)
  void clearLevel() => clearField(4);
}

class QueueStatus extends $pb.GeneratedMessage {
  factory QueueStatus({
    $core.int? res,
    $core.int? free,
    $core.int? maxlen,
    $core.int? meshPacketId,
  }) {
    final $result = create();
    if (res != null) {
      $result.res = res;
    }
    if (free != null) {
      $result.free = free;
    }
    if (maxlen != null) {
      $result.maxlen = maxlen;
    }
    if (meshPacketId != null) {
      $result.meshPacketId = meshPacketId;
    }
    return $result;
  }

  QueueStatus._() : super();

  factory QueueStatus.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory QueueStatus.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueueStatus',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'res', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'free', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'maxlen', $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4, _omitFieldNames ? '' : 'meshPacketId', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  QueueStatus clone() => QueueStatus()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  QueueStatus copyWith(void Function(QueueStatus) updates) =>
      super.copyWith((message) => updates(message as QueueStatus))
          as QueueStatus;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueueStatus create() => QueueStatus._();

  QueueStatus createEmptyInstance() => create();

  static $pb.PbList<QueueStatus> createRepeated() => $pb.PbList<QueueStatus>();

  @$core.pragma('dart2js:noInline')
  static QueueStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueueStatus>(create);
  static QueueStatus? _defaultInstance;

  /// Last attempt to queue status, ErrorCode
  @$pb.TagNumber(1)
  $core.int get res => $_getIZ(0);

  @$pb.TagNumber(1)
  set res($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRes() => $_has(0);

  @$pb.TagNumber(1)
  void clearRes() => clearField(1);

  /// Free entries in the outgoing queue
  @$pb.TagNumber(2)
  $core.int get free => $_getIZ(1);

  @$pb.TagNumber(2)
  set free($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFree() => $_has(1);

  @$pb.TagNumber(2)
  void clearFree() => clearField(2);

  /// Maximum entries in the outgoing queue
  @$pb.TagNumber(3)
  $core.int get maxlen => $_getIZ(2);

  @$pb.TagNumber(3)
  set maxlen($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMaxlen() => $_has(2);

  @$pb.TagNumber(3)
  void clearMaxlen() => clearField(3);

  /// What was mesh packet id that generated this response?
  @$pb.TagNumber(4)
  $core.int get meshPacketId => $_getIZ(3);

  @$pb.TagNumber(4)
  set meshPacketId($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMeshPacketId() => $_has(3);

  @$pb.TagNumber(4)
  void clearMeshPacketId() => clearField(4);
}

enum FromRadio_PayloadVariant {
  packet,
  myInfo,
  nodeInfo,
  config,
  logRecord,
  configCompleteId,
  rebooted,
  moduleConfig,
  channel,
  queueStatus,
  xmodemPacket,
  metadata,
  mqttClientProxyMessage,
  notSet
}

///
///  Packets from the radio to the phone will appear on the fromRadio characteristic.
///  It will support READ and NOTIFY. When a new packet arrives the device will BLE notify?
///  It will sit in that descriptor until consumed by the phone,
///  at which point the next item in the FIFO will be populated.
class FromRadio extends $pb.GeneratedMessage {
  factory FromRadio({
    $core.int? id,
    MeshPacket? packet,
    MyNodeInfo? myInfo,
    NodeInfo? nodeInfo,
    $0.Config? config,
    LogRecord? logRecord,
    $core.int? configCompleteId,
    $core.bool? rebooted,
    $1.ModuleConfig? moduleConfig,
    $3.Channel? channel,
    QueueStatus? queueStatus,
    $4.XModem? xmodemPacket,
    DeviceMetadata? metadata,
    MqttClientProxyMessage? mqttClientProxyMessage,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (packet != null) {
      $result.packet = packet;
    }
    if (myInfo != null) {
      $result.myInfo = myInfo;
    }
    if (nodeInfo != null) {
      $result.nodeInfo = nodeInfo;
    }
    if (config != null) {
      $result.config = config;
    }
    if (logRecord != null) {
      $result.logRecord = logRecord;
    }
    if (configCompleteId != null) {
      $result.configCompleteId = configCompleteId;
    }
    if (rebooted != null) {
      $result.rebooted = rebooted;
    }
    if (moduleConfig != null) {
      $result.moduleConfig = moduleConfig;
    }
    if (channel != null) {
      $result.channel = channel;
    }
    if (queueStatus != null) {
      $result.queueStatus = queueStatus;
    }
    if (xmodemPacket != null) {
      $result.xmodemPacket = xmodemPacket;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    if (mqttClientProxyMessage != null) {
      $result.mqttClientProxyMessage = mqttClientProxyMessage;
    }
    return $result;
  }

  FromRadio._() : super();

  factory FromRadio.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory FromRadio.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, FromRadio_PayloadVariant>
      _FromRadio_PayloadVariantByTag = {
    2: FromRadio_PayloadVariant.packet,
    3: FromRadio_PayloadVariant.myInfo,
    4: FromRadio_PayloadVariant.nodeInfo,
    5: FromRadio_PayloadVariant.config,
    6: FromRadio_PayloadVariant.logRecord,
    7: FromRadio_PayloadVariant.configCompleteId,
    8: FromRadio_PayloadVariant.rebooted,
    9: FromRadio_PayloadVariant.moduleConfig,
    10: FromRadio_PayloadVariant.channel,
    11: FromRadio_PayloadVariant.queueStatus,
    12: FromRadio_PayloadVariant.xmodemPacket,
    13: FromRadio_PayloadVariant.metadata,
    14: FromRadio_PayloadVariant.mqttClientProxyMessage,
    0: FromRadio_PayloadVariant.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FromRadio',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14])
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOM<MeshPacket>(2, _omitFieldNames ? '' : 'packet',
        subBuilder: MeshPacket.create)
    ..aOM<MyNodeInfo>(3, _omitFieldNames ? '' : 'myInfo',
        subBuilder: MyNodeInfo.create)
    ..aOM<NodeInfo>(4, _omitFieldNames ? '' : 'nodeInfo',
        subBuilder: NodeInfo.create)
    ..aOM<$0.Config>(5, _omitFieldNames ? '' : 'config',
        subBuilder: $0.Config.create)
    ..aOM<LogRecord>(6, _omitFieldNames ? '' : 'logRecord',
        subBuilder: LogRecord.create)
    ..a<$core.int>(
        7, _omitFieldNames ? '' : 'configCompleteId', $pb.PbFieldType.OU3)
    ..aOB(8, _omitFieldNames ? '' : 'rebooted')
    ..aOM<$1.ModuleConfig>(9, _omitFieldNames ? '' : 'moduleConfig',
        protoName: 'moduleConfig', subBuilder: $1.ModuleConfig.create)
    ..aOM<$3.Channel>(10, _omitFieldNames ? '' : 'channel',
        subBuilder: $3.Channel.create)
    ..aOM<QueueStatus>(11, _omitFieldNames ? '' : 'queueStatus',
        protoName: 'queueStatus', subBuilder: QueueStatus.create)
    ..aOM<$4.XModem>(12, _omitFieldNames ? '' : 'xmodemPacket',
        protoName: 'xmodemPacket', subBuilder: $4.XModem.create)
    ..aOM<DeviceMetadata>(13, _omitFieldNames ? '' : 'metadata',
        subBuilder: DeviceMetadata.create)
    ..aOM<MqttClientProxyMessage>(
        14, _omitFieldNames ? '' : 'mqttClientProxyMessage',
        protoName: 'mqttClientProxyMessage',
        subBuilder: MqttClientProxyMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FromRadio clone() => FromRadio()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FromRadio copyWith(void Function(FromRadio) updates) =>
      super.copyWith((message) => updates(message as FromRadio)) as FromRadio;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FromRadio create() => FromRadio._();

  FromRadio createEmptyInstance() => create();

  static $pb.PbList<FromRadio> createRepeated() => $pb.PbList<FromRadio>();

  @$core.pragma('dart2js:noInline')
  static FromRadio getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FromRadio>(create);
  static FromRadio? _defaultInstance;

  FromRadio_PayloadVariant whichPayloadVariant() =>
      _FromRadio_PayloadVariantByTag[$_whichOneof(0)]!;

  void clearPayloadVariant() => clearField($_whichOneof(0));

  ///
  ///  The packet id, used to allow the phone to request missing read packets from the FIFO,
  ///  see our bluetooth docs
  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);

  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);

  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  ///
  ///  Log levels, chosen to match python logging conventions.
  @$pb.TagNumber(2)
  MeshPacket get packet => $_getN(1);

  @$pb.TagNumber(2)
  set packet(MeshPacket v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPacket() => $_has(1);

  @$pb.TagNumber(2)
  void clearPacket() => clearField(2);

  @$pb.TagNumber(2)
  MeshPacket ensurePacket() => $_ensure(1);

  ///
  ///  Tells the phone what our node number is, can be -1 if we've not yet joined a mesh.
  ///  NOTE: This ID must not change - to keep (minimal) compatibility with <1.2 version of android apps.
  @$pb.TagNumber(3)
  MyNodeInfo get myInfo => $_getN(2);

  @$pb.TagNumber(3)
  set myInfo(MyNodeInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMyInfo() => $_has(2);

  @$pb.TagNumber(3)
  void clearMyInfo() => clearField(3);

  @$pb.TagNumber(3)
  MyNodeInfo ensureMyInfo() => $_ensure(2);

  ///
  ///  One packet is sent for each node in the on radio DB
  ///  starts over with the first node in our DB
  @$pb.TagNumber(4)
  NodeInfo get nodeInfo => $_getN(3);

  @$pb.TagNumber(4)
  set nodeInfo(NodeInfo v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNodeInfo() => $_has(3);

  @$pb.TagNumber(4)
  void clearNodeInfo() => clearField(4);

  @$pb.TagNumber(4)
  NodeInfo ensureNodeInfo() => $_ensure(3);

  ///
  ///  Include a part of the config (was: RadioConfig radio)
  @$pb.TagNumber(5)
  $0.Config get config => $_getN(4);

  @$pb.TagNumber(5)
  set config($0.Config v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasConfig() => $_has(4);

  @$pb.TagNumber(5)
  void clearConfig() => clearField(5);

  @$pb.TagNumber(5)
  $0.Config ensureConfig() => $_ensure(4);

  ///
  ///  Set to send debug console output over our protobuf stream
  @$pb.TagNumber(6)
  LogRecord get logRecord => $_getN(5);

  @$pb.TagNumber(6)
  set logRecord(LogRecord v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLogRecord() => $_has(5);

  @$pb.TagNumber(6)
  void clearLogRecord() => clearField(6);

  @$pb.TagNumber(6)
  LogRecord ensureLogRecord() => $_ensure(5);

  ///
  ///  Sent as true once the device has finished sending all of the responses to want_config
  ///  recipient should check if this ID matches our original request nonce, if
  ///  not, it means your config responses haven't started yet.
  ///  NOTE: This ID must not change - to keep (minimal) compatibility with <1.2 version of android apps.
  @$pb.TagNumber(7)
  $core.int get configCompleteId => $_getIZ(6);

  @$pb.TagNumber(7)
  set configCompleteId($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasConfigCompleteId() => $_has(6);

  @$pb.TagNumber(7)
  void clearConfigCompleteId() => clearField(7);

  ///
  ///  Sent to tell clients the radio has just rebooted.
  ///  Set to true if present.
  ///  Not used on all transports, currently just used for the serial console.
  ///  NOTE: This ID must not change - to keep (minimal) compatibility with <1.2 version of android apps.
  @$pb.TagNumber(8)
  $core.bool get rebooted => $_getBF(7);

  @$pb.TagNumber(8)
  set rebooted($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasRebooted() => $_has(7);

  @$pb.TagNumber(8)
  void clearRebooted() => clearField(8);

  ///
  ///  Include module config
  @$pb.TagNumber(9)
  $1.ModuleConfig get moduleConfig => $_getN(8);

  @$pb.TagNumber(9)
  set moduleConfig($1.ModuleConfig v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasModuleConfig() => $_has(8);

  @$pb.TagNumber(9)
  void clearModuleConfig() => clearField(9);

  @$pb.TagNumber(9)
  $1.ModuleConfig ensureModuleConfig() => $_ensure(8);

  ///
  ///  One packet is sent for each channel
  @$pb.TagNumber(10)
  $3.Channel get channel => $_getN(9);

  @$pb.TagNumber(10)
  set channel($3.Channel v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasChannel() => $_has(9);

  @$pb.TagNumber(10)
  void clearChannel() => clearField(10);

  @$pb.TagNumber(10)
  $3.Channel ensureChannel() => $_ensure(9);

  ///
  ///  Queue status info
  @$pb.TagNumber(11)
  QueueStatus get queueStatus => $_getN(10);

  @$pb.TagNumber(11)
  set queueStatus(QueueStatus v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasQueueStatus() => $_has(10);

  @$pb.TagNumber(11)
  void clearQueueStatus() => clearField(11);

  @$pb.TagNumber(11)
  QueueStatus ensureQueueStatus() => $_ensure(10);

  ///
  ///  File Transfer Chunk
  @$pb.TagNumber(12)
  $4.XModem get xmodemPacket => $_getN(11);

  @$pb.TagNumber(12)
  set xmodemPacket($4.XModem v) {
    setField(12, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasXmodemPacket() => $_has(11);

  @$pb.TagNumber(12)
  void clearXmodemPacket() => clearField(12);

  @$pb.TagNumber(12)
  $4.XModem ensureXmodemPacket() => $_ensure(11);

  ///
  ///  Device metadata message
  @$pb.TagNumber(13)
  DeviceMetadata get metadata => $_getN(12);

  @$pb.TagNumber(13)
  set metadata(DeviceMetadata v) {
    setField(13, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasMetadata() => $_has(12);

  @$pb.TagNumber(13)
  void clearMetadata() => clearField(13);

  @$pb.TagNumber(13)
  DeviceMetadata ensureMetadata() => $_ensure(12);

  ///
  ///  MQTT Client Proxy Message (device sending to client / phone for publishing to MQTT)
  @$pb.TagNumber(14)
  MqttClientProxyMessage get mqttClientProxyMessage => $_getN(13);

  @$pb.TagNumber(14)
  set mqttClientProxyMessage(MqttClientProxyMessage v) {
    setField(14, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasMqttClientProxyMessage() => $_has(13);

  @$pb.TagNumber(14)
  void clearMqttClientProxyMessage() => clearField(14);

  @$pb.TagNumber(14)
  MqttClientProxyMessage ensureMqttClientProxyMessage() => $_ensure(13);
}

enum ToRadio_PayloadVariant {
  packet,
  wantConfigId,
  disconnect,
  xmodemPacket,
  mqttClientProxyMessage,
  notSet
}

///
///  Packets/commands to the radio will be written (reliably) to the toRadio characteristic.
///  Once the write completes the phone can assume it is handled.
class ToRadio extends $pb.GeneratedMessage {
  factory ToRadio({
    MeshPacket? packet,
    $core.int? wantConfigId,
    $core.bool? disconnect,
    $4.XModem? xmodemPacket,
    MqttClientProxyMessage? mqttClientProxyMessage,
  }) {
    final $result = create();
    if (packet != null) {
      $result.packet = packet;
    }
    if (wantConfigId != null) {
      $result.wantConfigId = wantConfigId;
    }
    if (disconnect != null) {
      $result.disconnect = disconnect;
    }
    if (xmodemPacket != null) {
      $result.xmodemPacket = xmodemPacket;
    }
    if (mqttClientProxyMessage != null) {
      $result.mqttClientProxyMessage = mqttClientProxyMessage;
    }
    return $result;
  }

  ToRadio._() : super();

  factory ToRadio.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory ToRadio.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ToRadio_PayloadVariant>
      _ToRadio_PayloadVariantByTag = {
    1: ToRadio_PayloadVariant.packet,
    3: ToRadio_PayloadVariant.wantConfigId,
    4: ToRadio_PayloadVariant.disconnect,
    5: ToRadio_PayloadVariant.xmodemPacket,
    6: ToRadio_PayloadVariant.mqttClientProxyMessage,
    0: ToRadio_PayloadVariant.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ToRadio',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..oo(0, [1, 3, 4, 5, 6])
    ..aOM<MeshPacket>(1, _omitFieldNames ? '' : 'packet',
        subBuilder: MeshPacket.create)
    ..a<$core.int>(
        3, _omitFieldNames ? '' : 'wantConfigId', $pb.PbFieldType.OU3)
    ..aOB(4, _omitFieldNames ? '' : 'disconnect')
    ..aOM<$4.XModem>(5, _omitFieldNames ? '' : 'xmodemPacket',
        protoName: 'xmodemPacket', subBuilder: $4.XModem.create)
    ..aOM<MqttClientProxyMessage>(
        6, _omitFieldNames ? '' : 'mqttClientProxyMessage',
        protoName: 'mqttClientProxyMessage',
        subBuilder: MqttClientProxyMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ToRadio clone() => ToRadio()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ToRadio copyWith(void Function(ToRadio) updates) =>
      super.copyWith((message) => updates(message as ToRadio)) as ToRadio;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ToRadio create() => ToRadio._();

  ToRadio createEmptyInstance() => create();

  static $pb.PbList<ToRadio> createRepeated() => $pb.PbList<ToRadio>();

  @$core.pragma('dart2js:noInline')
  static ToRadio getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ToRadio>(create);
  static ToRadio? _defaultInstance;

  ToRadio_PayloadVariant whichPayloadVariant() =>
      _ToRadio_PayloadVariantByTag[$_whichOneof(0)]!;

  void clearPayloadVariant() => clearField($_whichOneof(0));

  ///
  ///  Send this packet on the mesh
  @$pb.TagNumber(1)
  MeshPacket get packet => $_getN(0);

  @$pb.TagNumber(1)
  set packet(MeshPacket v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPacket() => $_has(0);

  @$pb.TagNumber(1)
  void clearPacket() => clearField(1);

  @$pb.TagNumber(1)
  MeshPacket ensurePacket() => $_ensure(0);

  ///
  ///  Phone wants radio to send full node db to the phone, This is
  ///  typically the first packet sent to the radio when the phone gets a
  ///  bluetooth connection. The radio will respond by sending back a
  ///  MyNodeInfo, a owner, a radio config and a series of
  ///  FromRadio.node_infos, and config_complete
  ///  the integer you write into this field will be reported back in the
  ///  config_complete_id response this allows clients to never be confused by
  ///  a stale old partially sent config.
  @$pb.TagNumber(3)
  $core.int get wantConfigId => $_getIZ(1);

  @$pb.TagNumber(3)
  set wantConfigId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasWantConfigId() => $_has(1);

  @$pb.TagNumber(3)
  void clearWantConfigId() => clearField(3);

  ///
  ///  Tell API server we are disconnecting now.
  ///  This is useful for serial links where there is no hardware/protocol based notification that the client has dropped the link.
  ///  (Sending this message is optional for clients)
  @$pb.TagNumber(4)
  $core.bool get disconnect => $_getBF(2);

  @$pb.TagNumber(4)
  set disconnect($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDisconnect() => $_has(2);

  @$pb.TagNumber(4)
  void clearDisconnect() => clearField(4);

  @$pb.TagNumber(5)
  $4.XModem get xmodemPacket => $_getN(3);

  @$pb.TagNumber(5)
  set xmodemPacket($4.XModem v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasXmodemPacket() => $_has(3);

  @$pb.TagNumber(5)
  void clearXmodemPacket() => clearField(5);

  @$pb.TagNumber(5)
  $4.XModem ensureXmodemPacket() => $_ensure(3);

  ///
  ///  MQTT Client Proxy Message (for client / phone subscribed to MQTT sending to device)
  @$pb.TagNumber(6)
  MqttClientProxyMessage get mqttClientProxyMessage => $_getN(4);

  @$pb.TagNumber(6)
  set mqttClientProxyMessage(MqttClientProxyMessage v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMqttClientProxyMessage() => $_has(4);

  @$pb.TagNumber(6)
  void clearMqttClientProxyMessage() => clearField(6);

  @$pb.TagNumber(6)
  MqttClientProxyMessage ensureMqttClientProxyMessage() => $_ensure(4);
}

///
///  Compressed message payload
class Compressed extends $pb.GeneratedMessage {
  factory Compressed({
    $5.PortNum? portnum,
    $core.List<$core.int>? data,
  }) {
    final $result = create();
    if (portnum != null) {
      $result.portnum = portnum;
    }
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }

  Compressed._() : super();

  factory Compressed.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Compressed.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Compressed',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..e<$5.PortNum>(1, _omitFieldNames ? '' : 'portnum', $pb.PbFieldType.OE,
        defaultOrMaker: $5.PortNum.UNKNOWN_APP,
        valueOf: $5.PortNum.valueOf,
        enumValues: $5.PortNum.values)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Compressed clone() => Compressed()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Compressed copyWith(void Function(Compressed) updates) =>
      super.copyWith((message) => updates(message as Compressed)) as Compressed;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Compressed create() => Compressed._();

  Compressed createEmptyInstance() => create();

  static $pb.PbList<Compressed> createRepeated() => $pb.PbList<Compressed>();

  @$core.pragma('dart2js:noInline')
  static Compressed getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Compressed>(create);
  static Compressed? _defaultInstance;

  ///
  ///  PortNum to determine the how to handle the compressed payload.
  @$pb.TagNumber(1)
  $5.PortNum get portnum => $_getN(0);

  @$pb.TagNumber(1)
  set portnum($5.PortNum v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPortnum() => $_has(0);

  @$pb.TagNumber(1)
  void clearPortnum() => clearField(1);

  ///
  ///  Compressed data.
  @$pb.TagNumber(2)
  $core.List<$core.int> get data => $_getN(1);

  @$pb.TagNumber(2)
  set data($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);

  @$pb.TagNumber(2)
  void clearData() => clearField(2);
}

///
///  Full info on edges for a single node
class NeighborInfo extends $pb.GeneratedMessage {
  factory NeighborInfo({
    $core.int? nodeId,
    $core.int? lastSentById,
    $core.int? nodeBroadcastIntervalSecs,
    $core.Iterable<Neighbor>? neighbors,
  }) {
    final $result = create();
    if (nodeId != null) {
      $result.nodeId = nodeId;
    }
    if (lastSentById != null) {
      $result.lastSentById = lastSentById;
    }
    if (nodeBroadcastIntervalSecs != null) {
      $result.nodeBroadcastIntervalSecs = nodeBroadcastIntervalSecs;
    }
    if (neighbors != null) {
      $result.neighbors.addAll(neighbors);
    }
    return $result;
  }

  NeighborInfo._() : super();

  factory NeighborInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory NeighborInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NeighborInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'nodeId', $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2, _omitFieldNames ? '' : 'lastSentById', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'nodeBroadcastIntervalSecs',
        $pb.PbFieldType.OU3)
    ..pc<Neighbor>(4, _omitFieldNames ? '' : 'neighbors', $pb.PbFieldType.PM,
        subBuilder: Neighbor.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NeighborInfo clone() => NeighborInfo()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NeighborInfo copyWith(void Function(NeighborInfo) updates) =>
      super.copyWith((message) => updates(message as NeighborInfo))
          as NeighborInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NeighborInfo create() => NeighborInfo._();

  NeighborInfo createEmptyInstance() => create();

  static $pb.PbList<NeighborInfo> createRepeated() =>
      $pb.PbList<NeighborInfo>();

  @$core.pragma('dart2js:noInline')
  static NeighborInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NeighborInfo>(create);
  static NeighborInfo? _defaultInstance;

  ///
  ///  The node ID of the node sending info on its neighbors
  @$pb.TagNumber(1)
  $core.int get nodeId => $_getIZ(0);

  @$pb.TagNumber(1)
  set nodeId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNodeId() => $_has(0);

  @$pb.TagNumber(1)
  void clearNodeId() => clearField(1);

  ///
  ///  Field to pass neighbor info for the next sending cycle
  @$pb.TagNumber(2)
  $core.int get lastSentById => $_getIZ(1);

  @$pb.TagNumber(2)
  set lastSentById($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLastSentById() => $_has(1);

  @$pb.TagNumber(2)
  void clearLastSentById() => clearField(2);

  ///
  ///  Broadcast interval of the represented node (in seconds)
  @$pb.TagNumber(3)
  $core.int get nodeBroadcastIntervalSecs => $_getIZ(2);

  @$pb.TagNumber(3)
  set nodeBroadcastIntervalSecs($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNodeBroadcastIntervalSecs() => $_has(2);

  @$pb.TagNumber(3)
  void clearNodeBroadcastIntervalSecs() => clearField(3);

  ///
  ///  The list of out edges from this node
  @$pb.TagNumber(4)
  $core.List<Neighbor> get neighbors => $_getList(3);
}

///
///  A single edge in the mesh
class Neighbor extends $pb.GeneratedMessage {
  factory Neighbor({
    $core.int? nodeId,
    $core.double? snr,
    $core.int? lastRxTime,
    $core.int? nodeBroadcastIntervalSecs,
  }) {
    final $result = create();
    if (nodeId != null) {
      $result.nodeId = nodeId;
    }
    if (snr != null) {
      $result.snr = snr;
    }
    if (lastRxTime != null) {
      $result.lastRxTime = lastRxTime;
    }
    if (nodeBroadcastIntervalSecs != null) {
      $result.nodeBroadcastIntervalSecs = nodeBroadcastIntervalSecs;
    }
    return $result;
  }

  Neighbor._() : super();

  factory Neighbor.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Neighbor.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Neighbor',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'nodeId', $pb.PbFieldType.OU3)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'snr', $pb.PbFieldType.OF)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'lastRxTime', $pb.PbFieldType.OF3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'nodeBroadcastIntervalSecs',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Neighbor clone() => Neighbor()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Neighbor copyWith(void Function(Neighbor) updates) =>
      super.copyWith((message) => updates(message as Neighbor)) as Neighbor;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Neighbor create() => Neighbor._();

  Neighbor createEmptyInstance() => create();

  static $pb.PbList<Neighbor> createRepeated() => $pb.PbList<Neighbor>();

  @$core.pragma('dart2js:noInline')
  static Neighbor getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Neighbor>(create);
  static Neighbor? _defaultInstance;

  ///
  ///  Node ID of neighbor
  @$pb.TagNumber(1)
  $core.int get nodeId => $_getIZ(0);

  @$pb.TagNumber(1)
  set nodeId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNodeId() => $_has(0);

  @$pb.TagNumber(1)
  void clearNodeId() => clearField(1);

  ///
  ///  SNR of last heard message
  @$pb.TagNumber(2)
  $core.double get snr => $_getN(1);

  @$pb.TagNumber(2)
  set snr($core.double v) {
    $_setFloat(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSnr() => $_has(1);

  @$pb.TagNumber(2)
  void clearSnr() => clearField(2);

  ///
  ///  Reception time (in secs since 1970) of last message that was last sent by this ID.
  ///  Note: this is for local storage only and will not be sent out over the mesh.
  @$pb.TagNumber(3)
  $core.int get lastRxTime => $_getIZ(2);

  @$pb.TagNumber(3)
  set lastRxTime($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLastRxTime() => $_has(2);

  @$pb.TagNumber(3)
  void clearLastRxTime() => clearField(3);

  ///
  ///  Broadcast interval of this neighbor (in seconds).
  ///  Note: this is for local storage only and will not be sent out over the mesh.
  @$pb.TagNumber(4)
  $core.int get nodeBroadcastIntervalSecs => $_getIZ(3);

  @$pb.TagNumber(4)
  set nodeBroadcastIntervalSecs($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNodeBroadcastIntervalSecs() => $_has(3);

  @$pb.TagNumber(4)
  void clearNodeBroadcastIntervalSecs() => clearField(4);
}

///
///  Device metadata response
class DeviceMetadata extends $pb.GeneratedMessage {
  factory DeviceMetadata({
    $core.String? firmwareVersion,
    $core.int? deviceStateVersion,
    $core.bool? canShutdown,
    $core.bool? hasWifi,
    $core.bool? hasBluetooth,
    $core.bool? hasEthernet,
    $0.Config_DeviceConfig_Role? role,
    $core.int? positionFlags,
    HardwareModel? hwModel,
    $core.bool? hasRemoteHardware,
  }) {
    final $result = create();
    if (firmwareVersion != null) {
      $result.firmwareVersion = firmwareVersion;
    }
    if (deviceStateVersion != null) {
      $result.deviceStateVersion = deviceStateVersion;
    }
    if (canShutdown != null) {
      $result.canShutdown = canShutdown;
    }
    if (hasWifi != null) {
      $result.hasWifi = hasWifi;
    }
    if (hasBluetooth != null) {
      $result.hasBluetooth = hasBluetooth;
    }
    if (hasEthernet != null) {
      $result.hasEthernet = hasEthernet;
    }
    if (role != null) {
      $result.role = role;
    }
    if (positionFlags != null) {
      $result.positionFlags = positionFlags;
    }
    if (hwModel != null) {
      $result.hwModel = hwModel;
    }
    if (hasRemoteHardware != null) {
      $result.hasRemoteHardware = hasRemoteHardware;
    }
    return $result;
  }

  DeviceMetadata._() : super();

  factory DeviceMetadata.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory DeviceMetadata.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeviceMetadata',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firmwareVersion')
    ..a<$core.int>(
        2, _omitFieldNames ? '' : 'deviceStateVersion', $pb.PbFieldType.OU3)
    ..aOB(3, _omitFieldNames ? '' : 'canShutdown', protoName: 'canShutdown')
    ..aOB(4, _omitFieldNames ? '' : 'hasWifi', protoName: 'hasWifi')
    ..aOB(5, _omitFieldNames ? '' : 'hasBluetooth', protoName: 'hasBluetooth')
    ..aOB(6, _omitFieldNames ? '' : 'hasEthernet', protoName: 'hasEthernet')
    ..e<$0.Config_DeviceConfig_Role>(
        7, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE,
        defaultOrMaker: $0.Config_DeviceConfig_Role.CLIENT,
        valueOf: $0.Config_DeviceConfig_Role.valueOf,
        enumValues: $0.Config_DeviceConfig_Role.values)
    ..a<$core.int>(
        8, _omitFieldNames ? '' : 'positionFlags', $pb.PbFieldType.OU3)
    ..e<HardwareModel>(9, _omitFieldNames ? '' : 'hwModel', $pb.PbFieldType.OE,
        defaultOrMaker: HardwareModel.UNSET,
        valueOf: HardwareModel.valueOf,
        enumValues: HardwareModel.values)
    ..aOB(10, _omitFieldNames ? '' : 'hasRemoteHardware',
        protoName: 'hasRemoteHardware')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DeviceMetadata clone() => DeviceMetadata()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DeviceMetadata copyWith(void Function(DeviceMetadata) updates) =>
      super.copyWith((message) => updates(message as DeviceMetadata))
          as DeviceMetadata;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceMetadata create() => DeviceMetadata._();

  DeviceMetadata createEmptyInstance() => create();

  static $pb.PbList<DeviceMetadata> createRepeated() =>
      $pb.PbList<DeviceMetadata>();

  @$core.pragma('dart2js:noInline')
  static DeviceMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeviceMetadata>(create);
  static DeviceMetadata? _defaultInstance;

  ///
  ///  Device firmware version string
  @$pb.TagNumber(1)
  $core.String get firmwareVersion => $_getSZ(0);

  @$pb.TagNumber(1)
  set firmwareVersion($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFirmwareVersion() => $_has(0);

  @$pb.TagNumber(1)
  void clearFirmwareVersion() => clearField(1);

  ///
  ///  Device state version
  @$pb.TagNumber(2)
  $core.int get deviceStateVersion => $_getIZ(1);

  @$pb.TagNumber(2)
  set deviceStateVersion($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDeviceStateVersion() => $_has(1);

  @$pb.TagNumber(2)
  void clearDeviceStateVersion() => clearField(2);

  ///
  ///  Indicates whether the device can shutdown CPU natively or via power management chip
  @$pb.TagNumber(3)
  $core.bool get canShutdown => $_getBF(2);

  @$pb.TagNumber(3)
  set canShutdown($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCanShutdown() => $_has(2);

  @$pb.TagNumber(3)
  void clearCanShutdown() => clearField(3);

  ///
  ///  Indicates that the device has native wifi capability
  @$pb.TagNumber(4)
  $core.bool get hasWifi => $_getBF(3);

  @$pb.TagNumber(4)
  set hasWifi($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHasWifi() => $_has(3);

  @$pb.TagNumber(4)
  void clearHasWifi() => clearField(4);

  ///
  ///  Indicates that the device has native bluetooth capability
  @$pb.TagNumber(5)
  $core.bool get hasBluetooth => $_getBF(4);

  @$pb.TagNumber(5)
  set hasBluetooth($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHasBluetooth() => $_has(4);

  @$pb.TagNumber(5)
  void clearHasBluetooth() => clearField(5);

  ///
  ///  Indicates that the device has an ethernet peripheral
  @$pb.TagNumber(6)
  $core.bool get hasEthernet => $_getBF(5);

  @$pb.TagNumber(6)
  set hasEthernet($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasHasEthernet() => $_has(5);

  @$pb.TagNumber(6)
  void clearHasEthernet() => clearField(6);

  ///
  ///  Indicates that the device's role in the mesh
  @$pb.TagNumber(7)
  $0.Config_DeviceConfig_Role get role => $_getN(6);

  @$pb.TagNumber(7)
  set role($0.Config_DeviceConfig_Role v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRole() => $_has(6);

  @$pb.TagNumber(7)
  void clearRole() => clearField(7);

  ///
  ///  Indicates the device's current enabled position flags
  @$pb.TagNumber(8)
  $core.int get positionFlags => $_getIZ(7);

  @$pb.TagNumber(8)
  set positionFlags($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPositionFlags() => $_has(7);

  @$pb.TagNumber(8)
  void clearPositionFlags() => clearField(8);

  ///
  ///  Device hardware model
  @$pb.TagNumber(9)
  HardwareModel get hwModel => $_getN(8);

  @$pb.TagNumber(9)
  set hwModel(HardwareModel v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasHwModel() => $_has(8);

  @$pb.TagNumber(9)
  void clearHwModel() => clearField(9);

  ///
  ///  Has Remote Hardware enabled
  @$pb.TagNumber(10)
  $core.bool get hasRemoteHardware => $_getBF(9);

  @$pb.TagNumber(10)
  set hasRemoteHardware($core.bool v) {
    $_setBool(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasHasRemoteHardware() => $_has(9);

  @$pb.TagNumber(10)
  void clearHasRemoteHardware() => clearField(10);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
