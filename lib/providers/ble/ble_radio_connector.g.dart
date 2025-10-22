// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_radio_connector.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BleRadioConnector)
const bleRadioConnectorProvider = BleRadioConnectorProvider._();

final class BleRadioConnectorProvider extends $NotifierProvider<
    BleRadioConnector, connector_state.RadioConnectorState> {
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
  Override overrideWithValue(connector_state.RadioConnectorState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<connector_state.RadioConnectorState>(value),
    );
  }
}

String _$bleRadioConnectorHash() => r'2200d59ce3892a57b24f0845c59df6e5bb221bef';

abstract class _$BleRadioConnector
    extends $Notifier<connector_state.RadioConnectorState> {
  connector_state.RadioConnectorState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<connector_state.RadioConnectorState,
        connector_state.RadioConnectorState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<connector_state.RadioConnectorState,
            connector_state.RadioConnectorState>,
        connector_state.RadioConnectorState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
