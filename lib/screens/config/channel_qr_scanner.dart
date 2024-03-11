import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../providers/services/channel_service.dart';

class ChannelQrScanner extends ConsumerStatefulWidget {
  const ChannelQrScanner({super.key});

  @override
  ConsumerState<ChannelQrScanner> createState() => _ChannelQrScannerState();
}

class _ChannelQrScannerState extends ConsumerState<ChannelQrScanner> {
  String? qrValue;
  final MobileScannerController controller = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Channel QR Scanner'),
      ),
      body: MobileScanner(
        controller: controller,
        onDetect: (capture) async {
          final barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            qrValue = barcode.rawValue;
            debugPrint('Scanned QR $qrValue');
            final isValid =
                ref.read(channelServiceProvider.notifier).validateQr(qrValue);
            if (isValid) {
              await controller.stop();
              // ignore: use_build_context_synchronously
              final confirmed = await _showConfirmationDialog(context);
              if (!context.mounted) {
                return;
              }
              if (confirmed ?? false) {
                context.pop();
              } else {
                await controller.start();
              }
            }
          }
        },
      ),
    );
  }

  Future<bool?> _showConfirmationDialog(BuildContext context) async {
    if (!context.mounted) {
      return false;
    }
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Channel QR'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Upload scanned channels to device?'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                context.pop(false);
              },
            ),
            TextButton(
              child: const Text('Continue'),
              onPressed: () {
                context.pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}
