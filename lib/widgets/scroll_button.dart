import 'package:flutter/material.dart';

class ScrollButton extends StatelessWidget {
  const ScrollButton({
    super.key,
    required void Function() scrollToBottom,
    required bool showNewMessageAlert,
  })  : _showNewMessageAlert = showNewMessageAlert,
        _scrollToBottom = scrollToBottom;

  final void Function() _scrollToBottom;
  final bool _showNewMessageAlert;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          radius: 30,
          child: IconButton(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            onPressed: _scrollToBottom,
            icon: const Icon(
              Icons.arrow_downward,
              size: 30,
            ),
          ),
        ),
        if (_showNewMessageAlert)
          Positioned(
            right: 0,
            child: Icon(
              size: 20,
              Icons.message_rounded,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
      ],
    );
  }
}
