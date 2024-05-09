import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../providers/channel_service.dart';

class ChannelQrScanner extends ConsumerStatefulWidget {
  const ChannelQrScanner({super.key});

  @override
  ConsumerState<ChannelQrScanner> createState() => _ChannelQrScannerState();
}

class _ChannelQrScannerState extends ConsumerState<ChannelQrScanner> {
  String? qrValue;
  final MobileScannerController controller = MobileScannerController();
  final _logger = Logger();
  bool _isUploadingChannels = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Channel QR Scanner'),
      ),
      body: _isUploadingChannels
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : MobileScanner(
              controller: controller,
              onDetect: (capture) async {
                final barcodes = capture.barcodes;
                for (final barcode in barcodes) {
                  qrValue = barcode.rawValue;
                  _logger.i('Scanned QR $qrValue');
                  final isValid = ref
                      .read(channelServiceProvider.notifier)
                      .validateQr(qrValue);
                  if (!isValid) {
                    return;
                  }
                  await controller.stop();
                  // ignore: use_build_context_synchronously
                  final confirmed = await _showConfirmationDialog(context);
                  if (!confirmed) {
                    await controller.start();
                    return;
                  }
                  setState(() {
                    _isUploadingChannels = true;
                  });
                  try {
                    await ref
                        .read(channelServiceProvider.notifier)
                        .processQr(qrValue);
                  } on TimeoutException {
                    await _showErrorDialog(
                      // ignore: use_build_context_synchronously
                      context,
                      'Save timeout. Reconnect and try again.',
                    );
                  } catch (e) {
                    _logger.e(e.toString());
                    await _showErrorDialog(
                      // ignore: use_build_context_synchronously
                      context,
                      'Unknown error. Reconnect and try again.',
                    );
                  }
                  if (context.mounted) {
                    context.pop(true);
                  }
                }
              },
            ),
    );
  }

  Future<bool> _showConfirmationDialog(BuildContext context) async {
    if (!context.mounted) {
      return false;
    }
    return await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: const Text('Channel QR'),
              content: const Text(
                'Upload scanned channels? This may reboot the device.',
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
        ) ??
        false;
  }

  Future<void> _showErrorDialog(BuildContext context, String msg) async {
    if (!context.mounted) {
      return;
    }
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Channel Upload Failed'),
          content: Text(msg),
          actions: [
            TextButton(
              child: const Text('Continue'),
              onPressed: () {
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }
}
