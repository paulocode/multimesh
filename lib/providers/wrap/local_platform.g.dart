// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_platform.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localPlatform)
const localPlatformProvider = LocalPlatformProvider._();

final class LocalPlatformProvider
    extends $FunctionalProvider<LocalPlatform, LocalPlatform, LocalPlatform>
    with $Provider<LocalPlatform> {
  const LocalPlatformProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'localPlatformProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$localPlatformHash();

  @$internal
  @override
  $ProviderElement<LocalPlatform> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocalPlatform create(Ref ref) {
    return localPlatform(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalPlatform value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalPlatform>(value),
    );
  }
}

String _$localPlatformHash() => r'f7dd04122f85ee2892eb39a4c6c81f0b30f8d5e5';
