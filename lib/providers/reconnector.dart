import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/radio_connector_state.dart';
import 'radio_connector_service.dart';

part 'reconnector.g.dart';

@Riverpod(keepAlive: true)
class ReconnectorService extends _$ReconnectorService {
  final _logger = Logger();
  bool _canReconnect = true;

  @override
  dynamic build({Duration delay = const Duration(seconds: 15)}) {
    ref.listen(radioConnectorServiceProvider, (prev, next) async {
      if (next is Connected) {
        _canReconnect = true;
        return;
      }

      if (prev is Connected && next is Disconnected) {
        if (!_canReconnect) {
          _logger.i('Not autoreconnecting to $prev');
          return;
        }
        do {
          _logger.i('Reconnecting to $prev');
          await ref
              .read(radioConnectorServiceProvider.notifier)
              .connect(prev.radio);
          await Future<void>.delayed(delay);
        } while (ref.read(radioConnectorServiceProvider) is! Connected);
        _logger.i('Ended reconnect loop for $prev');
      }
    });
    return null;
  }

  void disableReconnectUntilNextDisconnect() {
    _canReconnect = false;
  }
}
