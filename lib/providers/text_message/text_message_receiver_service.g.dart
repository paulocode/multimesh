// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_message_receiver_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(textMessageReceiverService)
const textMessageReceiverServiceProvider =
    TextMessageReceiverServiceProvider._();

final class TextMessageReceiverServiceProvider extends $FunctionalProvider<
    TextMessageReceiverService,
    TextMessageReceiverService,
    TextMessageReceiverService> with $Provider<TextMessageReceiverService> {
  const TextMessageReceiverServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'textMessageReceiverServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$textMessageReceiverServiceHash();

  @$internal
  @override
  $ProviderElement<TextMessageReceiverService> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TextMessageReceiverService create(Ref ref) {
    return textMessageReceiverService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextMessageReceiverService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextMessageReceiverService>(value),
    );
  }
}

String _$textMessageReceiverServiceHash() =>
    r'd3ca00d8a5799d7808bb60613e9c67066e7cb015';
