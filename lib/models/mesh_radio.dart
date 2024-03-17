import 'package:flutter_blue_plus/flutter_blue_plus.dart';

sealed class MeshRadio {
  String get name;
  String get remoteId;
}

class BleMeshRadio extends MeshRadio {
  BleMeshRadio({required this.device}) : super();

  final BluetoothDevice device;

  @override
  String get name => device.advName;

  @override
  String get remoteId => device.remoteId.str;
}

class TcpMeshRadio extends MeshRadio {
  TcpMeshRadio({required this.address}) : super();

  final String address;

  @override
  String get name => address;

  @override
  String get remoteId => address;
}
