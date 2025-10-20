// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tcp_radio_scanner.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TcpRadioScanner)
const tcpRadioScannerProvider = TcpRadioScannerProvider._();

final class TcpRadioScannerProvider
    extends $NotifierProvider<TcpRadioScanner, RadioScanState> {
  const TcpRadioScannerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'tcpRadioScannerProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tcpRadioScannerHash();

  @$internal
  @override
  TcpRadioScanner create() => TcpRadioScanner();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RadioScanState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RadioScanState>(value),
    );
  }
}

String _$tcpRadioScannerHash() => r'877b2e1ee2e37d78ec88d2668278bfd95dd2d79e';

abstract class _$TcpRadioScanner extends $Notifier<RadioScanState> {
  RadioScanState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<RadioScanState, RadioScanState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<RadioScanState, RadioScanState>,
        RadioScanState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
