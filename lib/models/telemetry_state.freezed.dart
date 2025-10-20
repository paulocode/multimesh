// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'telemetry_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TelemetryState {
  double? get temp;
  double? get relativeHumidity;
  double? get barometricPressure;
  double? get gasResistance;

  /// Create a copy of TelemetryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TelemetryStateCopyWith<TelemetryState> get copyWith =>
      _$TelemetryStateCopyWithImpl<TelemetryState>(
          this as TelemetryState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TelemetryState &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.relativeHumidity, relativeHumidity) ||
                other.relativeHumidity == relativeHumidity) &&
            (identical(other.barometricPressure, barometricPressure) ||
                other.barometricPressure == barometricPressure) &&
            (identical(other.gasResistance, gasResistance) ||
                other.gasResistance == gasResistance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, temp, relativeHumidity, barometricPressure, gasResistance);

  @override
  String toString() {
    return 'TelemetryState(temp: $temp, relativeHumidity: $relativeHumidity, barometricPressure: $barometricPressure, gasResistance: $gasResistance)';
  }
}

/// @nodoc
abstract mixin class $TelemetryStateCopyWith<$Res> {
  factory $TelemetryStateCopyWith(
          TelemetryState value, $Res Function(TelemetryState) _then) =
      _$TelemetryStateCopyWithImpl;
  @useResult
  $Res call(
      {double? temp,
      double? relativeHumidity,
      double? barometricPressure,
      double? gasResistance});
}

/// @nodoc
class _$TelemetryStateCopyWithImpl<$Res>
    implements $TelemetryStateCopyWith<$Res> {
  _$TelemetryStateCopyWithImpl(this._self, this._then);

  final TelemetryState _self;
  final $Res Function(TelemetryState) _then;

  /// Create a copy of TelemetryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = freezed,
    Object? relativeHumidity = freezed,
    Object? barometricPressure = freezed,
    Object? gasResistance = freezed,
  }) {
    return _then(_self.copyWith(
      temp: freezed == temp
          ? _self.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double?,
      relativeHumidity: freezed == relativeHumidity
          ? _self.relativeHumidity
          : relativeHumidity // ignore: cast_nullable_to_non_nullable
              as double?,
      barometricPressure: freezed == barometricPressure
          ? _self.barometricPressure
          : barometricPressure // ignore: cast_nullable_to_non_nullable
              as double?,
      gasResistance: freezed == gasResistance
          ? _self.gasResistance
          : gasResistance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// Adds pattern-matching-related methods to [TelemetryState].
extension TelemetryStatePatterns on TelemetryState {
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
    TResult Function(_TelemetryState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TelemetryState() when $default != null:
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
    TResult Function(_TelemetryState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TelemetryState():
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
    TResult? Function(_TelemetryState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TelemetryState() when $default != null:
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
    TResult Function(double? temp, double? relativeHumidity,
            double? barometricPressure, double? gasResistance)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TelemetryState() when $default != null:
        return $default(_that.temp, _that.relativeHumidity,
            _that.barometricPressure, _that.gasResistance);
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
    TResult Function(double? temp, double? relativeHumidity,
            double? barometricPressure, double? gasResistance)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TelemetryState():
        return $default(_that.temp, _that.relativeHumidity,
            _that.barometricPressure, _that.gasResistance);
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
    TResult? Function(double? temp, double? relativeHumidity,
            double? barometricPressure, double? gasResistance)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TelemetryState() when $default != null:
        return $default(_that.temp, _that.relativeHumidity,
            _that.barometricPressure, _that.gasResistance);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TelemetryState extends TelemetryState {
  const _TelemetryState(
      {this.temp,
      this.relativeHumidity,
      this.barometricPressure,
      this.gasResistance})
      : super._();

  @override
  final double? temp;
  @override
  final double? relativeHumidity;
  @override
  final double? barometricPressure;
  @override
  final double? gasResistance;

  /// Create a copy of TelemetryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TelemetryStateCopyWith<_TelemetryState> get copyWith =>
      __$TelemetryStateCopyWithImpl<_TelemetryState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TelemetryState &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.relativeHumidity, relativeHumidity) ||
                other.relativeHumidity == relativeHumidity) &&
            (identical(other.barometricPressure, barometricPressure) ||
                other.barometricPressure == barometricPressure) &&
            (identical(other.gasResistance, gasResistance) ||
                other.gasResistance == gasResistance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, temp, relativeHumidity, barometricPressure, gasResistance);

  @override
  String toString() {
    return 'TelemetryState(temp: $temp, relativeHumidity: $relativeHumidity, barometricPressure: $barometricPressure, gasResistance: $gasResistance)';
  }
}

/// @nodoc
abstract mixin class _$TelemetryStateCopyWith<$Res>
    implements $TelemetryStateCopyWith<$Res> {
  factory _$TelemetryStateCopyWith(
          _TelemetryState value, $Res Function(_TelemetryState) _then) =
      __$TelemetryStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double? temp,
      double? relativeHumidity,
      double? barometricPressure,
      double? gasResistance});
}

/// @nodoc
class __$TelemetryStateCopyWithImpl<$Res>
    implements _$TelemetryStateCopyWith<$Res> {
  __$TelemetryStateCopyWithImpl(this._self, this._then);

  final _TelemetryState _self;
  final $Res Function(_TelemetryState) _then;

  /// Create a copy of TelemetryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? temp = freezed,
    Object? relativeHumidity = freezed,
    Object? barometricPressure = freezed,
    Object? gasResistance = freezed,
  }) {
    return _then(_TelemetryState(
      temp: freezed == temp
          ? _self.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double?,
      relativeHumidity: freezed == relativeHumidity
          ? _self.relativeHumidity
          : relativeHumidity // ignore: cast_nullable_to_non_nullable
              as double?,
      barometricPressure: freezed == barometricPressure
          ? _self.barometricPressure
          : barometricPressure // ignore: cast_nullable_to_non_nullable
              as double?,
      gasResistance: freezed == gasResistance
          ? _self.gasResistance
          : gasResistance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

// dart format on
