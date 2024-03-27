// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radio_configuration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RadioConfiguration {
  int get myNodeNum => throw _privateConstructorUsedError;
  Config_LoRaConfig get loraConfig => throw _privateConstructorUsedError;
  NodeInfo get myNodeInfo => throw _privateConstructorUsedError;
  bool get hasOwnNodeInfo => throw _privateConstructorUsedError;
  bool get configDownloaded => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RadioConfigurationCopyWith<RadioConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RadioConfigurationCopyWith<$Res> {
  factory $RadioConfigurationCopyWith(
          RadioConfiguration value, $Res Function(RadioConfiguration) then) =
      _$RadioConfigurationCopyWithImpl<$Res, RadioConfiguration>;
  @useResult
  $Res call(
      {int myNodeNum,
      Config_LoRaConfig loraConfig,
      NodeInfo myNodeInfo,
      bool hasOwnNodeInfo,
      bool configDownloaded});
}

/// @nodoc
class _$RadioConfigurationCopyWithImpl<$Res, $Val extends RadioConfiguration>
    implements $RadioConfigurationCopyWith<$Res> {
  _$RadioConfigurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myNodeNum = null,
    Object? loraConfig = null,
    Object? myNodeInfo = null,
    Object? hasOwnNodeInfo = null,
    Object? configDownloaded = null,
  }) {
    return _then(_value.copyWith(
      myNodeNum: null == myNodeNum
          ? _value.myNodeNum
          : myNodeNum // ignore: cast_nullable_to_non_nullable
              as int,
      loraConfig: null == loraConfig
          ? _value.loraConfig
          : loraConfig // ignore: cast_nullable_to_non_nullable
              as Config_LoRaConfig,
      myNodeInfo: null == myNodeInfo
          ? _value.myNodeInfo
          : myNodeInfo // ignore: cast_nullable_to_non_nullable
              as NodeInfo,
      hasOwnNodeInfo: null == hasOwnNodeInfo
          ? _value.hasOwnNodeInfo
          : hasOwnNodeInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      configDownloaded: null == configDownloaded
          ? _value.configDownloaded
          : configDownloaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RadioConfigurationImplCopyWith<$Res>
    implements $RadioConfigurationCopyWith<$Res> {
  factory _$$RadioConfigurationImplCopyWith(_$RadioConfigurationImpl value,
          $Res Function(_$RadioConfigurationImpl) then) =
      __$$RadioConfigurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int myNodeNum,
      Config_LoRaConfig loraConfig,
      NodeInfo myNodeInfo,
      bool hasOwnNodeInfo,
      bool configDownloaded});
}

/// @nodoc
class __$$RadioConfigurationImplCopyWithImpl<$Res>
    extends _$RadioConfigurationCopyWithImpl<$Res, _$RadioConfigurationImpl>
    implements _$$RadioConfigurationImplCopyWith<$Res> {
  __$$RadioConfigurationImplCopyWithImpl(_$RadioConfigurationImpl _value,
      $Res Function(_$RadioConfigurationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myNodeNum = null,
    Object? loraConfig = null,
    Object? myNodeInfo = null,
    Object? hasOwnNodeInfo = null,
    Object? configDownloaded = null,
  }) {
    return _then(_$RadioConfigurationImpl(
      myNodeNum: null == myNodeNum
          ? _value.myNodeNum
          : myNodeNum // ignore: cast_nullable_to_non_nullable
              as int,
      loraConfig: null == loraConfig
          ? _value.loraConfig
          : loraConfig // ignore: cast_nullable_to_non_nullable
              as Config_LoRaConfig,
      myNodeInfo: null == myNodeInfo
          ? _value.myNodeInfo
          : myNodeInfo // ignore: cast_nullable_to_non_nullable
              as NodeInfo,
      hasOwnNodeInfo: null == hasOwnNodeInfo
          ? _value.hasOwnNodeInfo
          : hasOwnNodeInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      configDownloaded: null == configDownloaded
          ? _value.configDownloaded
          : configDownloaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RadioConfigurationImpl extends _RadioConfiguration {
  const _$RadioConfigurationImpl(
      {this.myNodeNum = 0,
      required this.loraConfig,
      required this.myNodeInfo,
      this.hasOwnNodeInfo = false,
      this.configDownloaded = false})
      : super._();

  @override
  @JsonKey()
  final int myNodeNum;
  @override
  final Config_LoRaConfig loraConfig;
  @override
  final NodeInfo myNodeInfo;
  @override
  @JsonKey()
  final bool hasOwnNodeInfo;
  @override
  @JsonKey()
  final bool configDownloaded;

  @override
  String toString() {
    return 'RadioConfiguration(myNodeNum: $myNodeNum, loraConfig: $loraConfig, myNodeInfo: $myNodeInfo, hasOwnNodeInfo: $hasOwnNodeInfo, configDownloaded: $configDownloaded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RadioConfigurationImpl &&
            (identical(other.myNodeNum, myNodeNum) ||
                other.myNodeNum == myNodeNum) &&
            (identical(other.loraConfig, loraConfig) ||
                other.loraConfig == loraConfig) &&
            (identical(other.myNodeInfo, myNodeInfo) ||
                other.myNodeInfo == myNodeInfo) &&
            (identical(other.hasOwnNodeInfo, hasOwnNodeInfo) ||
                other.hasOwnNodeInfo == hasOwnNodeInfo) &&
            (identical(other.configDownloaded, configDownloaded) ||
                other.configDownloaded == configDownloaded));
  }

  @override
  int get hashCode => Object.hash(runtimeType, myNodeNum, loraConfig,
      myNodeInfo, hasOwnNodeInfo, configDownloaded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RadioConfigurationImplCopyWith<_$RadioConfigurationImpl> get copyWith =>
      __$$RadioConfigurationImplCopyWithImpl<_$RadioConfigurationImpl>(
          this, _$identity);
}

abstract class _RadioConfiguration extends RadioConfiguration {
  const factory _RadioConfiguration(
      {final int myNodeNum,
      required final Config_LoRaConfig loraConfig,
      required final NodeInfo myNodeInfo,
      final bool hasOwnNodeInfo,
      final bool configDownloaded}) = _$RadioConfigurationImpl;
  const _RadioConfiguration._() : super._();

  @override
  int get myNodeNum;
  @override
  Config_LoRaConfig get loraConfig;
  @override
  NodeInfo get myNodeInfo;
  @override
  bool get hasOwnNodeInfo;
  @override
  bool get configDownloaded;
  @override
  @JsonKey(ignore: true)
  _$$RadioConfigurationImplCopyWith<_$RadioConfigurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
