// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'telemetry_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TelemetryState {
  double? get temp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TelemetryStateCopyWith<TelemetryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TelemetryStateCopyWith<$Res> {
  factory $TelemetryStateCopyWith(
          TelemetryState value, $Res Function(TelemetryState) then) =
      _$TelemetryStateCopyWithImpl<$Res, TelemetryState>;
  @useResult
  $Res call({double? temp});
}

/// @nodoc
class _$TelemetryStateCopyWithImpl<$Res, $Val extends TelemetryState>
    implements $TelemetryStateCopyWith<$Res> {
  _$TelemetryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = freezed,
  }) {
    return _then(_value.copyWith(
      temp: freezed == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TelemetryStateImplCopyWith<$Res>
    implements $TelemetryStateCopyWith<$Res> {
  factory _$$TelemetryStateImplCopyWith(_$TelemetryStateImpl value,
          $Res Function(_$TelemetryStateImpl) then) =
      __$$TelemetryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? temp});
}

/// @nodoc
class __$$TelemetryStateImplCopyWithImpl<$Res>
    extends _$TelemetryStateCopyWithImpl<$Res, _$TelemetryStateImpl>
    implements _$$TelemetryStateImplCopyWith<$Res> {
  __$$TelemetryStateImplCopyWithImpl(
      _$TelemetryStateImpl _value, $Res Function(_$TelemetryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = freezed,
  }) {
    return _then(_$TelemetryStateImpl(
      temp: freezed == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$TelemetryStateImpl extends _TelemetryState {
  const _$TelemetryStateImpl({this.temp}) : super._();

  @override
  final double? temp;

  @override
  String toString() {
    return 'TelemetryState(temp: $temp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TelemetryStateImpl &&
            (identical(other.temp, temp) || other.temp == temp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, temp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TelemetryStateImplCopyWith<_$TelemetryStateImpl> get copyWith =>
      __$$TelemetryStateImplCopyWithImpl<_$TelemetryStateImpl>(
          this, _$identity);
}

abstract class _TelemetryState extends TelemetryState {
  const factory _TelemetryState({final double? temp}) = _$TelemetryStateImpl;
  const _TelemetryState._() : super._();

  @override
  double? get temp;
  @override
  @JsonKey(ignore: true)
  _$$TelemetryStateImplCopyWith<_$TelemetryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
