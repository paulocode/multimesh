import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<bool> showConfirmationDialog(BuildContext context, String msg) async {
  if (!context.mounted) {
    return false;
  }
  return await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text('Confirmation'),
            content: Text(msg),
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
