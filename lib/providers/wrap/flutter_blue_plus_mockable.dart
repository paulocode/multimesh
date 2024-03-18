import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/wrap/flutter_blue_plus_mockable.dart';

part 'flutter_blue_plus_mockable.g.dart';

@Riverpod(keepAlive: true)
FlutterBluePlusMockable flutterBluePlus(FlutterBluePlusRef ref) {
  return FlutterBluePlusMockable();
}
