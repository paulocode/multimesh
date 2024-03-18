import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/channel_service.dart';
import 'providers/node_service.dart';
import 'providers/notifications.dart';
import 'providers/radio_config/radio_config_downloader_service.dart';
import 'providers/repository/sqflite.dart';
import 'providers/router.dart';
import 'providers/text_message/text_message_receiver_service.dart';
import 'providers/wrap/local_platform.dart';
import 'theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    final localPlatform = ref.read(localPlatformProvider);
    if (localPlatform.isAndroid || localPlatform.isIOS) {
      _initForegroundTask();
      FlutterForegroundTask.startService(
        notificationTitle: 'meshx',
        notificationText: 'Tap to view',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const WithForegroundTask(
      child: _EagerInitialization(
        child: SafeArea(
          child: RouterWidget(),
        ),
      ),
    );
  }
}

class RouterWidget extends ConsumerWidget {
  const RouterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final notificationsCallback = ref.watch(notificationsCallbackProvider);
    if (notificationsCallback != null) {
      router.go('/');
      router.push(notificationsCallback);
    }
    return MaterialApp.router(
      title: 'Meshtastic',
      theme: theme,
      darkTheme: darkTheme,
      routerConfig: ref.watch(goRouterProvider),
    );
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // make sure database is done initialising before
    // running app
    final sqflite = ref.watch(sqfliteProvider);
    if (sqflite.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      // make sure these providers are ready to accept packets
      ref.watch(textMessageReceiverServiceProvider);
      ref.watch(channelServiceProvider);
      ref.watch(nodeServiceProvider);
      ref.watch(radioConfigDownloaderServiceProvider);
      return child;
    }
  }
}

void _initForegroundTask() {
  FlutterForegroundTask.init(
    androidNotificationOptions: AndroidNotificationOptions(
      channelId: 'foreground_service',
      channelName: 'Foreground Service Notification',
      channelDescription:
          'This notification appears when the foreground service is running.',
      channelImportance: NotificationChannelImportance.LOW,
      priority: NotificationPriority.LOW,
      iconData: const NotificationIconData(
        resType: ResourceType.mipmap,
        resPrefix: ResourcePrefix.ic,
        name: 'launcher',
      ),
    ),
    iosNotificationOptions:
        const IOSNotificationOptions(showNotification: false),
    foregroundTaskOptions: const ForegroundTaskOptions(),
  );
}
