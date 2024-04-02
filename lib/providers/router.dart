import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/chat_type.dart';
import '../screens/chat.dart';
import '../screens/config/channel_qr_scanner.dart';
import '../screens/config/channels_config.dart';
import '../screens/config/lora_config.dart';
import '../screens/radio_config.dart';
import '../screens/tab_parent.dart';

part 'router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
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
    ],
  );
}
