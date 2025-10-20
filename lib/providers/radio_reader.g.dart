// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_reader.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(radioReader)
const radioReaderProvider = RadioReaderProvider._();

final class RadioReaderProvider
    extends $FunctionalProvider<RadioReader, RadioReader, RadioReader>
    with $Provider<RadioReader> {
  const RadioReaderProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'radioReaderProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$radioReaderHash();

  @$internal
  @override
  $ProviderElement<RadioReader> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RadioReader create(Ref ref) {
    return radioReader(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RadioReader value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RadioReader>(value),
    );
  }
}

String _$radioReaderHash() => r'e6fc0666c9234c8657e2be1473f57ce407510bab';
