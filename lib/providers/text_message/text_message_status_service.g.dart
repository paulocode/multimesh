// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_message_status_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$textMessageStatusServiceHash() =>
    r'6bcee6881415cffc114ef642ca90ce0bfbbf8f09';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TextMessageStatusService
    extends BuildlessAutoDisposeAsyncNotifier<TextMessage> {
  late final TextMessage textMessage;
  late final Duration timeout;

  FutureOr<TextMessage> build({
    required TextMessage textMessage,
    Duration timeout = const Duration(minutes: 1),
  });
}

/// See also [TextMessageStatusService].
@ProviderFor(TextMessageStatusService)
const textMessageStatusServiceProvider = TextMessageStatusServiceFamily();

/// See also [TextMessageStatusService].
class TextMessageStatusServiceFamily extends Family<AsyncValue<TextMessage>> {
  /// See also [TextMessageStatusService].
  const TextMessageStatusServiceFamily();

  /// See also [TextMessageStatusService].
  TextMessageStatusServiceProvider call({
    required TextMessage textMessage,
    Duration timeout = const Duration(minutes: 1),
  }) {
    return TextMessageStatusServiceProvider(
      textMessage: textMessage,
      timeout: timeout,
    );
  }

  @override
  TextMessageStatusServiceProvider getProviderOverride(
    covariant TextMessageStatusServiceProvider provider,
  ) {
    return call(
      textMessage: provider.textMessage,
      timeout: provider.timeout,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'textMessageStatusServiceProvider';
}

/// See also [TextMessageStatusService].
class TextMessageStatusServiceProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TextMessageStatusService,
        TextMessage> {
  /// See also [TextMessageStatusService].
  TextMessageStatusServiceProvider({
    required TextMessage textMessage,
    Duration timeout = const Duration(minutes: 1),
  }) : this._internal(
          () => TextMessageStatusService()
            ..textMessage = textMessage
            ..timeout = timeout,
          from: textMessageStatusServiceProvider,
          name: r'textMessageStatusServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$textMessageStatusServiceHash,
          dependencies: TextMessageStatusServiceFamily._dependencies,
          allTransitiveDependencies:
              TextMessageStatusServiceFamily._allTransitiveDependencies,
          textMessage: textMessage,
          timeout: timeout,
        );

  TextMessageStatusServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.textMessage,
    required this.timeout,
  }) : super.internal();

  final TextMessage textMessage;
  final Duration timeout;

  @override
  FutureOr<TextMessage> runNotifierBuild(
    covariant TextMessageStatusService notifier,
  ) {
    return notifier.build(
      textMessage: textMessage,
      timeout: timeout,
    );
  }

  @override
  Override overrideWith(TextMessageStatusService Function() create) {
    return ProviderOverride(
      origin: this,
      override: TextMessageStatusServiceProvider._internal(
        () => create()
          ..textMessage = textMessage
          ..timeout = timeout,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        textMessage: textMessage,
        timeout: timeout,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TextMessageStatusService, TextMessage>
      createElement() {
    return _TextMessageStatusServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TextMessageStatusServiceProvider &&
        other.textMessage == textMessage &&
        other.timeout == timeout;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, textMessage.hashCode);
    hash = _SystemHash.combine(hash, timeout.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TextMessageStatusServiceRef
    on AutoDisposeAsyncNotifierProviderRef<TextMessage> {
  /// The parameter `textMessage` of this provider.
  TextMessage get textMessage;

  /// The parameter `timeout` of this provider.
  Duration get timeout;
}

class _TextMessageStatusServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TextMessageStatusService,
        TextMessage> with TextMessageStatusServiceRef {
  _TextMessageStatusServiceProviderElement(super.provider);

  @override
  TextMessage get textMessage =>
      (origin as TextMessageStatusServiceProvider).textMessage;
  @override
  Duration get timeout => (origin as TextMessageStatusServiceProvider).timeout;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
