import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications.g.dart';

@Riverpod(keepAlive: true)
Future<FlutterLocalNotificationsPlugin> flutterLocalNotificationsPlugin(
  FlutterLocalNotificationsPluginRef ref,
) async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();

  const initializationSettingsAndroid = AndroidInitializationSettings('splash');

  const initializationSettingsDarwin = DarwinInitializationSettings();

  const initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  return flutterLocalNotificationsPlugin;
}

@Riverpod(keepAlive: true)
Future<void> showNotification(
  ShowNotificationRef ref,
  String title,
  String text,
  String callbackValue,
) async {
  final flutterLocalNotificationsPlugin =
      await ref.read(flutterLocalNotificationsPluginProvider.future);
  const androidNotificationDetails = AndroidNotificationDetails(
    '1',
    'Meshtastic messages',
    channelDescription: 'Meshtastic messages',
    importance: Importance.max,
    priority: Priority.high,
  );

  const iOSPlatformChannelSpecifics =
      DarwinNotificationDetails(threadIdentifier: '1');

  const notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
    iOS: iOSPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin
      .show(0, title, text, notificationDetails, payload: callbackValue);
}
