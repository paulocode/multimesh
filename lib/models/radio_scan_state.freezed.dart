// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radio_scan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RadioScanState {
  bool get scanning => throw _privateConstructorUsedError;
  List<BleMeshRadio> get meshRadios => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RadioScanStateCopyWith<RadioScanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RadioScanStateCopyWith<$Res> {
  factory $RadioScanStateCopyWith(
          RadioScanState value, $Res Function(RadioScanState) then) =
      _$RadioScanStateCopyWithImpl<$Res, RadioScanState>;
  @useResult
  $Res call({bool scanning, List<BleMeshRadio> meshRadios});
}

/// @nodoc
class _$RadioScanStateCopyWithImpl<$Res, $Val extends RadioScanState>
    implements $RadioScanStateCopyWith<$Res> {
  _$RadioScanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanning = null,
    Object? meshRadios = null,
  }) {
    return _then(_value.copyWith(
      scanning: null == scanning
          ? _value.scanning
          : scanning // ignore: cast_nullable_to_non_nullable
              as bool,
      meshRadios: null == meshRadios
          ? _value.meshRadios
          : meshRadios // ignore: cast_nullable_to_non_nullable
              as List<BleMeshRadio>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RadioScanStateImplCopyWith<$Res>
    implements $RadioScanStateCopyWith<$Res> {
  factory _$$RadioScanStateImplCopyWith(_$RadioScanStateImpl value,
          $Res Function(_$RadioScanStateImpl) then) =
      __$$RadioScanStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool scanning, List<BleMeshRadio> meshRadios});
}

/// @nodoc
class __$$RadioScanStateImplCopyWithImpl<$Res>
    extends _$RadioScanStateCopyWithImpl<$Res, _$RadioScanStateImpl>
    implements _$$RadioScanStateImplCopyWith<$Res> {
  __$$RadioScanStateImplCopyWithImpl(
      _$RadioScanStateImpl _value, $Res Function(_$RadioScanStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scanning = null,
    Object? meshRadios = null,
  }) {
    return _then(_$RadioScanStateImpl(
      scanning: null == scanning
          ? _value.scanning
          : scanning // ignore: cast_nullable_to_non_nullable
              as bool,
      meshRadios: null == meshRadios
          ? _value._meshRadios
          : meshRadios // ignore: cast_nullable_to_non_nullable
              as List<BleMeshRadio>,
    ));
  }
}

/// @nodoc

class _$RadioScanStateImpl extends _RadioScanState {
  const _$RadioScanStateImpl(
      {this.scanning = false, final List<BleMeshRadio> meshRadios = const []})
      : _meshRadios = meshRadios,
        super._();

  @override
  @JsonKey()
  final bool scanning;
  final List<BleMeshRadio> _meshRadios;
  @override
  @JsonKey()
  List<BleMeshRadio> get meshRadios {
    if (_meshRadios is EqualUnmodifiableListView) return _meshRadios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meshRadios);
  }

  @override
  String toString() {
    return 'RadioScanState(scanning: $scanning, meshRadios: $meshRadios)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RadioScanStateImpl &&
            (identical(other.scanning, scanning) ||
                other.scanning == scanning) &&
            const DeepCollectionEquality()
                .equals(other._meshRadios, _meshRadios));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, scanning, const DeepCollectionEquality().hash(_meshRadios));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RadioScanStateImplCopyWith<_$RadioScanStateImpl> get copyWith =>
      __$$RadioScanStateImplCopyWithImpl<_$RadioScanStateImpl>(
          this, _$identity);
}

abstract class _RadioScanState extends RadioScanState {
  const factory _RadioScanState(
      {final bool scanning,
      final List<BleMeshRadio> meshRadios}) = _$RadioScanStateImpl;
  const _RadioScanState._() : super._();

  @override
  bool get scanning;
  @override
  List<BleMeshRadio> get meshRadios;
  @override
  @JsonKey(ignore: true)
  _$$RadioScanStateImplCopyWith<_$RadioScanStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
