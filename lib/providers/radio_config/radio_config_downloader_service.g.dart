// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_config_downloader_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(radioConfigDownloaderService)
const radioConfigDownloaderServiceProvider =
    RadioConfigDownloaderServiceProvider._();

final class RadioConfigDownloaderServiceProvider extends $FunctionalProvider<
    RadioConfigDownloaderService,
    RadioConfigDownloaderService,
    RadioConfigDownloaderService> with $Provider<RadioConfigDownloaderService> {
  const RadioConfigDownloaderServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'radioConfigDownloaderServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$radioConfigDownloaderServiceHash();

  @$internal
  @override
  $ProviderElement<RadioConfigDownloaderService> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RadioConfigDownloaderService create(Ref ref) {
    return radioConfigDownloaderService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RadioConfigDownloaderService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RadioConfigDownloaderService>(value),
    );
  }
}

String _$radioConfigDownloaderServiceHash() =>
    r'37a0c9eb651f1a56846070f3576ded6ac9ee4d0e';
