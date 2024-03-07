// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_message_stream_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$textMessageStreamServiceHash() =>
    r'c661304b78a6baddf45658efa279353b850c97d5';

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
    required int channel,
  }) {
    return TextMessageStreamServiceProvider(
      channel: channel,
    );
  }

  @override
  TextMessageStreamServiceProvider getProviderOverride(
    covariant TextMessageStreamServiceProvider provider,
  ) {
    return call(
      channel: provider.channel,
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
    extends AutoDisposeProvider<TextMessageStreamService> {
  /// See also [textMessageStreamService].
  TextMessageStreamServiceProvider({
    required int channel,
  }) : this._internal(
          (ref) => textMessageStreamService(
            ref as TextMessageStreamServiceRef,
            channel: channel,
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
          channel: channel,
        );

  TextMessageStreamServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.channel,
  }) : super.internal();

  final int channel;

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
        channel: channel,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<TextMessageStreamService> createElement() {
    return _TextMessageStreamServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TextMessageStreamServiceProvider &&
        other.channel == channel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channel.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TextMessageStreamServiceRef
    on AutoDisposeProviderRef<TextMessageStreamService> {
  /// The parameter `channel` of this provider.
  int get channel;
}

class _TextMessageStreamServiceProviderElement
    extends AutoDisposeProviderElement<TextMessageStreamService>
    with TextMessageStreamServiceRef {
  _TextMessageStreamServiceProviderElement(super.provider);

  @override
  int get channel => (origin as TextMessageStreamServiceProvider).channel;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
