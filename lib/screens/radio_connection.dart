import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/mesh_radio.dart';
import '../models/radio_connector_state.dart';
import '../providers/ble/ble_radio_scanner.dart';
import '../providers/tcp/tcp_radio_connector.dart';
import '../providers/tcp/tcp_radio_scanner.dart';
import '../widgets/connected_radio.dart';
import '../widgets/radio_choice_tile.dart';

class RadioConnectionScreen extends ConsumerWidget {
  const RadioConnectionScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bleRadioScanner = ref.watch(bleRadioScannerProvider);
    final tcpRadioScanner = ref.watch(tcpRadioScannerProvider);
    final bleMeshRadios = bleRadioScanner.meshRadios;
    final tcpMeshRadios = tcpRadioScanner.meshRadios;

    return LayoutBuilder(
      builder: (context, constraints) {
        late final Widget body;

        final connectedRadio = ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: const ConnectedRadio(),
        );

        final scanList = ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Scrollbar(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Text(
                      'BLE devices:',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => RadioChoiceTile(
                        radio: bleMeshRadios[index],
                      ),
                      childCount: bleMeshRadios.length,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Text(
                      'TCP devices:',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => RadioChoiceTile(
                        radio: tcpMeshRadios[index],
                      ),
                      childCount: tcpMeshRadios.length,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: ManualNetworkAddressInput(),
                  ),
                ],
              ),
            ),
          ),
        );

        if (constraints.maxHeight < 500 && constraints.maxWidth > 700) {
          body = Row(
            mainAxisAlignment: Platform.isIOS || Platform.isMacOS
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(child: connectedRadio),
              Flexible(child: scanList),
            ],
          );
        } else {
          body = SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: Platform.isIOS || Platform.isMacOS
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [connectedRadio, Expanded(child: scanList)],
            ),
          );
        }

        return ScaffoldMessenger(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Radio Connection'),
            ),
            body: body,
            floatingActionButton: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              radius: 50,
              child: bleRadioScanner.scanning || tcpRadioScanner.scanning
                  ? const SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                    )
                  : IconButton(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      onPressed: () {
                        ref.read(tcpRadioScannerProvider.notifier).scan();
                        ref.read(bleRadioScannerProvider.notifier).scan();
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 50,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}

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
            onPressed: () {
              ref.read(tcpRadioConnectorProvider.notifier).connect(
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
