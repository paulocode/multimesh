// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_radio_scanner.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BleRadioScanner)
const bleRadioScannerProvider = BleRadioScannerProvider._();

final class BleRadioScannerProvider
    extends $NotifierProvider<BleRadioScanner, RadioScanState> {
  const BleRadioScannerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'bleRadioScannerProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$bleRadioScannerHash();

  @$internal
  @override
  BleRadioScanner create() => BleRadioScanner();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RadioScanState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RadioScanState>(value),
    );
  }
}

String _$bleRadioScannerHash() => r'16c55192d2eff776bcbad6f699f4c457987f8e72';

abstract class _$BleRadioScanner extends $Notifier<RadioScanState> {
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
