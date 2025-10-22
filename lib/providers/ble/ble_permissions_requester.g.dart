// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_permissions_requester.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(blePermissionsRequester)
const blePermissionsRequesterProvider = BlePermissionsRequesterProvider._();

final class BlePermissionsRequesterProvider extends $FunctionalProvider<
    BlePermissionsRequester,
    BlePermissionsRequester,
    BlePermissionsRequester> with $Provider<BlePermissionsRequester> {
  const BlePermissionsRequesterProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'blePermissionsRequesterProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$blePermissionsRequesterHash();

  @$internal
  @override
  $ProviderElement<BlePermissionsRequester> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BlePermissionsRequester create(Ref ref) {
    return blePermissionsRequester(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BlePermissionsRequester value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BlePermissionsRequester>(value),
    );
  }
}

String _$blePermissionsRequesterHash() =>
    r'47744d8d652dd8d241b82d59d6fd4838c6555ed1';
