import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:logger/logger.dart';

import '../protobufs/generated/meshtastic/mesh.pb.dart';
import '../protobufs/generated/meshtastic/portnums.pb.dart';
import 'interfaces/radio_reader.dart';
import 'interfaces/radio_writer.dart';

class AckWaitingRadioWriter {
  AckWaitingRadioWriter({
    Duration sendTimeout = const Duration(seconds: 30),
    required int Function() hopLimitProvider,
    required RadioReader radioReader,
    required RadioWriter radioWriter,
  })  : _sendTimeout = sendTimeout,
        _hopLimitProvider = hopLimitProvider,
        _radioWriter = radioWriter,
        _radioReader = radioReader {
    _currentPacketId = _random.nextInt(0xffffffff);
  }

  final RadioWriter _radioWriter;
  final RadioReader _radioReader;
  final _logger = Logger();
  final _random = Random();
  int _currentPacketId = 0;
  final Duration _sendTimeout;
  final int Function() _hopLimitProvider;

  Future<void> sendMeshPacket({
    required int to,
    int channel = 0,
    bool wantAck = false,
    required PortNum portNum,
    MeshPacket_Priority? priority = MeshPacket_Priority.RELIABLE,
    bool? wantResponse,
    Uint8List? payload,
    int? id,
  }) async {
    final _id = id ?? generatePacketId();
    final meshPacket = MeshPacket(
      to: to,
      hopLimit: _hopLimitProvider(),
      id: _id,
      wantAck: wantAck,
      priority: priority,
      channel: channel,
      decoded: Data(
        portnum: portNum,
        payload: payload,
        wantResponse: wantResponse,
      ),
    );
    final toRadio = ToRadio(packet: meshPacket);
    _logger.i('Sending MeshPacket...\n$toRadio');
    await _radioWriter.write(toRadio.writeToBuffer());
    await waitForAck(_id);
  }

  Future<void> sendWantConfig({required int wantConfigId}) async {
    final packet = ToRadio(wantConfigId: wantConfigId);
    _logger.i('Requesting config...\n$packet');
    await _radioWriter.write(packet.writeToBuffer());
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

  Future<void> waitForAck(int packetId) async {
    final packetAckCompleter = Completer<void>();
    final sub = _radioReader.onPacketReceived().listen((packet) {
      if (packet.whichPayloadVariant() ==
          FromRadio_PayloadVariant.queueStatus) {
        final id = packet.queueStatus.meshPacketId;
        _logger.i('QueueStatus: $id');
        if (!packetAckCompleter.isCompleted) {
          packetAckCompleter.complete();
        }
      }
    });
    try {
      await packetAckCompleter.future.timeout(_sendTimeout);
    } catch (e) {
      rethrow;
    } finally {
      if (!packetAckCompleter.isCompleted) {
        packetAckCompleter.complete();
      }
      await sub.cancel();
    }
  }
}
