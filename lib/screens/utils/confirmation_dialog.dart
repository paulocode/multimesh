import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<bool> showConfirmationDialog(
  BuildContext context,
  String msg, {
  String negative = 'Cancel',
  String positive = 'Continue',
  String title = 'Confirmation',
}) async {
  if (!context.mounted) {
    return false;
  }
  return await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(msg),
            actions: [
              TextButton(
                child: Text(negative),
                onPressed: () {
                  context.pop(false);
                },
              ),
              TextButton(
                child: Text(positive),
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
