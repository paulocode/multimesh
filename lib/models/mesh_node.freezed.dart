// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mesh_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MeshNode {
  int get nodeNum;
  String get longName;
  String? get hwModel;
  String get shortName;
  int get channel;
  String get id;
  int? get batteryLevel;
  DateTime get lastSeen;
  bool get hasUnreadMessages;

  /// Create a copy of MeshNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MeshNodeCopyWith<MeshNode> get copyWith =>
      _$MeshNodeCopyWithImpl<MeshNode>(this as MeshNode, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MeshNode &&
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

  @override
  String toString() {
    return 'MeshNode(nodeNum: $nodeNum, longName: $longName, hwModel: $hwModel, shortName: $shortName, channel: $channel, id: $id, batteryLevel: $batteryLevel, lastSeen: $lastSeen, hasUnreadMessages: $hasUnreadMessages)';
  }
}

/// @nodoc
abstract mixin class $MeshNodeCopyWith<$Res> {
  factory $MeshNodeCopyWith(MeshNode value, $Res Function(MeshNode) _then) =
      _$MeshNodeCopyWithImpl;
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
class _$MeshNodeCopyWithImpl<$Res> implements $MeshNodeCopyWith<$Res> {
  _$MeshNodeCopyWithImpl(this._self, this._then);

  final MeshNode _self;
  final $Res Function(MeshNode) _then;

  /// Create a copy of MeshNode
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      nodeNum: null == nodeNum
          ? _self.nodeNum
          : nodeNum // ignore: cast_nullable_to_non_nullable
              as int,
      longName: null == longName
          ? _self.longName
          : longName // ignore: cast_nullable_to_non_nullable
              as String,
      hwModel: freezed == hwModel
          ? _self.hwModel
          : hwModel // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: null == shortName
          ? _self.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _self.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      batteryLevel: freezed == batteryLevel
          ? _self.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      lastSeen: null == lastSeen
          ? _self.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hasUnreadMessages: null == hasUnreadMessages
          ? _self.hasUnreadMessages
          : hasUnreadMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [MeshNode].
extension MeshNodePatterns on MeshNode {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MeshNode value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MeshNode() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MeshNode value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MeshNode():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MeshNode value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MeshNode() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int nodeNum,
            String longName,
            String? hwModel,
            String shortName,
            int channel,
            String id,
            int? batteryLevel,
            DateTime lastSeen,
            bool hasUnreadMessages)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MeshNode() when $default != null:
        return $default(
            _that.nodeNum,
            _that.longName,
            _that.hwModel,
            _that.shortName,
            _that.channel,
            _that.id,
            _that.batteryLevel,
            _that.lastSeen,
            _that.hasUnreadMessages);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int nodeNum,
            String longName,
            String? hwModel,
            String shortName,
            int channel,
            String id,
            int? batteryLevel,
            DateTime lastSeen,
            bool hasUnreadMessages)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MeshNode():
        return $default(
            _that.nodeNum,
            _that.longName,
            _that.hwModel,
            _that.shortName,
            _that.channel,
            _that.id,
            _that.batteryLevel,
            _that.lastSeen,
            _that.hasUnreadMessages);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int nodeNum,
            String longName,
            String? hwModel,
            String shortName,
            int channel,
            String id,
            int? batteryLevel,
            DateTime lastSeen,
            bool hasUnreadMessages)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MeshNode() when $default != null:
        return $default(
            _that.nodeNum,
            _that.longName,
            _that.hwModel,
            _that.shortName,
            _that.channel,
            _that.id,
            _that.batteryLevel,
            _that.lastSeen,
            _that.hasUnreadMessages);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MeshNode extends MeshNode {
  const _MeshNode(
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

  /// Create a copy of MeshNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MeshNodeCopyWith<_MeshNode> get copyWith =>
      __$MeshNodeCopyWithImpl<_MeshNode>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MeshNode &&
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

  @override
  String toString() {
    return 'MeshNode(nodeNum: $nodeNum, longName: $longName, hwModel: $hwModel, shortName: $shortName, channel: $channel, id: $id, batteryLevel: $batteryLevel, lastSeen: $lastSeen, hasUnreadMessages: $hasUnreadMessages)';
  }
}

/// @nodoc
abstract mixin class _$MeshNodeCopyWith<$Res>
    implements $MeshNodeCopyWith<$Res> {
  factory _$MeshNodeCopyWith(_MeshNode value, $Res Function(_MeshNode) _then) =
      __$MeshNodeCopyWithImpl;
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
class __$MeshNodeCopyWithImpl<$Res> implements _$MeshNodeCopyWith<$Res> {
  __$MeshNodeCopyWithImpl(this._self, this._then);

  final _MeshNode _self;
  final $Res Function(_MeshNode) _then;

  /// Create a copy of MeshNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_MeshNode(
      nodeNum: null == nodeNum
          ? _self.nodeNum
          : nodeNum // ignore: cast_nullable_to_non_nullable
              as int,
      longName: null == longName
          ? _self.longName
          : longName // ignore: cast_nullable_to_non_nullable
              as String,
      hwModel: freezed == hwModel
          ? _self.hwModel
          : hwModel // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: null == shortName
          ? _self.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _self.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      batteryLevel: freezed == batteryLevel
          ? _self.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      lastSeen: null == lastSeen
          ? _self.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hasUnreadMessages: null == hasUnreadMessages
          ? _self.hasUnreadMessages
          : hasUnreadMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
