// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_message_sender_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendTextMessageHash() => r'66e6f6887d14562085f9caf822b8451c7b9fcfb6';

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

/// See also [sendTextMessage].
@ProviderFor(sendTextMessage)
const sendTextMessageProvider = SendTextMessageFamily();

/// See also [sendTextMessage].
class SendTextMessageFamily extends Family<AsyncValue<void>> {
  /// See also [sendTextMessage].
  const SendTextMessageFamily();

  /// See also [sendTextMessage].
  SendTextMessageProvider call({
    required ChatType chatType,
    required String text,
  }) {
    return SendTextMessageProvider(
      chatType: chatType,
      text: text,
    );
  }

  @override
  SendTextMessageProvider getProviderOverride(
    covariant SendTextMessageProvider provider,
  ) {
    return call(
      chatType: provider.chatType,
      text: provider.text,
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
  String? get name => r'sendTextMessageProvider';
}

/// See also [sendTextMessage].
class SendTextMessageProvider extends AutoDisposeFutureProvider<void> {
  /// See also [sendTextMessage].
  SendTextMessageProvider({
    required ChatType chatType,
    required String text,
  }) : this._internal(
          (ref) => sendTextMessage(
            ref as SendTextMessageRef,
            chatType: chatType,
            text: text,
          ),
          from: sendTextMessageProvider,
          name: r'sendTextMessageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendTextMessageHash,
          dependencies: SendTextMessageFamily._dependencies,
          allTransitiveDependencies:
              SendTextMessageFamily._allTransitiveDependencies,
          chatType: chatType,
          text: text,
        );

  SendTextMessageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chatType,
    required this.text,
  }) : super.internal();

  final ChatType chatType;
  final String text;

  @override
  Override overrideWith(
    FutureOr<void> Function(SendTextMessageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendTextMessageProvider._internal(
        (ref) => create(ref as SendTextMessageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chatType: chatType,
        text: text,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SendTextMessageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendTextMessageProvider &&
        other.chatType == chatType &&
        other.text == text;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatType.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendTextMessageRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `chatType` of this provider.
  ChatType get chatType;

  /// The parameter `text` of this provider.
  String get text;
}

class _SendTextMessageProviderElement
    extends AutoDisposeFutureProviderElement<void> with SendTextMessageRef {
  _SendTextMessageProviderElement(super.provider);

  @override
  ChatType get chatType => (origin as SendTextMessageProvider).chatType;
  @override
  String get text => (origin as SendTextMessageProvider).text;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
