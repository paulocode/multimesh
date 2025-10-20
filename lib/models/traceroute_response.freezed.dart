// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'traceroute_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TracerouteResponse {
  List<int>? get route;
  DateTime? get successTime;
  DateTime get attemptTime;

  /// Create a copy of TracerouteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TracerouteResponseCopyWith<TracerouteResponse> get copyWith =>
      _$TracerouteResponseCopyWithImpl<TracerouteResponse>(
          this as TracerouteResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TracerouteResponse &&
            const DeepCollectionEquality().equals(other.route, route) &&
            (identical(other.successTime, successTime) ||
                other.successTime == successTime) &&
            (identical(other.attemptTime, attemptTime) ||
                other.attemptTime == attemptTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(route), successTime, attemptTime);

  @override
  String toString() {
    return 'TracerouteResponse(route: $route, successTime: $successTime, attemptTime: $attemptTime)';
  }
}

/// @nodoc
abstract mixin class $TracerouteResponseCopyWith<$Res> {
  factory $TracerouteResponseCopyWith(
          TracerouteResponse value, $Res Function(TracerouteResponse) _then) =
      _$TracerouteResponseCopyWithImpl;
  @useResult
  $Res call({List<int>? route, DateTime? successTime, DateTime attemptTime});
}

/// @nodoc
class _$TracerouteResponseCopyWithImpl<$Res>
    implements $TracerouteResponseCopyWith<$Res> {
  _$TracerouteResponseCopyWithImpl(this._self, this._then);

  final TracerouteResponse _self;
  final $Res Function(TracerouteResponse) _then;

  /// Create a copy of TracerouteResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = freezed,
    Object? successTime = freezed,
    Object? attemptTime = null,
  }) {
    return _then(_self.copyWith(
      route: freezed == route
          ? _self.route
          : route // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      successTime: freezed == successTime
          ? _self.successTime
          : successTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      attemptTime: null == attemptTime
          ? _self.attemptTime
          : attemptTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [TracerouteResponse].
extension TracerouteResponsePatterns on TracerouteResponse {
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
    TResult Function(_TracerouteResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TracerouteResponse() when $default != null:
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
    TResult Function(_TracerouteResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TracerouteResponse():
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
    TResult? Function(_TracerouteResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TracerouteResponse() when $default != null:
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
            List<int>? route, DateTime? successTime, DateTime attemptTime)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TracerouteResponse() when $default != null:
        return $default(_that.route, _that.successTime, _that.attemptTime);
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
            List<int>? route, DateTime? successTime, DateTime attemptTime)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TracerouteResponse():
        return $default(_that.route, _that.successTime, _that.attemptTime);
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
            List<int>? route, DateTime? successTime, DateTime attemptTime)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TracerouteResponse() when $default != null:
        return $default(_that.route, _that.successTime, _that.attemptTime);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TracerouteResponse extends TracerouteResponse {
  const _TracerouteResponse(
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

  /// Create a copy of TracerouteResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TracerouteResponseCopyWith<_TracerouteResponse> get copyWith =>
      __$TracerouteResponseCopyWithImpl<_TracerouteResponse>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TracerouteResponse &&
            const DeepCollectionEquality().equals(other._route, _route) &&
            (identical(other.successTime, successTime) ||
                other.successTime == successTime) &&
            (identical(other.attemptTime, attemptTime) ||
                other.attemptTime == attemptTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_route), successTime, attemptTime);

  @override
  String toString() {
    return 'TracerouteResponse(route: $route, successTime: $successTime, attemptTime: $attemptTime)';
  }
}

/// @nodoc
abstract mixin class _$TracerouteResponseCopyWith<$Res>
    implements $TracerouteResponseCopyWith<$Res> {
  factory _$TracerouteResponseCopyWith(
          _TracerouteResponse value, $Res Function(_TracerouteResponse) _then) =
      __$TracerouteResponseCopyWithImpl;
  @override
  @useResult
  $Res call({List<int>? route, DateTime? successTime, DateTime attemptTime});
}

/// @nodoc
class __$TracerouteResponseCopyWithImpl<$Res>
    implements _$TracerouteResponseCopyWith<$Res> {
  __$TracerouteResponseCopyWithImpl(this._self, this._then);

  final _TracerouteResponse _self;
  final $Res Function(_TracerouteResponse) _then;

  /// Create a copy of TracerouteResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? route = freezed,
    Object? successTime = freezed,
    Object? attemptTime = null,
  }) {
    return _then(_TracerouteResponse(
      route: freezed == route
          ? _self._route
          : route // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      successTime: freezed == successTime
          ? _self.successTime
          : successTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      attemptTime: null == attemptTime
          ? _self.attemptTime
          : attemptTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
