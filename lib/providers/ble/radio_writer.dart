import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/radio_connector_state.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../../protobufs/generated/meshtastic/portnums.pb.dart';
import '../ble/radio_connector.dart';

part 'radio_writer.g.dart';

@Riverpod(keepAlive: true)
RadioWriter radioWriter(RadioWriterRef ref) {
  final connectorListener =
      ref.listen(radioConnectorProvider, (previous, next) {
    if (next is Connected) {
      ref.invalidateSelf();
    }
  });
  ref.onDispose(connectorListener.close);

  final radioConnectorState = ref.read(radioConnectorProvider);
  return RadioWriter(
    toRadio: radioConnectorState is Connected
        ? radioConnectorState.bleCharacteristics.toRadio
        : null,
  );
}

class RadioWriter {
  RadioWriter({
    this.toRadio,
  }) {
    _currentPacketId = _random.nextInt(0xffffffff);
  }

  final BluetoothCharacteristic? toRadio;
  final _logger = Logger();
  final _random = Random();
  int _currentPacketId = 0;

  Future<int> sendMeshPacket({
    required int to,
    int channel = 0,
    required PortNum portNum,
    required Uint8List payload,
  }) async {
    final id = _generatePacketId();
    final meshPacket = MeshPacket(
      to: to,
      hopLimit: 3,
      id: id,
      wantAck: true,
      priority: MeshPacket_Priority.RELIABLE,
      channel: channel,
      decoded: Data(
        portnum: portNum,
        payload: payload,
      ),
    );
    _logger.i('Sending MeshPacket...\n$meshPacket');
    await toRadio?.write(ToRadio(packet: meshPacket).writeToBuffer());
    return id;
  }

  Future<void> sendWantConfig({required int wantConfigId}) async {
    final packet = ToRadio(wantConfigId: wantConfigId);
    _logger.i('Requesting config...\n$packet');
    await toRadio?.write(packet.writeToBuffer());
  }

  int _generatePacketId() {
    const numPacketIds = (1 << 32) -
        1; // A mask for only the valid packet ID bits, either 255 or maxint

    _currentPacketId++;

    _currentPacketId =
        _currentPacketId & 0xffffffff; // keep from exceeding 32 bits

    // Use modulus and +1 to ensure we skip 0 on any values we return
    return (_currentPacketId % numPacketIds) + 1;
  }
}
