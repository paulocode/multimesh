// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mesh_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MeshNode {
  int get nodeNum => throw _privateConstructorUsedError;
  String get longName => throw _privateConstructorUsedError;
  String? get hwModel => throw _privateConstructorUsedError;
  String get shortName => throw _privateConstructorUsedError;
  int get channel => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  int? get batteryLevel => throw _privateConstructorUsedError;
  DateTime get lastSeen => throw _privateConstructorUsedError;
  bool get hasUnreadMessages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MeshNodeCopyWith<MeshNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeshNodeCopyWith<$Res> {
  factory $MeshNodeCopyWith(MeshNode value, $Res Function(MeshNode) then) =
      _$MeshNodeCopyWithImpl<$Res, MeshNode>;
  @useResult
  $Res call(
      {int nodeNum,
      String longName,
      String? hwModel,
      String shortName,
      int channel,
      String id,
      int? batteryLevel,
      DateTime lastSeen,
      bool hasUnreadMessages});
}

/// @nodoc
class _$MeshNodeCopyWithImpl<$Res, $Val extends MeshNode>
    implements $MeshNodeCopyWith<$Res> {
  _$MeshNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nodeNum = null,
    Object? longName = null,
    Object? hwModel = freezed,
    Object? shortName = null,
    Object? channel = null,
    Object? id = null,
    Object? batteryLevel = freezed,
    Object? lastSeen = null,
    Object? hasUnreadMessages = null,
  }) {
    return _then(_value.copyWith(
      nodeNum: null == nodeNum
          ? _value.nodeNum
          : nodeNum // ignore: cast_nullable_to_non_nullable
              as int,
      longName: null == longName
          ? _value.longName
          : longName // ignore: cast_nullable_to_non_nullable
              as String,
      hwModel: freezed == hwModel
          ? _value.hwModel
          : hwModel // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      batteryLevel: freezed == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      lastSeen: null == lastSeen
          ? _value.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hasUnreadMessages: null == hasUnreadMessages
          ? _value.hasUnreadMessages
          : hasUnreadMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeshNodeImplCopyWith<$Res>
    implements $MeshNodeCopyWith<$Res> {
  factory _$$MeshNodeImplCopyWith(
          _$MeshNodeImpl value, $Res Function(_$MeshNodeImpl) then) =
      __$$MeshNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int nodeNum,
      String longName,
      String? hwModel,
      String shortName,
      int channel,
      String id,
      int? batteryLevel,
      DateTime lastSeen,
      bool hasUnreadMessages});
}

/// @nodoc
class __$$MeshNodeImplCopyWithImpl<$Res>
    extends _$MeshNodeCopyWithImpl<$Res, _$MeshNodeImpl>
    implements _$$MeshNodeImplCopyWith<$Res> {
  __$$MeshNodeImplCopyWithImpl(
      _$MeshNodeImpl _value, $Res Function(_$MeshNodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nodeNum = null,
    Object? longName = null,
    Object? hwModel = freezed,
    Object? shortName = null,
    Object? channel = null,
    Object? id = null,
    Object? batteryLevel = freezed,
    Object? lastSeen = null,
    Object? hasUnreadMessages = null,
  }) {
    return _then(_$MeshNodeImpl(
      nodeNum: null == nodeNum
          ? _value.nodeNum
          : nodeNum // ignore: cast_nullable_to_non_nullable
              as int,
      longName: null == longName
          ? _value.longName
          : longName // ignore: cast_nullable_to_non_nullable
              as String,
      hwModel: freezed == hwModel
          ? _value.hwModel
          : hwModel // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      batteryLevel: freezed == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      lastSeen: null == lastSeen
          ? _value.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hasUnreadMessages: null == hasUnreadMessages
          ? _value.hasUnreadMessages
          : hasUnreadMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MeshNodeImpl extends _MeshNode {
  const _$MeshNodeImpl(
      {required this.nodeNum,
      required this.longName,
      this.hwModel,
      required this.shortName,
      required this.channel,
      required this.id,
      this.batteryLevel,
      required this.lastSeen,
      this.hasUnreadMessages = false})
      : super._();

  @override
  final int nodeNum;
  @override
  final String longName;
  @override
  final String? hwModel;
  @override
  final String shortName;
  @override
  final int channel;
  @override
  final String id;
  @override
  final int? batteryLevel;
  @override
  final DateTime lastSeen;
  @override
  @JsonKey()
  final bool hasUnreadMessages;

  @override
  String toString() {
    return 'MeshNode(nodeNum: $nodeNum, longName: $longName, hwModel: $hwModel, shortName: $shortName, channel: $channel, id: $id, batteryLevel: $batteryLevel, lastSeen: $lastSeen, hasUnreadMessages: $hasUnreadMessages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeshNodeImpl &&
            (identical(other.nodeNum, nodeNum) || other.nodeNum == nodeNum) &&
            (identical(other.longName, longName) ||
                other.longName == longName) &&
            (identical(other.hwModel, hwModel) || other.hwModel == hwModel) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batteryLevel, batteryLevel) ||
                other.batteryLevel == batteryLevel) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen) &&
            (identical(other.hasUnreadMessages, hasUnreadMessages) ||
                other.hasUnreadMessages == hasUnreadMessages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nodeNum, longName, hwModel,
      shortName, channel, id, batteryLevel, lastSeen, hasUnreadMessages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeshNodeImplCopyWith<_$MeshNodeImpl> get copyWith =>
      __$$MeshNodeImplCopyWithImpl<_$MeshNodeImpl>(this, _$identity);
}

abstract class _MeshNode extends MeshNode {
  const factory _MeshNode(
      {required final int nodeNum,
      required final String longName,
      final String? hwModel,
      required final String shortName,
      required final int channel,
      required final String id,
      final int? batteryLevel,
      required final DateTime lastSeen,
      final bool hasUnreadMessages}) = _$MeshNodeImpl;
  const _MeshNode._() : super._();

  @override
  int get nodeNum;
  @override
  String get longName;
  @override
  String? get hwModel;
  @override
  String get shortName;
  @override
  int get channel;
  @override
  String get id;
  @override
  int? get batteryLevel;
  @override
  DateTime get lastSeen;
  @override
  bool get hasUnreadMessages;
  @override
  @JsonKey(ignore: true)
  _$$MeshNodeImplCopyWith<_$MeshNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
