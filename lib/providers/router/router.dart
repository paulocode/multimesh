import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../screens/chat.dart';
import '../../screens/radio_config.dart';
import '../../screens/tab_parent.dart';

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
        path: '/chat',
        builder: (context, state) {
          return ChatScreen(
            channel: int.parse(state.uri.queryParameters['channel']!),
          );
        },
      ),
    ],
  );
}
