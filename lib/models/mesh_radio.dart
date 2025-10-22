import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

sealed class MeshRadio {
  String get name;
  String get remoteId;
}

class BleMeshRadio extends MeshRadio {
  BleMeshRadio({required this.device}) : super();

  final DiscoveredDevice device;

  @override
  String get name => device.name;

  @override
  String get remoteId => device.id;
}

class TcpMeshRadio extends MeshRadio {
  TcpMeshRadio({required this.address}) : super();

  final String address;

  @override
  String get name => address;

  @override
  String get remoteId => address;
}
