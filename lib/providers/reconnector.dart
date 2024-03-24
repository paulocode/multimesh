import '../models/radio_connector_state.dart';
import 'radio_connector_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'reconnector.g.dart';

@Riverpod(keepAlive: true)
void reconnector(ReconnectorRef ref) {
  ref.listen(radioConnectorServiceProvider, (prev, next) async {
    if (prev is Connected && next is Disconnected) {
      await Future<void>.delayed(const Duration(seconds: 5));
      while (ref.read(radioConnectorServiceProvider) is Disconnected) {
        await ref.read(radioConnectorServiceProvider.notifier).connect(prev.radio);
        await Future<void>.delayed(const Duration(seconds: 15));
      }
    }
  });
}
