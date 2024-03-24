// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reconnector.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reconnectorServiceHash() =>
    r'b68aaf40e5414d130a6c4a004fd758e97d82d857';

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

abstract class _$ReconnectorService extends BuildlessNotifier<dynamic> {
  late final Duration delay;

  dynamic build({
    Duration delay = const Duration(seconds: 15),
  });
}

/// See also [ReconnectorService].
@ProviderFor(ReconnectorService)
const reconnectorServiceProvider = ReconnectorServiceFamily();

/// See also [ReconnectorService].
class ReconnectorServiceFamily extends Family<dynamic> {
  /// See also [ReconnectorService].
  const ReconnectorServiceFamily();

  /// See also [ReconnectorService].
  ReconnectorServiceProvider call({
    Duration delay = const Duration(seconds: 15),
  }) {
    return ReconnectorServiceProvider(
      delay: delay,
    );
  }

  @override
  ReconnectorServiceProvider getProviderOverride(
    covariant ReconnectorServiceProvider provider,
  ) {
    return call(
      delay: provider.delay,
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
  String? get name => r'reconnectorServiceProvider';
}

/// See also [ReconnectorService].
class ReconnectorServiceProvider
    extends NotifierProviderImpl<ReconnectorService, dynamic> {
  /// See also [ReconnectorService].
  ReconnectorServiceProvider({
    Duration delay = const Duration(seconds: 15),
  }) : this._internal(
          () => ReconnectorService()..delay = delay,
          from: reconnectorServiceProvider,
          name: r'reconnectorServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reconnectorServiceHash,
          dependencies: ReconnectorServiceFamily._dependencies,
          allTransitiveDependencies:
              ReconnectorServiceFamily._allTransitiveDependencies,
          delay: delay,
        );

  ReconnectorServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.delay,
  }) : super.internal();

  final Duration delay;

  @override
  dynamic runNotifierBuild(
    covariant ReconnectorService notifier,
  ) {
    return notifier.build(
      delay: delay,
    );
  }

  @override
  Override overrideWith(ReconnectorService Function() create) {
    return ProviderOverride(
      origin: this,
      override: ReconnectorServiceProvider._internal(
        () => create()..delay = delay,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        delay: delay,
      ),
    );
  }

  @override
  NotifierProviderElement<ReconnectorService, dynamic> createElement() {
    return _ReconnectorServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReconnectorServiceProvider && other.delay == delay;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, delay.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ReconnectorServiceRef on NotifierProviderRef<dynamic> {
  /// The parameter `delay` of this provider.
  Duration get delay;
}

class _ReconnectorServiceProviderElement
    extends NotifierProviderElement<ReconnectorService, dynamic>
    with ReconnectorServiceRef {
  _ReconnectorServiceProviderElement(super.provider);

  @override
  Duration get delay => (origin as ReconnectorServiceProvider).delay;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
