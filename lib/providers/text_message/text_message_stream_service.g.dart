// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_message_stream_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(textMessageStreamService)
const textMessageStreamServiceProvider = TextMessageStreamServiceFamily._();

final class TextMessageStreamServiceProvider extends $FunctionalProvider<
    TextMessageStreamService,
    TextMessageStreamService,
    TextMessageStreamService> with $Provider<TextMessageStreamService> {
  const TextMessageStreamServiceProvider._(
      {required TextMessageStreamServiceFamily super.from,
      required ChatType super.argument})
      : super(
          retry: null,
          name: r'textMessageStreamServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$textMessageStreamServiceHash();

  @override
  String toString() {
    return r'textMessageStreamServiceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<TextMessageStreamService> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TextMessageStreamService create(Ref ref) {
    final argument = this.argument as ChatType;
    return textMessageStreamService(
      ref,
      chatType: argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextMessageStreamService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextMessageStreamService>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TextMessageStreamServiceProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$textMessageStreamServiceHash() =>
    r'4b59706f8527fcecd46617a0c6d447dc19c169db';

final class TextMessageStreamServiceFamily extends $Family
    with $FunctionalFamilyOverride<TextMessageStreamService, ChatType> {
  const TextMessageStreamServiceFamily._()
      : super(
          retry: null,
          name: r'textMessageStreamServiceProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: false,
        );

  TextMessageStreamServiceProvider call({
    required ChatType chatType,
  }) =>
      TextMessageStreamServiceProvider._(argument: chatType, from: this);

  @override
  String toString() => r'textMessageStreamServiceProvider';
}
