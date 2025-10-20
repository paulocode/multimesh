// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_connector_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RadioConnectorService)
const radioConnectorServiceProvider = RadioConnectorServiceProvider._();

final class RadioConnectorServiceProvider
    extends $NotifierProvider<RadioConnectorService, RadioConnectorState> {
  const RadioConnectorServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'radioConnectorServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$radioConnectorServiceHash();

  @$internal
  @override
  RadioConnectorService create() => RadioConnectorService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RadioConnectorState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RadioConnectorState>(value),
    );
  }
}

String _$radioConnectorServiceHash() =>
    r'4af18c4b66bb783995a15427f26c88e42bd0587b';

abstract class _$RadioConnectorService extends $Notifier<RadioConnectorState> {
  RadioConnectorState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<RadioConnectorState, RadioConnectorState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<RadioConnectorState, RadioConnectorState>,
        RadioConnectorState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
