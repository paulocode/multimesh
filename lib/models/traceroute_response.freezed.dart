// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'traceroute_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TracerouteResponse {
  List<int>? get route => throw _privateConstructorUsedError;
  DateTime? get successTime => throw _privateConstructorUsedError;
  DateTime get attemptTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TracerouteResponseCopyWith<TracerouteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TracerouteResponseCopyWith<$Res> {
  factory $TracerouteResponseCopyWith(
          TracerouteResponse value, $Res Function(TracerouteResponse) then) =
      _$TracerouteResponseCopyWithImpl<$Res, TracerouteResponse>;
  @useResult
  $Res call({List<int>? route, DateTime? successTime, DateTime attemptTime});
}

/// @nodoc
class _$TracerouteResponseCopyWithImpl<$Res, $Val extends TracerouteResponse>
    implements $TracerouteResponseCopyWith<$Res> {
  _$TracerouteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = freezed,
    Object? successTime = freezed,
    Object? attemptTime = null,
  }) {
    return _then(_value.copyWith(
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      successTime: freezed == successTime
          ? _value.successTime
          : successTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      attemptTime: null == attemptTime
          ? _value.attemptTime
          : attemptTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TracerouteResponseImplCopyWith<$Res>
    implements $TracerouteResponseCopyWith<$Res> {
  factory _$$TracerouteResponseImplCopyWith(_$TracerouteResponseImpl value,
          $Res Function(_$TracerouteResponseImpl) then) =
      __$$TracerouteResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int>? route, DateTime? successTime, DateTime attemptTime});
}

/// @nodoc
class __$$TracerouteResponseImplCopyWithImpl<$Res>
    extends _$TracerouteResponseCopyWithImpl<$Res, _$TracerouteResponseImpl>
    implements _$$TracerouteResponseImplCopyWith<$Res> {
  __$$TracerouteResponseImplCopyWithImpl(_$TracerouteResponseImpl _value,
      $Res Function(_$TracerouteResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = freezed,
    Object? successTime = freezed,
    Object? attemptTime = null,
  }) {
    return _then(_$TracerouteResponseImpl(
      route: freezed == route
          ? _value._route
          : route // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      successTime: freezed == successTime
          ? _value.successTime
          : successTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      attemptTime: null == attemptTime
          ? _value.attemptTime
          : attemptTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$TracerouteResponseImpl extends _TracerouteResponse {
  const _$TracerouteResponseImpl(
      {final List<int>? route, this.successTime, required this.attemptTime})
      : _route = route,
        super._();

  final List<int>? _route;
  @override
  List<int>? get route {
    final value = _route;
    if (value == null) return null;
    if (_route is EqualUnmodifiableListView) return _route;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? successTime;
  @override
  final DateTime attemptTime;

  @override
  String toString() {
    return 'TracerouteResponse(route: $route, successTime: $successTime, attemptTime: $attemptTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TracerouteResponseImpl &&
            const DeepCollectionEquality().equals(other._route, _route) &&
            (identical(other.successTime, successTime) ||
                other.successTime == successTime) &&
            (identical(other.attemptTime, attemptTime) ||
                other.attemptTime == attemptTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_route), successTime, attemptTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TracerouteResponseImplCopyWith<_$TracerouteResponseImpl> get copyWith =>
      __$$TracerouteResponseImplCopyWithImpl<_$TracerouteResponseImpl>(
          this, _$identity);
}

abstract class _TracerouteResponse extends TracerouteResponse {
  const factory _TracerouteResponse(
      {final List<int>? route,
      final DateTime? successTime,
      required final DateTime attemptTime}) = _$TracerouteResponseImpl;
  const _TracerouteResponse._() : super._();

  @override
  List<int>? get route;
  @override
  DateTime? get successTime;
  @override
  DateTime get attemptTime;
  @override
  @JsonKey(ignore: true)
  _$$TracerouteResponseImplCopyWith<_$TracerouteResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
