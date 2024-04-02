import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import '../../models/mesh_channel.dart';
import '../../providers/channel_service.dart';
import '../../widgets/channel_input_form.dart';

class ChannelsConfigScreen extends ConsumerStatefulWidget {
  const ChannelsConfigScreen({super.key});

  @override
  ConsumerState<ChannelsConfigScreen> createState() =>
      _ChannelsConfigScreenState();
}

class _ChannelsConfigScreenState extends ConsumerState<ChannelsConfigScreen> {
  final logger = Logger();

  @override
  Widget build(BuildContext context) {
    final channelService = ref.watch(channelServiceProvider.notifier);
    final channels = ref
        .watch(channelServiceProvider)
        .where((element) => element.used)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Channels ⚙️'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: channels.length,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () async {
                        final channel = await showModalBottomSheet<MeshChannel>(
                          context: context,
                          constraints: BoxConstraints(
                            minWidth: constraints.maxWidth,
                            maxWidth: 600,
                          ),
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(16),
                              child: ChannelInputForm(
                                channel: channels[index].copyWith(),
                              ),
                            );
                          },
                        );
                        logger.i(channel);
                        if (channel != null) {
                          channelService.updateChannel(channel);
                        }
                      },
                      child: Card(
                        child: ListTile(
                          leading: Text(index.toString()),
                          title: Text(channels[index % 2].name),
                          trailing: const Icon(Icons.chevron_right),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                IconButton.filled(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {
                        context.push('/channelQrScanner');
                      },
                      label: const Text('Scan QR'),
                      icon: const Icon(Icons.camera),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      label: const Text('Show QR'),
                      icon: const Icon(Icons.qr_code),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}