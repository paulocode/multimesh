import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:protobuf/protobuf.dart';

import '../../models/radio_connector_state.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../../providers/radio_config/radio_config_service.dart';
import '../../providers/radio_config/radio_config_uploader_service.dart';
import '../../providers/radio_connector_service.dart';
import '../../widgets/app_bar_connection_indicator.dart';
import '../utils/confirmation_dialog.dart';
import '../utils/snackbar_message.dart';

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
      appBar: const AppBarWithConnectionIndicator(title: 'User ⚙️'),
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
                  maxLength: 36,
                  onChanged: (value) {
                    setState(() {
                      _user.longName = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Input long name';
                    }
                    if (value.length > 36) {
                      return 'Long name must be <= 36 bytes';
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
                  maxLength: 4,
                  onChanged: (value) {
                    setState(() {
                      _user.shortName = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Input short name';
                    }
                    if (value.length > 4) {
                      return 'Short name must be <= 4 bytes';
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
                                'Save may reboot device. Continue?',
                              );
                              if (!confirmed) {
                                return;
                              }
                              // TODO: add error handling
                              await ref
                                  .read(radioConfigUploaderServiceProvider)
                                  .uploadUser(
                                    user: _user.deepCopy(),
                                  );
                              showSnackBarMessage(
                                context, // ignore: use_build_context_synchronously
                                'Saved',
                              );
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
