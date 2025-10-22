// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_writer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(radioWriter)
const radioWriterProvider = RadioWriterProvider._();

final class RadioWriterProvider
    extends $FunctionalProvider<RadioWriter, RadioWriter, RadioWriter>
    with $Provider<RadioWriter> {
  const RadioWriterProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'radioWriterProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$radioWriterHash();

  @$internal
  @override
  $ProviderElement<RadioWriter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RadioWriter create(Ref ref) {
    return radioWriter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RadioWriter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RadioWriter>(value),
    );
  }
}

String _$radioWriterHash() => r'9b4b563a00e02ccf335b52c40405c2891dad4988';
