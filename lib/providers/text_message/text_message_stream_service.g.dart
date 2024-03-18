// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_message_stream_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$textMessageStreamServiceHash() =>
    r'f78f29b2b13adbf3fae2a634277506d44d9d57e8';

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

/// See also [textMessageStreamService].
@ProviderFor(textMessageStreamService)
const textMessageStreamServiceProvider = TextMessageStreamServiceFamily();

/// See also [textMessageStreamService].
class TextMessageStreamServiceFamily extends Family<TextMessageStreamService> {
  /// See also [textMessageStreamService].
  const TextMessageStreamServiceFamily();

  /// See also [textMessageStreamService].
  TextMessageStreamServiceProvider call({
    required ChatType chatType,
  }) {
    return TextMessageStreamServiceProvider(
      chatType: chatType,
    );
  }

  @override
  TextMessageStreamServiceProvider getProviderOverride(
    covariant TextMessageStreamServiceProvider provider,
  ) {
    return call(
      chatType: provider.chatType,
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
  String? get name => r'textMessageStreamServiceProvider';
}

/// See also [textMessageStreamService].
class TextMessageStreamServiceProvider
    extends Provider<TextMessageStreamService> {
  /// See also [textMessageStreamService].
  TextMessageStreamServiceProvider({
    required ChatType chatType,
  }) : this._internal(
          (ref) => textMessageStreamService(
            ref as TextMessageStreamServiceRef,
            chatType: chatType,
          ),
          from: textMessageStreamServiceProvider,
          name: r'textMessageStreamServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$textMessageStreamServiceHash,
          dependencies: TextMessageStreamServiceFamily._dependencies,
          allTransitiveDependencies:
              TextMessageStreamServiceFamily._allTransitiveDependencies,
          chatType: chatType,
        );

  TextMessageStreamServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chatType,
  }) : super.internal();

  final ChatType chatType;

  @override
  Override overrideWith(
    TextMessageStreamService Function(TextMessageStreamServiceRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TextMessageStreamServiceProvider._internal(
        (ref) => create(ref as TextMessageStreamServiceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chatType: chatType,
      ),
    );
  }

  @override
  ProviderElement<TextMessageStreamService> createElement() {
    return _TextMessageStreamServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TextMessageStreamServiceProvider &&
        other.chatType == chatType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TextMessageStreamServiceRef on ProviderRef<TextMessageStreamService> {
  /// The parameter `chatType` of this provider.
  ChatType get chatType;
}

class _TextMessageStreamServiceProviderElement
    extends ProviderElement<TextMessageStreamService>
    with TextMessageStreamServiceRef {
  _TextMessageStreamServiceProviderElement(super.provider);

  @override
  ChatType get chatType =>
      (origin as TextMessageStreamServiceProvider).chatType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
