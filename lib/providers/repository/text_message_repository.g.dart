// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_message_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(textMessageRepository)
const textMessageRepositoryProvider = TextMessageRepositoryProvider._();

final class TextMessageRepositoryProvider extends $FunctionalProvider<
    TextMessageRepository,
    TextMessageRepository,
    TextMessageRepository> with $Provider<TextMessageRepository> {
  const TextMessageRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'textMessageRepositoryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$textMessageRepositoryHash();

  @$internal
  @override
  $ProviderElement<TextMessageRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TextMessageRepository create(Ref ref) {
    return textMessageRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextMessageRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextMessageRepository>(value),
    );
  }
}

String _$textMessageRepositoryHash() =>
    r'a577d47df342beb955e88fb9c3295ccf2f283379';
