// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radio_scan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RadioScanState {
  bool get scanning;
  List<MeshRadio> get meshRadios;

  /// Create a copy of RadioScanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RadioScanStateCopyWith<RadioScanState> get copyWith =>
      _$RadioScanStateCopyWithImpl<RadioScanState>(
          this as RadioScanState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RadioScanState &&
            (identical(other.scanning, scanning) ||
                other.scanning == scanning) &&
            const DeepCollectionEquality()
                .equals(other.meshRadios, meshRadios));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, scanning, const DeepCollectionEquality().hash(meshRadios));

  @override
  String toString() {
    return 'RadioScanState(scanning: $scanning, meshRadios: $meshRadios)';
  }
}

/// @nodoc
abstract mixin class $RadioScanStateCopyWith<$Res> {
  factory $RadioScanStateCopyWith(
          RadioScanState value, $Res Function(RadioScanState) _then) =
      _$RadioScanStateCopyWithImpl;
  @useResult
  $Res call({bool scanning, List<MeshRadio> meshRadios});
}

/// @nodoc
class _$RadioScanStateCopyWithImpl<$Res>
    implements $RadioScanStateCopyWith<$Res> {
  _$RadioScanStateCopyWithImpl(this._self, this._then);

  final RadioScanState _self;
  final $Res Function(RadioScanState) _then;

  /// Create a copy of RadioScanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanning = null,
    Object? meshRadios = null,
  }) {
    return _then(_self.copyWith(
      scanning: null == scanning
          ? _self.scanning
          : scanning // ignore: cast_nullable_to_non_nullable
              as bool,
      meshRadios: null == meshRadios
          ? _self.meshRadios
          : meshRadios // ignore: cast_nullable_to_non_nullable
              as List<MeshRadio>,
    ));
  }
}

/// Adds pattern-matching-related methods to [RadioScanState].
extension RadioScanStatePatterns on RadioScanState {
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
    TResult Function(_RadioScanState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RadioScanState() when $default != null:
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
    TResult Function(_RadioScanState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RadioScanState():
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
    TResult? Function(_RadioScanState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RadioScanState() when $default != null:
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
    TResult Function(bool scanning, List<MeshRadio> meshRadios)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RadioScanState() when $default != null:
        return $default(_that.scanning, _that.meshRadios);
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
    TResult Function(bool scanning, List<MeshRadio> meshRadios) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RadioScanState():
        return $default(_that.scanning, _that.meshRadios);
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
    TResult? Function(bool scanning, List<MeshRadio> meshRadios)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RadioScanState() when $default != null:
        return $default(_that.scanning, _that.meshRadios);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RadioScanState extends RadioScanState {
  const _RadioScanState(
      {this.scanning = false, final List<MeshRadio> meshRadios = const []})
      : _meshRadios = meshRadios,
        super._();

  @override
  @JsonKey()
  final bool scanning;
  final List<MeshRadio> _meshRadios;
  @override
  @JsonKey()
  List<MeshRadio> get meshRadios {
    if (_meshRadios is EqualUnmodifiableListView) return _meshRadios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meshRadios);
  }

  /// Create a copy of RadioScanState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RadioScanStateCopyWith<_RadioScanState> get copyWith =>
      __$RadioScanStateCopyWithImpl<_RadioScanState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RadioScanState &&
            (identical(other.scanning, scanning) ||
                other.scanning == scanning) &&
            const DeepCollectionEquality()
                .equals(other._meshRadios, _meshRadios));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, scanning, const DeepCollectionEquality().hash(_meshRadios));

  @override
  String toString() {
    return 'RadioScanState(scanning: $scanning, meshRadios: $meshRadios)';
  }
}

/// @nodoc
abstract mixin class _$RadioScanStateCopyWith<$Res>
    implements $RadioScanStateCopyWith<$Res> {
  factory _$RadioScanStateCopyWith(
          _RadioScanState value, $Res Function(_RadioScanState) _then) =
      __$RadioScanStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool scanning, List<MeshRadio> meshRadios});
}

/// @nodoc
class __$RadioScanStateCopyWithImpl<$Res>
    implements _$RadioScanStateCopyWith<$Res> {
  __$RadioScanStateCopyWithImpl(this._self, this._then);

  final _RadioScanState _self;
  final $Res Function(_RadioScanState) _then;

  /// Create a copy of RadioScanState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? scanning = null,
    Object? meshRadios = null,
  }) {
    return _then(_RadioScanState(
      scanning: null == scanning
          ? _self.scanning
          : scanning // ignore: cast_nullable_to_non_nullable
              as bool,
      meshRadios: null == meshRadios
          ? _self._meshRadios
          : meshRadios // ignore: cast_nullable_to_non_nullable
              as List<MeshRadio>,
    ));
  }
}

// dart format on
