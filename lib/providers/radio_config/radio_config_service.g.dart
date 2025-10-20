// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_config_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RadioConfigService)
const radioConfigServiceProvider = RadioConfigServiceProvider._();

final class RadioConfigServiceProvider
    extends $NotifierProvider<RadioConfigService, RadioConfiguration> {
  const RadioConfigServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'radioConfigServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$radioConfigServiceHash();

  @$internal
  @override
  RadioConfigService create() => RadioConfigService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RadioConfiguration value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RadioConfiguration>(value),
    );
  }
}

String _$radioConfigServiceHash() =>
    r'8be8b8fe641b5fe6ef626b0ccebba2f2e05c4d4b';

abstract class _$RadioConfigService extends $Notifier<RadioConfiguration> {
  RadioConfiguration build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<RadioConfiguration, RadioConfiguration>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<RadioConfiguration, RadioConfiguration>,
        RadioConfiguration,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
