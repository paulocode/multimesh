// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_message_status_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$textMessageStatusServiceHash() =>
    r'a67a5fe6dbb080e88cee3b4b37e422759e1dbc1e';

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
    extends BuildlessAutoDisposeAsyncNotifier<TextMessageStatus> {
  late final int packetId;
  late final Duration timeout;

  FutureOr<TextMessageStatus> build({
    required int packetId,
    Duration timeout = const Duration(minutes: 1),
  });
}

/// See also [TextMessageStatusService].
@ProviderFor(TextMessageStatusService)
const textMessageStatusServiceProvider = TextMessageStatusServiceFamily();

/// See also [TextMessageStatusService].
class TextMessageStatusServiceFamily
    extends Family<AsyncValue<TextMessageStatus>> {
  /// See also [TextMessageStatusService].
  const TextMessageStatusServiceFamily();

  /// See also [TextMessageStatusService].
  TextMessageStatusServiceProvider call({
    required int packetId,
    Duration timeout = const Duration(minutes: 1),
  }) {
    return TextMessageStatusServiceProvider(
      packetId: packetId,
      timeout: timeout,
    );
  }

  @override
  TextMessageStatusServiceProvider getProviderOverride(
    covariant TextMessageStatusServiceProvider provider,
  ) {
    return call(
      packetId: provider.packetId,
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
        TextMessageStatus> {
  /// See also [TextMessageStatusService].
  TextMessageStatusServiceProvider({
    required int packetId,
    Duration timeout = const Duration(minutes: 1),
  }) : this._internal(
          () => TextMessageStatusService()
            ..packetId = packetId
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
          packetId: packetId,
          timeout: timeout,
        );

  TextMessageStatusServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.packetId,
    required this.timeout,
  }) : super.internal();

  final int packetId;
  final Duration timeout;

  @override
  FutureOr<TextMessageStatus> runNotifierBuild(
    covariant TextMessageStatusService notifier,
  ) {
    return notifier.build(
      packetId: packetId,
      timeout: timeout,
    );
  }

  @override
  Override overrideWith(TextMessageStatusService Function() create) {
    return ProviderOverride(
      origin: this,
      override: TextMessageStatusServiceProvider._internal(
        () => create()
          ..packetId = packetId
          ..timeout = timeout,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        packetId: packetId,
        timeout: timeout,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TextMessageStatusService,
      TextMessageStatus> createElement() {
    return _TextMessageStatusServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TextMessageStatusServiceProvider &&
        other.packetId == packetId &&
        other.timeout == timeout;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, packetId.hashCode);
    hash = _SystemHash.combine(hash, timeout.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TextMessageStatusServiceRef
    on AutoDisposeAsyncNotifierProviderRef<TextMessageStatus> {
  /// The parameter `packetId` of this provider.
  int get packetId;

  /// The parameter `timeout` of this provider.
  Duration get timeout;
}

class _TextMessageStatusServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TextMessageStatusService,
        TextMessageStatus> with TextMessageStatusServiceRef {
  _TextMessageStatusServiceProviderElement(super.provider);

  @override
  int get packetId => (origin as TextMessageStatusServiceProvider).packetId;
  @override
  Duration get timeout => (origin as TextMessageStatusServiceProvider).timeout;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
