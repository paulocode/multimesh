import '../../protobufs/generated/meshtastic/mesh.pb.dart';

abstract class RadioReader {
  Stream<FromRadio> onPacketReceived();
  void forceRead();
}
