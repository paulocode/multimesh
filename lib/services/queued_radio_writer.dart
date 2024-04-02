import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:logger/logger.dart';

import '../protobufs/generated/meshtastic/mesh.pb.dart';
import '../protobufs/generated/meshtastic/portnums.pb.dart';
import 'interfaces/radio_reader.dart';
import 'interfaces/radio_writer.dart';

class QueuedRadioWriter {
  QueuedRadioWriter({
    Duration sendTimeout = const Duration(seconds: 30),
    required int Function() hopLimitProvider,
  })  : _sendTimeout = sendTimeout,
        _hopLimitProvider = hopLimitProvider {
    _currentPacketId = _random.nextInt(0xffffffff);
    _logger.i('created queue $hashCode');
  }

  RadioWriter? _radioWriter;
  StreamSubscription<FromRadio>? _packetSub;
  final _logger = Logger();
  final _random = Random();
  int _currentPacketId = 0;
  Completer<void>? _packetAckCompleter;
  final Duration _sendTimeout;
  final int Function() _hopLimitProvider;

  void setRadioWriter(RadioWriter radioWriter) {
    _logger.i('received radioWriter for queue $hashCode');
    _radioWriter = radioWriter;
  }

  void setRadioReader(RadioReader radioReader) {
    _logger.i('received radioReader for queue $hashCode');
    _packetSub?.cancel();
    _packetSub = radioReader.onPacketReceived().listen(_packetListener);
  }

  Future<void> sendMeshPacket({
    required int to,
    int channel = 0,
    bool wantAck = false,
    required PortNum portNum,
    required Uint8List payload,
    int? id,
  }) async {
    final _id = id ?? generatePacketId();
    final meshPacket = MeshPacket(
      to: to,
      hopLimit: _hopLimitProvider(),
      id: _id,
      wantAck: wantAck,
      priority: MeshPacket_Priority.RELIABLE,
      channel: channel,
      decoded: Data(
        portnum: portNum,
        payload: payload,
      ),
    );
    _logger.i('Sending MeshPacket...\n$meshPacket');
    _packetAckCompleter = Completer();
    await _radioWriter?.write(ToRadio(packet: meshPacket).writeToBuffer());
    await _packetAckCompleter?.future.timeout(_sendTimeout);
  }

  Future<void> sendWantConfig({required int wantConfigId}) async {
    final packet = ToRadio(wantConfigId: wantConfigId);
    _logger.i('Requesting config...\n$packet');
    await _radioWriter?.write(packet.writeToBuffer());
  }

  int generatePacketId() {
    const numPacketIds = (1 << 32) -
        1; // A mask for only the valid packet ID bits, either 255 or maxint

    _currentPacketId++;

    _currentPacketId =
        _currentPacketId & 0xffffffff; // keep from exceeding 32 bits

    // Use modulus and +1 to ensure we skip 0 on any values we return
    return (_currentPacketId % numPacketIds) + 1;
  }

  void _packetListener(FromRadio packet) {
    if (packet.whichPayloadVariant() == FromRadio_PayloadVariant.queueStatus) {
      final id = packet.queueStatus.meshPacketId;
      _logger.i('QueueStatus: $id');
      if (_packetAckCompleter?.isCompleted == false) {
        _packetAckCompleter?.complete();
      }
    }
  }

  void dispose() {
    _logger.i('disposing queue $hashCode');
    _packetSub?.cancel();
    if (_packetAckCompleter?.isCompleted == false) {
      _packetAckCompleter?.complete();
    }
  }
}
