import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:protobuf/protobuf.dart';

import '../../models/radio_connector_state.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../../providers/radio_config/radio_config_service.dart';
import '../../providers/radio_config/radio_config_uploader_service.dart';
import '../../providers/radio_connector_service.dart';
import 'confirmation_dialog.dart';

class UserConfigScreen extends ConsumerStatefulWidget {
  const UserConfigScreen({super.key});

  @override
  ConsumerState<UserConfigScreen> createState() => _UserConfigState();
}

class _UserConfigState extends ConsumerState<UserConfigScreen> {
  final _longNameController = TextEditingController();
  final _shortNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late User _user;

  @override
  void initState() {
    _user = ref.read(radioConfigServiceProvider).myNodeInfo.user.deepCopy();
    super.initState();
  }

  @override
  void dispose() {
    _longNameController.dispose();
    _shortNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prevUser = ref
        .watch(radioConfigServiceProvider.select((value) => value.myNodeInfo))
        .user;
    final radioConnectorState = ref.watch(radioConnectorServiceProvider);
    _longNameController.text = _user.longName;
    _shortNameController.text = _user.shortName;
    return Scaffold(
      appBar: AppBar(
        title: const Text('User ⚙️'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: radioConnectorState is Connected
                ? Icon(
                    Icons.cloud_done_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : Icon(
                    Icons.cloud_off,
                    color: Theme.of(context).colorScheme.error,
                  ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _longNameController,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {
                    setState(() {
                      _user.longName = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Input long name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    alignLabelWithHint: true,
                    labelText: 'Long name',
                  ),
                ),
                TextFormField(
                  controller: _shortNameController,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {
                    setState(() {
                      _user.shortName = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Input short name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    alignLabelWithHint: true,
                    labelText: 'Short name',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                OutlinedButton.icon(
                  onPressed:
                      radioConnectorState is Connected && prevUser != _user
                          ? () async {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              // device will reset after setting user config
                              // so we do not have to update local config here.
                              final confirmed = await showConfirmationDialog(
                                context,
                                'Save will reboot device. Continue?',
                              );
                              if (!confirmed) {
                                return;
                              }
                              // TODO: add error handling
                              await ref
                                  .read(radioConfigUploaderServiceProvider)
                                  .uploadUser(
                                    user: _user,
                                  );
                              if (context.mounted) {
                                context.go('/');
                              }
                            }
                          : null,
                  label: const Text('Save'),
                  icon: const Icon(Icons.save_alt),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
