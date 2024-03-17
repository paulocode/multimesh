import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/ble/ble_radio_scanner.dart';
import '../widgets/connected_radio.dart';
import '../widgets/radio_choice_tile.dart';

class RadioConnectionScreen extends ConsumerWidget {
  const RadioConnectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bleRadioScanner = ref.watch(bleRadioScannerProvider);
    final meshRadios = bleRadioScanner.meshRadios;

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
            padding: const EdgeInsets.only(right: 20),
            child: Scrollbar(
              child: ListView.builder(
                itemCount: meshRadios.length,
                itemBuilder: (context, index) {
                  final radio = meshRadios[index];
                  return RadioChoiceTile(
                    radio: radio,
                  );
                },
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
              child: bleRadioScanner.scanning
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
