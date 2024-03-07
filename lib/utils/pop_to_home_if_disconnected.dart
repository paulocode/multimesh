import 'package:flutter/material.dart';

import '../models/radio_connector_state.dart';

void popToHomeIfDisconnected(BuildContext context, RadioConnectorState state) {
  if (state is! Connected) {
    Future.microtask(
      () => Navigator.popUntil(context, ModalRoute.withName('/')),
    );
  }
}
