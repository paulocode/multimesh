import '../../protobufs/generated/meshtastic/mesh.pb.dart';

abstract class RadioReader {
  Stream<FromRadio> onPacketReceived();
}

abstract class ForceReadableRadioReader extends RadioReader {
  void forceRead();
}
