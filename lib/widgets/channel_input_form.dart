import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../models/mesh_channel.dart';
import '../protobufs/generated/meshtastic/channel.pb.dart';
import '../providers/channel_service.dart';
import '../providers/router.dart';

class ChannelInputForm extends ConsumerStatefulWidget {
  const ChannelInputForm({
    super.key,
    required this.channel,
    required this.isNew,
  });

  final MeshChannel channel;
  final bool isNew;

  @override
  ConsumerState<ChannelInputForm> createState() => _ChannelInputFormState();
}

class _ChannelInputFormState extends ConsumerState<ChannelInputForm> {
  late MeshChannel channel;
  final _formKey = GlobalKey<FormState>();
  final _channelNameController = TextEditingController();
  final _keyController = TextEditingController();
  final _logger = Logger();
  bool _saving = false;
  bool _edited = false;

  @override
  void initState() {
    channel = widget.channel;
    _channelNameController.text = channel.name;
    _keyController.text = base64.encode(channel.key);
    super.initState();
  }

  @override
  void dispose() {
    _channelNameController.dispose();
    _keyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final channelService = ref.watch(channelServiceProvider.notifier);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _channelNameController,
            textInputAction: TextInputAction.done,
            onChanged: (_) {
              setState(() {
                _edited = true;
              });
            },
            onSaved: (value) {
              channel = channel.copyWith(name: value!);
            },
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Input channel name';
              }
              return null;
            },
            decoration: const InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              alignLabelWithHint: true,
              labelText: 'Channel name',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _keyController,
                  textInputAction: TextInputAction.done,
                  minLines: 1,
                  maxLines: 2,
                  onChanged: (_) {
                    setState(() {
                      _edited = true;
                    });
                  },
                  onSaved: (value) {
                    channel = channel.copyWith(key: base64.decode(value!));
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Input key';
                    }
                    try {
                      base64.decode(value);
                    } on FormatException {
                      return 'Input valid key';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    alignLabelWithHint: true,
                    labelText: 'Key',
                  ),
                ),
              ),
              IconButton(
                onPressed: _createRandom256Key,
                icon: const Icon(
                  Icons.refresh,
                  size: 40,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(),
          const SizedBox(
            height: 8,
          ),
          SwitchListTile(
            title: const Text('Uplink enabled'),
            value: channel.uplinkEnabled,
            onChanged: (value) {
              setState(() {
                channel = channel.copyWith(uplinkEnabled: value);
                _edited = true;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Downlink enabled'),
            value: channel.downlinkEnabled,
            onChanged: (value) {
              setState(() {
                channel = channel.copyWith(downlinkEnabled: value);
                _edited = true;
              });
            },
          ),
          const SizedBox(
            height: 24,
          ),
          if (_saving)
            const Center(child: CircularProgressIndicator())
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                  onPressed: widget.isNew || _edited
                      ? () async {
                          final formState = _formKey.currentState!;
                          if (formState.validate()) {
                            formState.save();
                            _logger.i(channel);
                            await saveChannel(channelService, context);
                            ref.read(goRouterProvider).pop(channel);
                          }
                        }
                      : null,
                  label: const Text('Save'),
                  icon: const Icon(Icons.save_alt),
                ),
                OutlinedButton.icon(
                  onPressed: widget.isNew || channel.index == 0
                      ? null
                      : () async {
                          channel =
                              channel.copyWith(role: Channel_Role.DISABLED);
                          await saveChannel(channelService, context);
                          ref.read(goRouterProvider).pop(channel);
                        },
                  icon: const Icon(Icons.delete),
                  label: const Text('Disable'),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Future<void> saveChannel(
    ChannelService channelService,
    BuildContext context,
  ) async {
    setState(() {
      _saving = true;
    });
    try {
      await channelService.updateChannel(channel);
    } on TimeoutException {
      showError(
        context, // ignore: use_build_context_synchronously
        'Save timeout',
      );
    } catch (e) {
      showError(
        context, // ignore: use_build_context_synchronously
        'Unknown error occurred',
      );
    }
    setState(() {
      _saving = false;
    });
  }

  void showError(BuildContext context, String msg) {
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

  void _createRandom256Key() {
    final random = Random();
    final key = List.generate(32, (_) => random.nextInt(0xff));
    _keyController.text = base64.encode(key);
    setState(() {
      _edited = true;
    });
  }
}
