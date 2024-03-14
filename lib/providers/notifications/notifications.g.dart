// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flutterLocalNotificationsPluginHash() =>
    r'3e286e2d2c576c7010864a1d8ae683764b870d73';

/// See also [flutterLocalNotificationsPlugin].
@ProviderFor(flutterLocalNotificationsPlugin)
final flutterLocalNotificationsPluginProvider =
    FutureProvider<FlutterLocalNotificationsPlugin>.internal(
  flutterLocalNotificationsPlugin,
  name: r'flutterLocalNotificationsPluginProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flutterLocalNotificationsPluginHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FlutterLocalNotificationsPluginRef
    = FutureProviderRef<FlutterLocalNotificationsPlugin>;
String _$showNotificationHash() => r'd3acfa3ffc7053f168c88d0b9a707b1f7ae4df46';

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

/// See also [showNotification].
@ProviderFor(showNotification)
const showNotificationProvider = ShowNotificationFamily();

/// See also [showNotification].
class ShowNotificationFamily extends Family<AsyncValue<void>> {
  /// See also [showNotification].
  const ShowNotificationFamily();

  /// See also [showNotification].
  ShowNotificationProvider call({
    required String title,
    required String text,
    required String callbackValue,
  }) {
    return ShowNotificationProvider(
      title: title,
      text: text,
      callbackValue: callbackValue,
    );
  }

  @override
  ShowNotificationProvider getProviderOverride(
    covariant ShowNotificationProvider provider,
  ) {
    return call(
      title: provider.title,
      text: provider.text,
      callbackValue: provider.callbackValue,
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
  String? get name => r'showNotificationProvider';
}

/// See also [showNotification].
class ShowNotificationProvider extends FutureProvider<void> {
  /// See also [showNotification].
  ShowNotificationProvider({
    required String title,
    required String text,
    required String callbackValue,
  }) : this._internal(
          (ref) => showNotification(
            ref as ShowNotificationRef,
            title: title,
            text: text,
            callbackValue: callbackValue,
          ),
          from: showNotificationProvider,
          name: r'showNotificationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$showNotificationHash,
          dependencies: ShowNotificationFamily._dependencies,
          allTransitiveDependencies:
              ShowNotificationFamily._allTransitiveDependencies,
          title: title,
          text: text,
          callbackValue: callbackValue,
        );

  ShowNotificationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.title,
    required this.text,
    required this.callbackValue,
  }) : super.internal();

  final String title;
  final String text;
  final String callbackValue;

  @override
  Override overrideWith(
    FutureOr<void> Function(ShowNotificationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShowNotificationProvider._internal(
        (ref) => create(ref as ShowNotificationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        title: title,
        text: text,
        callbackValue: callbackValue,
      ),
    );
  }

  @override
  FutureProviderElement<void> createElement() {
    return _ShowNotificationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShowNotificationProvider &&
        other.title == title &&
        other.text == text &&
        other.callbackValue == callbackValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);
    hash = _SystemHash.combine(hash, callbackValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ShowNotificationRef on FutureProviderRef<void> {
  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `text` of this provider.
  String get text;

  /// The parameter `callbackValue` of this provider.
  String get callbackValue;
}

class _ShowNotificationProviderElement extends FutureProviderElement<void>
    with ShowNotificationRef {
  _ShowNotificationProviderElement(super.provider);

  @override
  String get title => (origin as ShowNotificationProvider).title;
  @override
  String get text => (origin as ShowNotificationProvider).text;
  @override
  String get callbackValue =>
      (origin as ShowNotificationProvider).callbackValue;
}

String _$notificationsCallbackHash() =>
    r'84257737ca845a0e9b6019d58e2eb111f7319df1';

/// See also [NotificationsCallback].
@ProviderFor(NotificationsCallback)
final notificationsCallbackProvider =
    NotifierProvider<NotificationsCallback, String?>.internal(
  NotificationsCallback.new,
  name: r'notificationsCallbackProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationsCallbackHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NotificationsCallback = Notifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
