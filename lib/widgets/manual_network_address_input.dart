import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/mesh_radio.dart';
import '../models/radio_connector_state.dart';
import '../providers/radio_connector_service.dart';
import '../providers/tcp/tcp_radio_connector.dart';

class ManualNetworkAddressInput extends ConsumerStatefulWidget {
  const ManualNetworkAddressInput({super.key});

  @override
  ConsumerState<ManualNetworkAddressInput> createState() =>
      _ManualNetworkAddressInputState();
}

class _ManualNetworkAddressInputState
    extends ConsumerState<ManualNetworkAddressInput> {
  bool _connectingToManualInput = false;
  final _manualInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final connectorState = ref.watch(tcpRadioConnectorProvider);
    switch (connectorState) {
      case Connecting():
        break;
      case ConnectionError():
        if (!_connectingToManualInput) {
          break;
        }
        if (connectorState.radioId == _manualInputController.text) {
          final snackBar = SnackBar(
            backgroundColor: Theme.of(context).colorScheme.error,
            content: Text(
              connectorState.msg,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onError),
            ),
          );
          setState(() {
            _connectingToManualInput = false;
          });
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        }
      case _:
        setState(() {
          _connectingToManualInput = false;
        });
    }
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: TextField(
              controller: _manualInputController,
              decoration: const InputDecoration(
                hintText: 'Host/IP Address',
                filled: true,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        if (_connectingToManualInput)
          const CircularProgressIndicator()
        else
          IconButton(
            onPressed: () async {
              await ref
                  .read(radioConnectorServiceProvider.notifier)
                  .disconnect();
              await ref.read(radioConnectorServiceProvider.notifier).connect(
                    TcpMeshRadio(
                      address: _manualInputController.text,
                    ),
                  );
              setState(() {
                _connectingToManualInput = true;
              });
            },
            icon: const Icon(Icons.send),
          ),
      ],
    );
  }
}