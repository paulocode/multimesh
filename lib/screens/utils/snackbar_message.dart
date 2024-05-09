import 'package:flutter/material.dart';

void showSnackBarMessage(
  BuildContext context,
  String message, {
  bool error = false,
}) {
  if (!context.mounted) {
    return;
  }
  final colorScheme = Theme.of(context).colorScheme;
  final snackBar = SnackBar(
    backgroundColor: error ? colorScheme.error : colorScheme.secondary,
    content: Text(
      message,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: error ? colorScheme.onError : colorScheme.onSecondary,
          ),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
