// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radio_configuration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RadioConfiguration {
  int get myNodeNum;
  Config_LoRaConfig get loraConfig;
  Config_BluetoothConfig get bluetoothConfig;
  ModuleConfig_TelemetryConfig get telemetryConfig;
  NodeInfo get myNodeInfo;
  bool get hasOwnNodeInfo;
  bool get configDownloaded;

  /// Create a copy of RadioConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RadioConfigurationCopyWith<RadioConfiguration> get copyWith =>
      _$RadioConfigurationCopyWithImpl<RadioConfiguration>(
          this as RadioConfiguration, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RadioConfiguration &&
            (identical(other.myNodeNum, myNodeNum) ||
                other.myNodeNum == myNodeNum) &&
            (identical(other.loraConfig, loraConfig) ||
                other.loraConfig == loraConfig) &&
            (identical(other.bluetoothConfig, bluetoothConfig) ||
                other.bluetoothConfig == bluetoothConfig) &&
            (identical(other.telemetryConfig, telemetryConfig) ||
                other.telemetryConfig == telemetryConfig) &&
            (identical(other.myNodeInfo, myNodeInfo) ||
                other.myNodeInfo == myNodeInfo) &&
            (identical(other.hasOwnNodeInfo, hasOwnNodeInfo) ||
                other.hasOwnNodeInfo == hasOwnNodeInfo) &&
            (identical(other.configDownloaded, configDownloaded) ||
                other.configDownloaded == configDownloaded));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      myNodeNum,
      loraConfig,
      bluetoothConfig,
      telemetryConfig,
      myNodeInfo,
      hasOwnNodeInfo,
      configDownloaded);

  @override
  String toString() {
    return 'RadioConfiguration(myNodeNum: $myNodeNum, loraConfig: $loraConfig, bluetoothConfig: $bluetoothConfig, telemetryConfig: $telemetryConfig, myNodeInfo: $myNodeInfo, hasOwnNodeInfo: $hasOwnNodeInfo, configDownloaded: $configDownloaded)';
  }
}

/// @nodoc
abstract mixin class $RadioConfigurationCopyWith<$Res> {
  factory $RadioConfigurationCopyWith(
          RadioConfiguration value, $Res Function(RadioConfiguration) _then) =
      _$RadioConfigurationCopyWithImpl;
  @useResult
  $Res call(
      {int myNodeNum,
      Config_LoRaConfig loraConfig,
      Config_BluetoothConfig bluetoothConfig,
      ModuleConfig_TelemetryConfig telemetryConfig,
      NodeInfo myNodeInfo,
      bool hasOwnNodeInfo,
      bool configDownloaded});
}

/// @nodoc
class _$RadioConfigurationCopyWithImpl<$Res>
    implements $RadioConfigurationCopyWith<$Res> {
  _$RadioConfigurationCopyWithImpl(this._self, this._then);

  final RadioConfiguration _self;
  final $Res Function(RadioConfiguration) _then;

  /// Create a copy of RadioConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myNodeNum = null,
    Object? loraConfig = null,
    Object? bluetoothConfig = null,
    Object? telemetryConfig = null,
    Object? myNodeInfo = null,
    Object? hasOwnNodeInfo = null,
    Object? configDownloaded = null,
  }) {
    return _then(_self.copyWith(
      myNodeNum: null == myNodeNum
          ? _self.myNodeNum
          : myNodeNum // ignore: cast_nullable_to_non_nullable
              as int,
      loraConfig: null == loraConfig
          ? _self.loraConfig
          : loraConfig // ignore: cast_nullable_to_non_nullable
              as Config_LoRaConfig,
      bluetoothConfig: null == bluetoothConfig
          ? _self.bluetoothConfig
          : bluetoothConfig // ignore: cast_nullable_to_non_nullable
              as Config_BluetoothConfig,
      telemetryConfig: null == telemetryConfig
          ? _self.telemetryConfig
          : telemetryConfig // ignore: cast_nullable_to_non_nullable
              as ModuleConfig_TelemetryConfig,
      myNodeInfo: null == myNodeInfo
          ? _self.myNodeInfo
          : myNodeInfo // ignore: cast_nullable_to_non_nullable
              as NodeInfo,
      hasOwnNodeInfo: null == hasOwnNodeInfo
          ? _self.hasOwnNodeInfo
          : hasOwnNodeInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      configDownloaded: null == configDownloaded
          ? _self.configDownloaded
          : configDownloaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [RadioConfiguration].
extension RadioConfigurationPatterns on RadioConfiguration {
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
    TResult Function(_RadioConfiguration value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RadioConfiguration() when $default != null:
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
    TResult Function(_RadioConfiguration value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RadioConfiguration():
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
    TResult? Function(_RadioConfiguration value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RadioConfiguration() when $default != null:
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
            int myNodeNum,
            Config_LoRaConfig loraConfig,
            Config_BluetoothConfig bluetoothConfig,
            ModuleConfig_TelemetryConfig telemetryConfig,
            NodeInfo myNodeInfo,
            bool hasOwnNodeInfo,
            bool configDownloaded)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RadioConfiguration() when $default != null:
        return $default(
            _that.myNodeNum,
            _that.loraConfig,
            _that.bluetoothConfig,
            _that.telemetryConfig,
            _that.myNodeInfo,
            _that.hasOwnNodeInfo,
            _that.configDownloaded);
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
            int myNodeNum,
            Config_LoRaConfig loraConfig,
            Config_BluetoothConfig bluetoothConfig,
            ModuleConfig_TelemetryConfig telemetryConfig,
            NodeInfo myNodeInfo,
            bool hasOwnNodeInfo,
            bool configDownloaded)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RadioConfiguration():
        return $default(
            _that.myNodeNum,
            _that.loraConfig,
            _that.bluetoothConfig,
            _that.telemetryConfig,
            _that.myNodeInfo,
            _that.hasOwnNodeInfo,
            _that.configDownloaded);
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
            int myNodeNum,
            Config_LoRaConfig loraConfig,
            Config_BluetoothConfig bluetoothConfig,
            ModuleConfig_TelemetryConfig telemetryConfig,
            NodeInfo myNodeInfo,
            bool hasOwnNodeInfo,
            bool configDownloaded)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RadioConfiguration() when $default != null:
        return $default(
            _that.myNodeNum,
            _that.loraConfig,
            _that.bluetoothConfig,
            _that.telemetryConfig,
            _that.myNodeInfo,
            _that.hasOwnNodeInfo,
            _that.configDownloaded);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RadioConfiguration extends RadioConfiguration {
  const _RadioConfiguration(
      {this.myNodeNum = 0,
      required this.loraConfig,
      required this.bluetoothConfig,
      required this.telemetryConfig,
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
  final Config_BluetoothConfig bluetoothConfig;
  @override
  final ModuleConfig_TelemetryConfig telemetryConfig;
  @override
  final NodeInfo myNodeInfo;
  @override
  @JsonKey()
  final bool hasOwnNodeInfo;
  @override
  @JsonKey()
  final bool configDownloaded;

  /// Create a copy of RadioConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RadioConfigurationCopyWith<_RadioConfiguration> get copyWith =>
      __$RadioConfigurationCopyWithImpl<_RadioConfiguration>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RadioConfiguration &&
            (identical(other.myNodeNum, myNodeNum) ||
                other.myNodeNum == myNodeNum) &&
            (identical(other.loraConfig, loraConfig) ||
                other.loraConfig == loraConfig) &&
            (identical(other.bluetoothConfig, bluetoothConfig) ||
                other.bluetoothConfig == bluetoothConfig) &&
            (identical(other.telemetryConfig, telemetryConfig) ||
                other.telemetryConfig == telemetryConfig) &&
            (identical(other.myNodeInfo, myNodeInfo) ||
                other.myNodeInfo == myNodeInfo) &&
            (identical(other.hasOwnNodeInfo, hasOwnNodeInfo) ||
                other.hasOwnNodeInfo == hasOwnNodeInfo) &&
            (identical(other.configDownloaded, configDownloaded) ||
                other.configDownloaded == configDownloaded));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      myNodeNum,
      loraConfig,
      bluetoothConfig,
      telemetryConfig,
      myNodeInfo,
      hasOwnNodeInfo,
      configDownloaded);

  @override
  String toString() {
    return 'RadioConfiguration(myNodeNum: $myNodeNum, loraConfig: $loraConfig, bluetoothConfig: $bluetoothConfig, telemetryConfig: $telemetryConfig, myNodeInfo: $myNodeInfo, hasOwnNodeInfo: $hasOwnNodeInfo, configDownloaded: $configDownloaded)';
  }
}

/// @nodoc
abstract mixin class _$RadioConfigurationCopyWith<$Res>
    implements $RadioConfigurationCopyWith<$Res> {
  factory _$RadioConfigurationCopyWith(
          _RadioConfiguration value, $Res Function(_RadioConfiguration) _then) =
      __$RadioConfigurationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int myNodeNum,
      Config_LoRaConfig loraConfig,
      Config_BluetoothConfig bluetoothConfig,
      ModuleConfig_TelemetryConfig telemetryConfig,
      NodeInfo myNodeInfo,
      bool hasOwnNodeInfo,
      bool configDownloaded});
}

/// @nodoc
class __$RadioConfigurationCopyWithImpl<$Res>
    implements _$RadioConfigurationCopyWith<$Res> {
  __$RadioConfigurationCopyWithImpl(this._self, this._then);

  final _RadioConfiguration _self;
  final $Res Function(_RadioConfiguration) _then;

  /// Create a copy of RadioConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? myNodeNum = null,
    Object? loraConfig = null,
    Object? bluetoothConfig = null,
    Object? telemetryConfig = null,
    Object? myNodeInfo = null,
    Object? hasOwnNodeInfo = null,
    Object? configDownloaded = null,
  }) {
    return _then(_RadioConfiguration(
      myNodeNum: null == myNodeNum
          ? _self.myNodeNum
          : myNodeNum // ignore: cast_nullable_to_non_nullable
              as int,
      loraConfig: null == loraConfig
          ? _self.loraConfig
          : loraConfig // ignore: cast_nullable_to_non_nullable
              as Config_LoRaConfig,
      bluetoothConfig: null == bluetoothConfig
          ? _self.bluetoothConfig
          : bluetoothConfig // ignore: cast_nullable_to_non_nullable
              as Config_BluetoothConfig,
      telemetryConfig: null == telemetryConfig
          ? _self.telemetryConfig
          : telemetryConfig // ignore: cast_nullable_to_non_nullable
              as ModuleConfig_TelemetryConfig,
      myNodeInfo: null == myNodeInfo
          ? _self.myNodeInfo
          : myNodeInfo // ignore: cast_nullable_to_non_nullable
              as NodeInfo,
      hasOwnNodeInfo: null == hasOwnNodeInfo
          ? _self.hasOwnNodeInfo
          : hasOwnNodeInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      configDownloaded: null == configDownloaded
          ? _self.configDownloaded
          : configDownloaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
