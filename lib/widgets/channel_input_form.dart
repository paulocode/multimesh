import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../models/mesh_channel.dart';
import '../providers/channel_service.dart';
import '../providers/router.dart';

class ChannelInputForm extends ConsumerStatefulWidget {
  const ChannelInputForm({
    super.key,
    required this.channel,
  });

  final MeshChannel channel;

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
          TextFormField(
            controller: _keyController,
            textInputAction: TextInputAction.done,
            minLines: 1,
            maxLines: 2,
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
          const SizedBox(
            height: 24,
          ),
          if (_saving)
            const CircularProgressIndicator()
          else
            OutlinedButton.icon(
              onPressed: () async {
                final formState = _formKey.currentState!;
                if (formState.validate()) {
                  formState.save();
                  _logger.i(channel);
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
                  ref.read(goRouterProvider).pop(channel);
                }
              },
              label: const Text('Save'),
              icon: const Icon(Icons.save_alt),
            ),
        ],
      ),
    );
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
}
