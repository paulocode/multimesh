import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class MeshRadio {
  const MeshRadio({required this.device});

  final BluetoothDevice device;

  String get name => device.advName;

  String get remoteId => device.remoteId.str;
}
