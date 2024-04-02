import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/mesh_channel.dart';
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

  @override
  void initState() {
    channel = widget.channel;
    _channelNameController.text = channel.name;
    _keyController.text = base64.encode(channel.key);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _channelNameController,
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
            maxLines: 2,
            decoration: const InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              alignLabelWithHint: true,
              labelText: 'Key',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          OutlinedButton.icon(
            onPressed: () {
              final formState = _formKey.currentState!;
              if (formState.validate()) {
                formState.save();
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
}
