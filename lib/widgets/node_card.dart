import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/chat_type.dart';
import '../models/mesh_node.dart';
import '../providers/node/hops_away.dart';
import '../providers/node/node_service.dart';
import '../providers/radio_config/radio_config_service.dart';
import '../providers/telemetry/telemetry_latest_streamer.dart';
import '../providers/text_message/text_message_stream_service.dart';
import '../utils/extensions.dart';

class NodeCard extends ConsumerWidget {
  const NodeCard({
    super.key,
    required this.node,
    required this.showChevron,
  });

  final MeshNode node;
  final bool showChevron;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nodes = ref.watch(nodeServiceProvider);
    final myNodeNum = ref
        .watch(radioConfigServiceProvider.select((value) => value.myNodeNum));
    final displayFahrenheit = ref.watch(
      radioConfigServiceProvider.select(
        (value) => value.telemetryConfig.environmentDisplayFahrenheit,
      ),
    );
    final telemetry =
        ref.watch(telemetryLatestStreamerProvider(nodeNum: node.nodeNum));
    final textMessageStreamService = ref.watch(
      textMessageStreamServiceProvider(
        chatType: DirectMessageChat(dmNode: node.nodeNum),
      ),
    );
    final hopsAway = ref.watch(hopsAwayProvider(node.nodeNum));
    return StreamBuilder(
      stream: textMessageStreamService.stream,
      initialData: textMessageStreamService.getMessages(),
      builder: (context, snapshot) {
        final lastMessage = snapshot.data!.lastOrNull;
        final lastSender = lastMessage?.from;
        final lastSenderShortName = nodes[lastSender]?.shortName ?? '';
        return Hero(
          tag: node.nodeNum,
          child: SizedBox(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 4,
                  top: 8,
                  bottom: 8,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Text(node.shortName),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            node.longName,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          if (node.batteryLevel != null &&
                              node.batteryLevel != 0)
                            Row(
                              children: [
                                const Icon(
                                  Icons.battery_charging_full_sharp,
                                  size: 20,
                                ),
                                Text('${node.batteryLevel}%'),
                              ],
                            ),
                          if (telemetry.temp != null)
                            Row(
                              children: [
                                const Icon(
                                  Icons.thermostat,
                                  size: 20,
                                ),
                                if (displayFahrenheit)
                                  Text(
                                    '${telemetry.temp?.cToF().toStringAsFixed(2)}° F',
                                  )
                                else
                                  Text(
                                    '${telemetry.temp?.toStringAsFixed(2)}° C',
                                  ),
                              ],
                            ),
                          if (node.hwModel != null)
                            Row(
                              children: [
                                const Icon(
                                  Icons.radio,
                                  size: 20,
                                ),
                                Text('${node.hwModel}'),
                              ],
                            ),
                          if (lastMessage != null)
                            Row(
                              children: [
                                const Icon(
                                  Icons.message,
                                  size: 20,
                                ),
                                Text(
                                  '$lastSenderShortName: ',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(lastMessage.text),
                              ],
                            ),
                          if (hopsAway != null && myNodeNum != node.nodeNum)
                            Text('Hops: $hopsAway'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (myNodeNum != node.nodeNum)
                          IconButton(
                            onPressed: () {
                              context.push(
                                Uri(
                                  path: '/chat',
                                  queryParameters: {
                                    'channel': node.channel.toString(),
                                    'dmNode': node.nodeNum.toString(),
                                  },
                                ).toString(),
                              );
                            },
                            icon: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                const Icon(Icons.mail),
                                if (node.hasUnreadMessages)
                                  const Positioned(
                                    right: -2,
                                    child: Icon(
                                      Icons.circle,
                                      color: Colors.red,
                                      size: 10,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        if (showChevron)
                          IconButton(
                            onPressed: () {
                              context.push('/nodeInfo?nodeNum=${node.nodeNum}');
                            },
                            icon: const Icon(Icons.chevron_right),
                          )
                        else
                          const SizedBox(
                            width: 24,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
