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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RadioConfiguration {
  String get shortName => throw _privateConstructorUsedError;

  String get longName => throw _privateConstructorUsedError;

  int get myNodeNum => throw _privateConstructorUsedError;

  HardwareModel get hwModel => throw _privateConstructorUsedError;

  Config_LoRaConfig_RegionCode get region => throw _privateConstructorUsedError;

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
      {String shortName,
      String longName,
      int myNodeNum,
      HardwareModel hwModel,
      Config_LoRaConfig_RegionCode region,
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
    Object? shortName = null,
    Object? longName = null,
    Object? myNodeNum = null,
    Object? hwModel = null,
    Object? region = null,
    Object? configDownloaded = null,
  }) {
    return _then(_value.copyWith(
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      longName: null == longName
          ? _value.longName
          : longName // ignore: cast_nullable_to_non_nullable
              as String,
      myNodeNum: null == myNodeNum
          ? _value.myNodeNum
          : myNodeNum // ignore: cast_nullable_to_non_nullable
              as int,
      hwModel: null == hwModel
          ? _value.hwModel
          : hwModel // ignore: cast_nullable_to_non_nullable
              as HardwareModel,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as Config_LoRaConfig_RegionCode,
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
      {String shortName,
      String longName,
      int myNodeNum,
      HardwareModel hwModel,
      Config_LoRaConfig_RegionCode region,
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
    Object? shortName = null,
    Object? longName = null,
    Object? myNodeNum = null,
    Object? hwModel = null,
    Object? region = null,
    Object? configDownloaded = null,
  }) {
    return _then(_$RadioConfigurationImpl(
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      longName: null == longName
          ? _value.longName
          : longName // ignore: cast_nullable_to_non_nullable
              as String,
      myNodeNum: null == myNodeNum
          ? _value.myNodeNum
          : myNodeNum // ignore: cast_nullable_to_non_nullable
              as int,
      hwModel: null == hwModel
          ? _value.hwModel
          : hwModel // ignore: cast_nullable_to_non_nullable
              as HardwareModel,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as Config_LoRaConfig_RegionCode,
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
      {this.shortName = '',
      this.longName = '',
      this.myNodeNum = 0,
      this.hwModel = HardwareModel.UNSET,
      this.region = Config_LoRaConfig_RegionCode.UNSET,
      this.configDownloaded = false})
      : super._();

  @override
  @JsonKey()
  final String shortName;
  @override
  @JsonKey()
  final String longName;
  @override
  @JsonKey()
  final int myNodeNum;
  @override
  @JsonKey()
  final HardwareModel hwModel;
  @override
  @JsonKey()
  final Config_LoRaConfig_RegionCode region;
  @override
  @JsonKey()
  final bool configDownloaded;

  @override
  String toString() {
    return 'RadioConfiguration(shortName: $shortName, longName: $longName, myNodeNum: $myNodeNum, hwModel: $hwModel, region: $region, configDownloaded: $configDownloaded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RadioConfigurationImpl &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.longName, longName) ||
                other.longName == longName) &&
            (identical(other.myNodeNum, myNodeNum) ||
                other.myNodeNum == myNodeNum) &&
            (identical(other.hwModel, hwModel) || other.hwModel == hwModel) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.configDownloaded, configDownloaded) ||
                other.configDownloaded == configDownloaded));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shortName, longName, myNodeNum,
      hwModel, region, configDownloaded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RadioConfigurationImplCopyWith<_$RadioConfigurationImpl> get copyWith =>
      __$$RadioConfigurationImplCopyWithImpl<_$RadioConfigurationImpl>(
          this, _$identity);
}

abstract class _RadioConfiguration extends RadioConfiguration {
  const factory _RadioConfiguration(
      {final String shortName,
      final String longName,
      final int myNodeNum,
      final HardwareModel hwModel,
      final Config_LoRaConfig_RegionCode region,
      final bool configDownloaded}) = _$RadioConfigurationImpl;

  const _RadioConfiguration._() : super._();

  @override
  String get shortName;

  @override
  String get longName;

  @override
  int get myNodeNum;

  @override
  HardwareModel get hwModel;

  @override
  Config_LoRaConfig_RegionCode get region;

  @override
  bool get configDownloaded;

  @override
  @JsonKey(ignore: true)
  _$$RadioConfigurationImplCopyWith<_$RadioConfigurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
