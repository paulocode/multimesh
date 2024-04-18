//
//  Generated code. Do not modify.
//  source: meshtastic/remote_hardware.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'remote_hardware.pbenum.dart';

export 'remote_hardware.pbenum.dart';

///
///  An example app to show off the module system. This message is used for
///  REMOTE_HARDWARE_APP PortNums.
///  Also provides easy remote access to any GPIO.
///  In the future other remote hardware operations can be added based on user interest
///  (i.e. serial output, spi/i2c input/output).
///  FIXME - currently this feature is turned on by default which is dangerous
///  because no security yet (beyond the channel mechanism).
///  It should be off by default and then protected based on some TBD mechanism
///  (a special channel once multichannel support is included?)
class HardwareMessage extends $pb.GeneratedMessage {
  factory HardwareMessage({
    HardwareMessage_Type? type,
    $fixnum.Int64? gpioMask,
    $fixnum.Int64? gpioValue,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (gpioMask != null) {
      $result.gpioMask = gpioMask;
    }
    if (gpioValue != null) {
      $result.gpioValue = gpioValue;
    }
    return $result;
  }
  HardwareMessage._() : super();
  factory HardwareMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HardwareMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HardwareMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'meshtastic'), createEmptyInstance: create)
    ..e<HardwareMessage_Type>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: HardwareMessage_Type.UNSET, valueOf: HardwareMessage_Type.valueOf, enumValues: HardwareMessage_Type.values)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'gpioMask', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'gpioValue', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HardwareMessage clone() => HardwareMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HardwareMessage copyWith(void Function(HardwareMessage) updates) => super.copyWith((message) => updates(message as HardwareMessage)) as HardwareMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HardwareMessage create() => HardwareMessage._();
  HardwareMessage createEmptyInstance() => create();
  static $pb.PbList<HardwareMessage> createRepeated() => $pb.PbList<HardwareMessage>();
  @$core.pragma('dart2js:noInline')
  static HardwareMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HardwareMessage>(create);
  static HardwareMessage? _defaultInstance;

  ///
  ///  What type of HardwareMessage is this?
  @$pb.TagNumber(1)
  HardwareMessage_Type get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(HardwareMessage_Type v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  ///
  ///  What gpios are we changing. Not used for all MessageTypes, see MessageType for details
  @$pb.TagNumber(2)
  $fixnum.Int64 get gpioMask => $_getI64(1);
  @$pb.TagNumber(2)
  set gpioMask($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGpioMask() => $_has(1);
  @$pb.TagNumber(2)
  void clearGpioMask() => clearField(2);

  ///
  ///  For gpios that were listed in gpio_mask as valid, what are the signal levels for those gpios.
  ///  Not used for all MessageTypes, see MessageType for details
  @$pb.TagNumber(3)
  $fixnum.Int64 get gpioValue => $_getI64(2);
  @$pb.TagNumber(3)
  set gpioValue($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGpioValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearGpioValue() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
