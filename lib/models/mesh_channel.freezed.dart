// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mesh_channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MeshChannel {
  String get name => throw _privateConstructorUsedError;
  bool get hasBlankActualName => throw _privateConstructorUsedError;
  Channel_Role get role => throw _privateConstructorUsedError;
  List<int> get key => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  bool get uplinkEnabled => throw _privateConstructorUsedError;
  bool get downlinkEnabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MeshChannelCopyWith<MeshChannel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeshChannelCopyWith<$Res> {
  factory $MeshChannelCopyWith(
          MeshChannel value, $Res Function(MeshChannel) then) =
      _$MeshChannelCopyWithImpl<$Res, MeshChannel>;
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
class _$MeshChannelCopyWithImpl<$Res, $Val extends MeshChannel>
    implements $MeshChannelCopyWith<$Res> {
  _$MeshChannelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hasBlankActualName: null == hasBlankActualName
          ? _value.hasBlankActualName
          : hasBlankActualName // ignore: cast_nullable_to_non_nullable
              as bool,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Channel_Role,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as List<int>,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      uplinkEnabled: null == uplinkEnabled
          ? _value.uplinkEnabled
          : uplinkEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      downlinkEnabled: null == downlinkEnabled
          ? _value.downlinkEnabled
          : downlinkEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeshChannelImplCopyWith<$Res>
    implements $MeshChannelCopyWith<$Res> {
  factory _$$MeshChannelImplCopyWith(
          _$MeshChannelImpl value, $Res Function(_$MeshChannelImpl) then) =
      __$$MeshChannelImplCopyWithImpl<$Res>;
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
class __$$MeshChannelImplCopyWithImpl<$Res>
    extends _$MeshChannelCopyWithImpl<$Res, _$MeshChannelImpl>
    implements _$$MeshChannelImplCopyWith<$Res> {
  __$$MeshChannelImplCopyWithImpl(
      _$MeshChannelImpl _value, $Res Function(_$MeshChannelImpl) _then)
      : super(_value, _then);

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
    return _then(_$MeshChannelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hasBlankActualName: null == hasBlankActualName
          ? _value.hasBlankActualName
          : hasBlankActualName // ignore: cast_nullable_to_non_nullable
              as bool,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Channel_Role,
      key: null == key
          ? _value._key
          : key // ignore: cast_nullable_to_non_nullable
              as List<int>,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      uplinkEnabled: null == uplinkEnabled
          ? _value.uplinkEnabled
          : uplinkEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      downlinkEnabled: null == downlinkEnabled
          ? _value.downlinkEnabled
          : downlinkEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MeshChannelImpl extends _MeshChannel {
  const _$MeshChannelImpl(
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

  @override
  String toString() {
    return 'MeshChannel(name: $name, hasBlankActualName: $hasBlankActualName, role: $role, key: $key, index: $index, uplinkEnabled: $uplinkEnabled, downlinkEnabled: $downlinkEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeshChannelImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeshChannelImplCopyWith<_$MeshChannelImpl> get copyWith =>
      __$$MeshChannelImplCopyWithImpl<_$MeshChannelImpl>(this, _$identity);
}

abstract class _MeshChannel extends MeshChannel {
  const factory _MeshChannel(
      {required final String name,
      final bool hasBlankActualName,
      required final Channel_Role role,
      required final List<int> key,
      required final int index,
      required final bool uplinkEnabled,
      required final bool downlinkEnabled}) = _$MeshChannelImpl;
  const _MeshChannel._() : super._();

  @override
  String get name;
  @override
  bool get hasBlankActualName;
  @override
  Channel_Role get role;
  @override
  List<int> get key;
  @override
  int get index;
  @override
  bool get uplinkEnabled;
  @override
  bool get downlinkEnabled;
  @override
  @JsonKey(ignore: true)
  _$$MeshChannelImplCopyWith<_$MeshChannelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
