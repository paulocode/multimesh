// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tcp_radio_connector.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TcpRadioConnector)
const tcpRadioConnectorProvider = TcpRadioConnectorProvider._();

final class TcpRadioConnectorProvider
    extends $NotifierProvider<TcpRadioConnector, RadioConnectorState> {
  const TcpRadioConnectorProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'tcpRadioConnectorProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tcpRadioConnectorHash();

  @$internal
  @override
  TcpRadioConnector create() => TcpRadioConnector();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RadioConnectorState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RadioConnectorState>(value),
    );
  }
}

String _$tcpRadioConnectorHash() => r'ddf2eb2df9cac3537f279ac281ba51b1c82b57ea';

abstract class _$TcpRadioConnector extends $Notifier<RadioConnectorState> {
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
