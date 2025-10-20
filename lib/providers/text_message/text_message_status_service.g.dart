// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_message_status_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TextMessageStatusService)
const textMessageStatusServiceProvider = TextMessageStatusServiceFamily._();

final class TextMessageStatusServiceProvider
    extends $AsyncNotifierProvider<TextMessageStatusService, TextMessage> {
  const TextMessageStatusServiceProvider._(
      {required TextMessageStatusServiceFamily super.from,
      required ({
        int packetId,
        Duration timeout,
      })
          super.argument})
      : super(
          retry: null,
          name: r'textMessageStatusServiceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$textMessageStatusServiceHash();

  @override
  String toString() {
    return r'textMessageStatusServiceProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  TextMessageStatusService create() => TextMessageStatusService();

  @override
  bool operator ==(Object other) {
    return other is TextMessageStatusServiceProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$textMessageStatusServiceHash() =>
    r'36c1eef331e8090a2831426e0086afab7afa2beb';

final class TextMessageStatusServiceFamily extends $Family
    with
        $ClassFamilyOverride<
            TextMessageStatusService,
            AsyncValue<TextMessage>,
            TextMessage,
            FutureOr<TextMessage>,
            ({
              int packetId,
              Duration timeout,
            })> {
  const TextMessageStatusServiceFamily._()
      : super(
          retry: null,
          name: r'textMessageStatusServiceProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  TextMessageStatusServiceProvider call({
    required int packetId,
    Duration timeout = const Duration(minutes: 1),
  }) =>
      TextMessageStatusServiceProvider._(argument: (
        packetId: packetId,
        timeout: timeout,
      ), from: this);

  @override
  String toString() => r'textMessageStatusServiceProvider';
}

abstract class _$TextMessageStatusService extends $AsyncNotifier<TextMessage> {
  late final _$args = ref.$arg as ({
    int packetId,
    Duration timeout,
  });
  int get packetId => _$args.packetId;
  Duration get timeout => _$args.timeout;

  FutureOr<TextMessage> build({
    required int packetId,
    Duration timeout = const Duration(minutes: 1),
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      packetId: _$args.packetId,
      timeout: _$args.timeout,
    );
    final ref = this.ref as $Ref<AsyncValue<TextMessage>, TextMessage>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<TextMessage>, TextMessage>,
        AsyncValue<TextMessage>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
