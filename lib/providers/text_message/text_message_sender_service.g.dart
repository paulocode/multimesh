// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_message_sender_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sendTextMessage)
const sendTextMessageProvider = SendTextMessageFamily._();

final class SendTextMessageProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const SendTextMessageProvider._(
      {required SendTextMessageFamily super.from,
      required ({
        ChatType chatType,
        String text,
      })
          super.argument})
      : super(
          retry: null,
          name: r'sendTextMessageProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sendTextMessageHash();

  @override
  String toString() {
    return r'sendTextMessageProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as ({
      ChatType chatType,
      String text,
    });
    return sendTextMessage(
      ref,
      chatType: argument.chatType,
      text: argument.text,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SendTextMessageProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sendTextMessageHash() => r'8e866c4038cf09e7d69392f901a2618d5c72e55f';

final class SendTextMessageFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<void>,
            ({
              ChatType chatType,
              String text,
            })> {
  const SendTextMessageFamily._()
      : super(
          retry: null,
          name: r'sendTextMessageProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SendTextMessageProvider call({
    required ChatType chatType,
    required String text,
  }) =>
      SendTextMessageProvider._(argument: (
        chatType: chatType,
        text: text,
      ), from: this);

  @override
  String toString() => r'sendTextMessageProvider';
}
