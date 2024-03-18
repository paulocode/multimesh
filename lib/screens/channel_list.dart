import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/channel_service.dart';
import '../widgets/channel_card.dart';

class ChannelListScreen extends ConsumerWidget {
  const ChannelListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channels = ref.watch(channelServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Channel List'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: channels.length,
          itemBuilder: (context, index) {
            final channel = channels[index];
            if (!channel.used) {
              return Container();
            }
            return ChannelCard(
              channel: channel,
              index: index,
            );
          },
        ),
      ),
    );
  }
}
