// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(flutterLocalNotificationsPlugin)
const flutterLocalNotificationsPluginProvider =
    FlutterLocalNotificationsPluginProvider._();

final class FlutterLocalNotificationsPluginProvider extends $FunctionalProvider<
        AsyncValue<FlutterLocalNotificationsPlugin>,
        FlutterLocalNotificationsPlugin,
        FutureOr<FlutterLocalNotificationsPlugin>>
    with
        $FutureModifier<FlutterLocalNotificationsPlugin>,
        $FutureProvider<FlutterLocalNotificationsPlugin> {
  const FlutterLocalNotificationsPluginProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'flutterLocalNotificationsPluginProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$flutterLocalNotificationsPluginHash();

  @$internal
  @override
  $FutureProviderElement<FlutterLocalNotificationsPlugin> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<FlutterLocalNotificationsPlugin> create(Ref ref) {
    return flutterLocalNotificationsPlugin(ref);
  }
}

String _$flutterLocalNotificationsPluginHash() =>
    r'3e286e2d2c576c7010864a1d8ae683764b870d73';

@ProviderFor(NotificationsCallback)
const notificationsCallbackProvider = NotificationsCallbackProvider._();

final class NotificationsCallbackProvider
    extends $NotifierProvider<NotificationsCallback, String?> {
  const NotificationsCallbackProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'notificationsCallbackProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$notificationsCallbackHash();

  @$internal
  @override
  NotificationsCallback create() => NotificationsCallback();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$notificationsCallbackHash() =>
    r'84257737ca845a0e9b6019d58e2eb111f7319df1';

abstract class _$NotificationsCallback extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String?, String?>, String?, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(showNotification)
const showNotificationProvider = ShowNotificationFamily._();

final class ShowNotificationProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const ShowNotificationProvider._(
      {required ShowNotificationFamily super.from,
      required ({
        String title,
        String text,
        String callbackValue,
      })
          super.argument})
      : super(
          retry: null,
          name: r'showNotificationProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$showNotificationHash();

  @override
  String toString() {
    return r'showNotificationProvider'
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
      String title,
      String text,
      String callbackValue,
    });
    return showNotification(
      ref,
      title: argument.title,
      text: argument.text,
      callbackValue: argument.callbackValue,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ShowNotificationProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$showNotificationHash() => r'49812c1ba8027923df59118b330ad1f5790418b4';

final class ShowNotificationFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<void>,
            ({
              String title,
              String text,
              String callbackValue,
            })> {
  const ShowNotificationFamily._()
      : super(
          retry: null,
          name: r'showNotificationProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: false,
        );

  ShowNotificationProvider call({
    required String title,
    required String text,
    required String callbackValue,
  }) =>
      ShowNotificationProvider._(argument: (
        title: title,
        text: text,
        callbackValue: callbackValue,
      ), from: this);

  @override
  String toString() => r'showNotificationProvider';
}
