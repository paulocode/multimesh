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
  bool get used => throw _privateConstructorUsedError;
  List<int> get key => throw _privateConstructorUsedError;

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
  $Res call({String name, bool used, List<int> key});
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
    Object? used = null,
    Object? key = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      used: null == used
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as bool,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as List<int>,
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
  $Res call({String name, bool used, List<int> key});
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
    Object? used = null,
    Object? key = null,
  }) {
    return _then(_$MeshChannelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      used: null == used
          ? _value.used
          : used // ignore: cast_nullable_to_non_nullable
              as bool,
      key: null == key
          ? _value._key
          : key // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$MeshChannelImpl extends _MeshChannel {
  const _$MeshChannelImpl(
      {required this.name, required this.used, required final List<int> key})
      : _key = key,
        super._();

  @override
  final String name;
  @override
  final bool used;
  final List<int> _key;
  @override
  List<int> get key {
    if (_key is EqualUnmodifiableListView) return _key;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_key);
  }

  @override
  String toString() {
    return 'MeshChannel(name: $name, used: $used, key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeshChannelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.used, used) || other.used == used) &&
            const DeepCollectionEquality().equals(other._key, _key));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, used, const DeepCollectionEquality().hash(_key));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeshChannelImplCopyWith<_$MeshChannelImpl> get copyWith =>
      __$$MeshChannelImplCopyWithImpl<_$MeshChannelImpl>(this, _$identity);
}

abstract class _MeshChannel extends MeshChannel {
  const factory _MeshChannel(
      {required final String name,
      required final bool used,
      required final List<int> key}) = _$MeshChannelImpl;
  const _MeshChannel._() : super._();

  @override
  String get name;
  @override
  bool get used;
  @override
  List<int> get key;
  @override
  @JsonKey(ignore: true)
  _$$MeshChannelImplCopyWith<_$MeshChannelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
