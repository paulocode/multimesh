import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/radio_connector_state.dart';
import '../providers/ble/ble_radio_scanner.dart';
import '../providers/radio_connector_service.dart';
import '../providers/tcp/tcp_radio_scanner.dart';
import '../widgets/connected_radio.dart';
import '../widgets/manual_network_address_input.dart';
import '../widgets/radio_choice_tile.dart';

class RadioConnectionScreen extends ConsumerStatefulWidget {
  const RadioConnectionScreen({super.key});
  @override
  ConsumerState<RadioConnectionScreen> createState() =>
      _RadioConnectionScreenState();
}

class _RadioConnectionScreenState extends ConsumerState<RadioConnectionScreen> {
  var _didDisplayError = false;

  @override
  Widget build(BuildContext context) {
    final bleRadioScanner = ref.watch(bleRadioScannerProvider);
    final tcpRadioScanner = ref.watch(tcpRadioScannerProvider);
    final bleMeshRadios = bleRadioScanner.meshRadios;
    final tcpMeshRadios = tcpRadioScanner.meshRadios;

    final radioConnectorState = ref.watch(radioConnectorServiceProvider);

    if (!_didDisplayError && radioConnectorState is ConnectionError) {
      _didDisplayError = true;
      final snackBar = SnackBar(
        backgroundColor: Theme.of(context).colorScheme.error,
        content: Text(
          radioConnectorState.msg,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onError),
        ),
      );
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }

    if (radioConnectorState is Connecting) {
      _didDisplayError = false;
    }

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
                child: ManualNetworkAddressInput(),
              ),
            ],
          ),
        ),
      ),
    );

    return ScaffoldMessenger(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Radio Connection'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: Platform.isIOS || Platform.isMacOS
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [connectedRadio, Expanded(child: scanList)],
          ),
        ),
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
  }
}
