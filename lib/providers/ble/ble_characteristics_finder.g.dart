// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_characteristics_finder.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bleCharacteristicsFinder)
const bleCharacteristicsFinderProvider = BleCharacteristicsFinderProvider._();

final class BleCharacteristicsFinderProvider extends $FunctionalProvider<
    BleCharacteristicsFinder,
    BleCharacteristicsFinder,
    BleCharacteristicsFinder> with $Provider<BleCharacteristicsFinder> {
  const BleCharacteristicsFinderProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'bleCharacteristicsFinderProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$bleCharacteristicsFinderHash();

  @$internal
  @override
  $ProviderElement<BleCharacteristicsFinder> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BleCharacteristicsFinder create(Ref ref) {
    return bleCharacteristicsFinder(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BleCharacteristicsFinder value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BleCharacteristicsFinder>(value),
    );
  }
}

String _$bleCharacteristicsFinderHash() =>
    r'fb5b43b9141198dfd279c95e5611a096cb636c3c';
