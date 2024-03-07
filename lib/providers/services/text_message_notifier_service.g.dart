// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_message_notifier_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$textMessageNotifierServiceHash() =>
    r'3adbc337aeeebed73cbf5d9693b32e12d023dd4e';

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

/// See also [textMessageNotifierService].
@ProviderFor(textMessageNotifierService)
const textMessageNotifierServiceProvider = TextMessageNotifierServiceFamily();

/// See also [textMessageNotifierService].
class TextMessageNotifierServiceFamily
    extends Family<TextMessageNotifierService> {
  /// See also [textMessageNotifierService].
  const TextMessageNotifierServiceFamily();

  /// See also [textMessageNotifierService].
  TextMessageNotifierServiceProvider call({
    required int channel,
  }) {
    return TextMessageNotifierServiceProvider(
      channel: channel,
    );
  }

  @override
  TextMessageNotifierServiceProvider getProviderOverride(
    covariant TextMessageNotifierServiceProvider provider,
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
  String? get name => r'textMessageNotifierServiceProvider';
}

/// See also [textMessageNotifierService].
class TextMessageNotifierServiceProvider
    extends AutoDisposeProvider<TextMessageNotifierService> {
  /// See also [textMessageNotifierService].
  TextMessageNotifierServiceProvider({
    required int channel,
  }) : this._internal(
          (ref) => textMessageNotifierService(
            ref as TextMessageNotifierServiceRef,
            channel: channel,
          ),
          from: textMessageNotifierServiceProvider,
          name: r'textMessageNotifierServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$textMessageNotifierServiceHash,
          dependencies: TextMessageNotifierServiceFamily._dependencies,
          allTransitiveDependencies:
              TextMessageNotifierServiceFamily._allTransitiveDependencies,
          channel: channel,
        );

  TextMessageNotifierServiceProvider._internal(
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
    TextMessageNotifierService Function(TextMessageNotifierServiceRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TextMessageNotifierServiceProvider._internal(
        (ref) => create(ref as TextMessageNotifierServiceRef),
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
  AutoDisposeProviderElement<TextMessageNotifierService> createElement() {
    return _TextMessageNotifierServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TextMessageNotifierServiceProvider &&
        other.channel == channel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channel.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TextMessageNotifierServiceRef
    on AutoDisposeProviderRef<TextMessageNotifierService> {
  /// The parameter `channel` of this provider.
  int get channel;
}

class _TextMessageNotifierServiceProviderElement
    extends AutoDisposeProviderElement<TextMessageNotifierService>
    with TextMessageNotifierServiceRef {
  _TextMessageNotifierServiceProviderElement(super.provider);

  @override
  int get channel => (origin as TextMessageNotifierServiceProvider).channel;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
