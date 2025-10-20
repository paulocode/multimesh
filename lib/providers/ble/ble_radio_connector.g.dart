// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_radio_connector.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BleRadioConnector)
const bleRadioConnectorProvider = BleRadioConnectorProvider._();

final class BleRadioConnectorProvider
    extends $NotifierProvider<BleRadioConnector, RadioConnectorState> {
  const BleRadioConnectorProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'bleRadioConnectorProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$bleRadioConnectorHash();

  @$internal
  @override
  BleRadioConnector create() => BleRadioConnector();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RadioConnectorState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RadioConnectorState>(value),
    );
  }
}

String _$bleRadioConnectorHash() => r'e4236e188ed8702db6ab5fbe76da09af1c26ca81';

abstract class _$BleRadioConnector extends $Notifier<RadioConnectorState> {
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
