// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_config_uploader_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(radioConfigUploaderService)
const radioConfigUploaderServiceProvider =
    RadioConfigUploaderServiceProvider._();

final class RadioConfigUploaderServiceProvider extends $FunctionalProvider<
    RadioConfigUploaderService,
    RadioConfigUploaderService,
    RadioConfigUploaderService> with $Provider<RadioConfigUploaderService> {
  const RadioConfigUploaderServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'radioConfigUploaderServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$radioConfigUploaderServiceHash();

  @$internal
  @override
  $ProviderElement<RadioConfigUploaderService> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RadioConfigUploaderService create(Ref ref) {
    return radioConfigUploaderService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RadioConfigUploaderService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RadioConfigUploaderService>(value),
    );
  }
}

String _$radioConfigUploaderServiceHash() =>
    r'0745fcd74b46bcb69844809cdd7ea3eb6af36762';
