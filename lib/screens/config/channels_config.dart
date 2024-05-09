import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../models/mesh_channel.dart';
import '../../protobufs/generated/meshtastic/channel.pb.dart';
import '../../providers/channel_service.dart';
import '../../utils/extensions.dart';
import '../../widgets/app_bar_connection_indicator.dart';
import '../../widgets/channel_input_form.dart';
import '../../widgets/channel_qr_show.dart';
import '../utils/confirmation_dialog.dart';
import '../utils/snackbar_message.dart';

class ChannelsConfigScreen extends ConsumerStatefulWidget {
  const ChannelsConfigScreen({super.key});

  @override
  ConsumerState<ChannelsConfigScreen> createState() =>
      _ChannelsConfigScreenState();
}

class _ChannelsConfigScreenState extends ConsumerState<ChannelsConfigScreen> {
  final _inputController = TextEditingController();
  bool _uploading = false;

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final channels = ref.watch(channelServiceProvider).toList();
    final channelService = ref.watch(channelServiceProvider.notifier);
    final activeChannels = channels.where((element) => element.used).toList();
    return Scaffold(
      appBar: const AppBarWithConnectionIndicator(title: 'Channels ⚙️'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: activeChannels.length,
                      itemBuilder: (ctx, index) {
                        return InkWell(
                          onTap: () async {
                            _showModalForChannel(
                              context,
                              constraints,
                              activeChannels[index],
                              isNew: false,
                            );
                          },
                          child: Card(
                            child: ListTile(
                              leading:
                                  Text(activeChannels[index].index.toString()),
                              title: Text(activeChannels[index].name),
                              subtitle: Text(
                                activeChannels[index]
                                    .role
                                    .toString()
                                    .capitalize(),
                              ),
                              trailing: const Icon(Icons.edit),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    IconButton.filled(
                      onPressed: activeChannels.length == 8
                          ? null
                          : () {
                              _showModalForChannel(
                                context,
                                constraints,
                                isNew: true,
                                MeshChannel(
                                  name: '',
                                  role: Channel_Role.SECONDARY,
                                  key: [1],
                                  index: _firstDisabledSlot(channels),
                                  uplinkEnabled: false,
                                  downlinkEnabled: false,
                                ),
                              );
                            },
                      icon: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OutlinedButton.icon(
                              onPressed: () async {
                                final result = await context
                                        .push<bool>('/channelQrScanner') ??
                                    false;
                                if (result) {
                                  showSnackBarMessage(
                                    context, // ignore: use_build_context_synchronously
                                    'Saved',
                                  );
                                }
                              },
                              label: const Text('Scan QR'),
                              icon: const Icon(Icons.camera),
                            ),
                            OutlinedButton.icon(
                              onPressed: () async {
                                final channelUrl = await _showModalForInput(
                                  context,
                                  constraints,
                                );
                                if (!channelService.validateQr(channelUrl)) {
                                  _showError(
                                    context, // ignore: use_build_context_synchronously
                                    'Invalid Channel URL',
                                  );
                                  return;
                                }
                                if (await showConfirmationDialog(
                                  context, // ignore: use_build_context_synchronously
                                  'Upload channels? This may reboot the device.',
                                  title: 'Upload channels',
                                )) {
                                  setState(() {
                                    _uploading = true;
                                  });
                                  await channelService.processQr(channelUrl);
                                  showSnackBarMessage(
                                    context, // ignore: use_build_context_synchronously
                                    'Saved',
                                  );
                                  setState(() {
                                    _uploading = false;
                                  });
                                }
                              },
                              label: const Text('Input QR'),
                              icon: const Icon(Icons.input),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        OutlinedButton.icon(
                          onPressed: () {
                            _showModalForQr(
                              context,
                              constraints,
                              channelService.generateUrl(),
                            );
                          },
                          label: const Text('Show QR'),
                          icon: const Icon(Icons.qr_code),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              if (_uploading)
                SizedBox.expand(
                  child: ColoredBox(
                    color: Colors.black.withAlpha(200),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                )
              else
                Container(),
            ],
          );
        },
      ),
    );
  }

  int _firstDisabledSlot(List<MeshChannel> channels) =>
      channels.indexOf(channels.firstWhere((element) => !element.used));

  void _showModalForChannel(
    BuildContext context,
    BoxConstraints constraints,
    MeshChannel channel, {
    required bool isNew,
  }) {
    showModalBottomSheet<void>(
      context: context,
      constraints: BoxConstraints(
        minWidth: constraints.maxWidth > 600 ? 600 : constraints.maxWidth,
        maxWidth: 600,
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: ChannelInputForm(
            channel: channel.copyWith(),
            isNew: isNew,
          ),
        );
      },
    );
  }

  void _showModalForQr(
    BuildContext context,
    BoxConstraints constraints,
    String url,
  ) {
    showModalBottomSheet<void>(
      context: context,
      constraints: BoxConstraints(
        minWidth: constraints.maxWidth > 600 ? 600 : constraints.maxWidth,
        maxWidth: 600,
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: ChannelQrShow(url),
        );
      },
    );
  }

  Future<String?> _showModalForInput(
    BuildContext context,
    BoxConstraints constraints,
  ) async {
    return showModalBottomSheet<String>(
      context: context,
      constraints: BoxConstraints(
        minWidth: constraints.maxWidth > 600 ? 600 : constraints.maxWidth,
        maxWidth: 600,
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _inputController,
                decoration: const InputDecoration(
                  labelText: 'https://meshtastic.org/e/#...',
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context, _inputController.value.text);
                  _inputController.clear();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showError(BuildContext context, String msg) {
    if (!context.mounted) {
      return;
    }
    final snackBar = SnackBar(
      backgroundColor: Theme.of(context).colorScheme.error,
      content: Text(
        msg,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Theme.of(context).colorScheme.onError),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
