// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mesh_channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MeshChannel {
  String get name;
  bool get hasBlankActualName;
  Channel_Role get role;
  List<int> get key;
  int get index;
  bool get uplinkEnabled;
  bool get downlinkEnabled;

  /// Create a copy of MeshChannel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MeshChannelCopyWith<MeshChannel> get copyWith =>
      _$MeshChannelCopyWithImpl<MeshChannel>(this as MeshChannel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MeshChannel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hasBlankActualName, hasBlankActualName) ||
                other.hasBlankActualName == hasBlankActualName) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality().equals(other.key, key) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.uplinkEnabled, uplinkEnabled) ||
                other.uplinkEnabled == uplinkEnabled) &&
            (identical(other.downlinkEnabled, downlinkEnabled) ||
                other.downlinkEnabled == downlinkEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      hasBlankActualName,
      role,
      const DeepCollectionEquality().hash(key),
      index,
      uplinkEnabled,
      downlinkEnabled);

  @override
  String toString() {
    return 'MeshChannel(name: $name, hasBlankActualName: $hasBlankActualName, role: $role, key: $key, index: $index, uplinkEnabled: $uplinkEnabled, downlinkEnabled: $downlinkEnabled)';
  }
}

/// @nodoc
abstract mixin class $MeshChannelCopyWith<$Res> {
  factory $MeshChannelCopyWith(
          MeshChannel value, $Res Function(MeshChannel) _then) =
      _$MeshChannelCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      bool hasBlankActualName,
      Channel_Role role,
      List<int> key,
      int index,
      bool uplinkEnabled,
      bool downlinkEnabled});
}

/// @nodoc
class _$MeshChannelCopyWithImpl<$Res> implements $MeshChannelCopyWith<$Res> {
  _$MeshChannelCopyWithImpl(this._self, this._then);

  final MeshChannel _self;
  final $Res Function(MeshChannel) _then;

  /// Create a copy of MeshChannel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? hasBlankActualName = null,
    Object? role = null,
    Object? key = null,
    Object? index = null,
    Object? uplinkEnabled = null,
    Object? downlinkEnabled = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hasBlankActualName: null == hasBlankActualName
          ? _self.hasBlankActualName
          : hasBlankActualName // ignore: cast_nullable_to_non_nullable
              as bool,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as Channel_Role,
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as List<int>,
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      uplinkEnabled: null == uplinkEnabled
          ? _self.uplinkEnabled
          : uplinkEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      downlinkEnabled: null == downlinkEnabled
          ? _self.downlinkEnabled
          : downlinkEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [MeshChannel].
extension MeshChannelPatterns on MeshChannel {
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
    TResult Function(_MeshChannel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MeshChannel() when $default != null:
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
    TResult Function(_MeshChannel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MeshChannel():
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
    TResult? Function(_MeshChannel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MeshChannel() when $default != null:
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
    TResult Function(String name, bool hasBlankActualName, Channel_Role role,
            List<int> key, int index, bool uplinkEnabled, bool downlinkEnabled)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MeshChannel() when $default != null:
        return $default(_that.name, _that.hasBlankActualName, _that.role,
            _that.key, _that.index, _that.uplinkEnabled, _that.downlinkEnabled);
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
    TResult Function(String name, bool hasBlankActualName, Channel_Role role,
            List<int> key, int index, bool uplinkEnabled, bool downlinkEnabled)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MeshChannel():
        return $default(_that.name, _that.hasBlankActualName, _that.role,
            _that.key, _that.index, _that.uplinkEnabled, _that.downlinkEnabled);
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
    TResult? Function(String name, bool hasBlankActualName, Channel_Role role,
            List<int> key, int index, bool uplinkEnabled, bool downlinkEnabled)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MeshChannel() when $default != null:
        return $default(_that.name, _that.hasBlankActualName, _that.role,
            _that.key, _that.index, _that.uplinkEnabled, _that.downlinkEnabled);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MeshChannel extends MeshChannel {
  const _MeshChannel(
      {required this.name,
      this.hasBlankActualName = false,
      required this.role,
      required final List<int> key,
      required this.index,
      required this.uplinkEnabled,
      required this.downlinkEnabled})
      : _key = key,
        super._();

  @override
  final String name;
  @override
  @JsonKey()
  final bool hasBlankActualName;
  @override
  final Channel_Role role;
  final List<int> _key;
  @override
  List<int> get key {
    if (_key is EqualUnmodifiableListView) return _key;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_key);
  }

  @override
  final int index;
  @override
  final bool uplinkEnabled;
  @override
  final bool downlinkEnabled;

  /// Create a copy of MeshChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MeshChannelCopyWith<_MeshChannel> get copyWith =>
      __$MeshChannelCopyWithImpl<_MeshChannel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MeshChannel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hasBlankActualName, hasBlankActualName) ||
                other.hasBlankActualName == hasBlankActualName) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality().equals(other._key, _key) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.uplinkEnabled, uplinkEnabled) ||
                other.uplinkEnabled == uplinkEnabled) &&
            (identical(other.downlinkEnabled, downlinkEnabled) ||
                other.downlinkEnabled == downlinkEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      hasBlankActualName,
      role,
      const DeepCollectionEquality().hash(_key),
      index,
      uplinkEnabled,
      downlinkEnabled);

  @override
  String toString() {
    return 'MeshChannel(name: $name, hasBlankActualName: $hasBlankActualName, role: $role, key: $key, index: $index, uplinkEnabled: $uplinkEnabled, downlinkEnabled: $downlinkEnabled)';
  }
}

/// @nodoc
abstract mixin class _$MeshChannelCopyWith<$Res>
    implements $MeshChannelCopyWith<$Res> {
  factory _$MeshChannelCopyWith(
          _MeshChannel value, $Res Function(_MeshChannel) _then) =
      __$MeshChannelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      bool hasBlankActualName,
      Channel_Role role,
      List<int> key,
      int index,
      bool uplinkEnabled,
      bool downlinkEnabled});
}

/// @nodoc
class __$MeshChannelCopyWithImpl<$Res> implements _$MeshChannelCopyWith<$Res> {
  __$MeshChannelCopyWithImpl(this._self, this._then);

  final _MeshChannel _self;
  final $Res Function(_MeshChannel) _then;

  /// Create a copy of MeshChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? hasBlankActualName = null,
    Object? role = null,
    Object? key = null,
    Object? index = null,
    Object? uplinkEnabled = null,
    Object? downlinkEnabled = null,
  }) {
    return _then(_MeshChannel(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hasBlankActualName: null == hasBlankActualName
          ? _self.hasBlankActualName
          : hasBlankActualName // ignore: cast_nullable_to_non_nullable
              as bool,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as Channel_Role,
      key: null == key
          ? _self._key
          : key // ignore: cast_nullable_to_non_nullable
              as List<int>,
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      uplinkEnabled: null == uplinkEnabled
          ? _self.uplinkEnabled
          : uplinkEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      downlinkEnabled: null == downlinkEnabled
          ? _self.downlinkEnabled
          : downlinkEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
