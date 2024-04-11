import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/chat_type.dart';
import '../screens/chat.dart';
import '../screens/config/bt_config.dart';
import '../screens/config/channel_qr_scanner.dart';
import '../screens/config/channels_config.dart';
import '../screens/config/lora_config.dart';
import '../screens/config/user_config.dart';
import '../screens/node_info.dart';
import '../screens/radio_config.dart';
import '../screens/tab_parent.dart';
import '../services/telemetry_logger.dart';
import '../widgets/traceroute_modal.dart';
import 'telemetry_logger.dart';

part 'router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    observers: [
      GoRouterObserver(logger: ref.watch(telemetryLoggerProvider)),
    ],
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const TabParent();
        },
      ),
      GoRoute(
        path: '/radioConfig',
        builder: (context, state) {
          return const RadioConfigScreen();
        },
      ),
      GoRoute(
        path: '/userConfig',
        builder: (context, state) {
          return const UserConfigScreen();
        },
      ),
      GoRoute(
        path: '/channelQrScanner',
        builder: (context, state) {
          return const ChannelQrScanner();
        },
      ),
      GoRoute(
        path: '/channelsConfig',
        builder: (context, state) {
          return const ChannelsConfigScreen();
        },
      ),
      GoRoute(
        path: '/btConfig',
        builder: (context, state) {
          return const BtConfigScreen();
        },
      ),
      GoRoute(
        path: '/loraConfig',
        builder: (context, state) {
          return const LoraConfigScreen();
        },
      ),
      GoRoute(
        path: '/chat',
        builder: (context, state) {
          late final ChatType chatType;
          final dmNode =
              int.tryParse(state.uri.queryParameters['dmNode'] ?? '');
          final channel =
              int.tryParse(state.uri.queryParameters['channel'] ?? '');
          if (dmNode != null) {
            chatType = DirectMessageChat(
              dmNode: dmNode,
            );
          } else {
            chatType = ChannelChat(channel: channel ?? 0);
          }
          return ChatScreen(
            chatType: chatType,
          );
        },
      ),
      GoRoute(
        path: '/nodeInfo',
        builder: (context, state) {
          final id =
              int.tryParse(state.uri.queryParameters['nodeNum'] ?? '') ?? 0;
          return NodeInfoScreen(id);
        },
      ),
      GoRoute(
        path: '/traceroute',
        builder: (context, state) {
          final id =
              int.tryParse(state.uri.queryParameters['nodeNum'] ?? '') ?? 0;
          return TracerouteModal(id);
        },
      ),
    ],
  );
}

class GoRouterObserver extends NavigatorObserver {
  GoRouterObserver({required TelemetryLogger logger}) : _logger = logger;

  final TelemetryLogger _logger;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logger.i(
      'nav push ${previousRoute?.settings.name} -> ${route.settings.name}',
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logger
        .i('nav pop ${route.settings.name} -> ${previousRoute?.settings.name}');
  }
}
