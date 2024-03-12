import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/radio_connector_state.dart';
import '../../protobufs/generated/meshtastic/mesh.pb.dart';
import '../../protobufs/generated/meshtastic/portnums.pb.dart';
import '../ble/radio_connector.dart';
import 'radio_reader.dart';

part 'radio_writer.g.dart';

@Riverpod(keepAlive: true)
RadioWriter radioWriter(RadioWriterRef ref) {
  final _logger = Logger();
  final radioWriter = RadioWriter();

  final connectorListener =
      ref.listen(radioConnectorProvider, (_, connectorState) {
    if (connectorState is! Connected) {
      return;
    }

    if (connectorState.isNewRadio) {
      _logger.i('New radio, clearing packet queue');
      radioWriter.clearPacketQueue();
    } else {
      _logger.i('Reconnected to same radio');
    }

    radioWriter.toRadio = connectorState.bleCharacteristics.toRadio;
  });

  final readerListener = ref.listen(radioReaderProvider, (_, next) {
    _logger.i('New reader');
    radioWriter.radioReader = next;
  });

  ref.onDispose(readerListener.close);
  ref.onDispose(connectorListener.close);

  return radioWriter;
}

class RadioWriter {
  RadioWriter() {
    _currentPacketId = _random.nextInt(0xffffffff);
  }

  BluetoothCharacteristic? _toRadio;
  StreamSubscription<FromRadio>? _packetSub;
  final _packetQueue = Queue<MeshPacket>();
  final _logger = Logger();
  final _random = Random();
  int _currentPacketId = 0;
  int _needAckPacketId = 0;
  var _packetAckCompleter = Completer<void>();

  set toRadio(BluetoothCharacteristic toRadio) {
    _toRadio = toRadio;
  }

  set radioReader(RadioReader radioReader) {
    _packetSub?.cancel();
    _packetSub = radioReader.onPacketReceived().listen(_packetListener);
  }

  int sendMeshPacket({
    required int to,
    int channel = 0,
    bool wantAck = false,
    required PortNum portNum,
    required Uint8List payload,
  }) {
    final id = _generatePacketId();
    final meshPacket = MeshPacket(
      to: to,
      hopLimit: 3,
      id: id,
      wantAck: wantAck,
      priority: MeshPacket_Priority.RELIABLE,
      channel: channel,
      decoded: Data(
        portnum: portNum,
        payload: payload,
      ),
    );
    _logger.i('Queueing MeshPacket...\n$meshPacket');
    if (_packetQueue.isEmpty) {
      _packetQueue.add(meshPacket);
      _startPacketQueue();
    } else {
      _packetQueue.add(meshPacket);
    }
    return id;
  }

  Future<void> sendWantConfig({required int wantConfigId}) async {
    final packet = ToRadio(wantConfigId: wantConfigId);
    _logger.i('Requesting config...\n$packet');
    await _toRadio?.write(packet.writeToBuffer());
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

  void _packetListener(FromRadio packet) {
    if (packet.whichPayloadVariant() == FromRadio_PayloadVariant.queueStatus) {
      _logger.i('QueueStatus: ${packet.queueStatus.meshPacketId}');
      if (!_packetAckCompleter.isCompleted &&
          _needAckPacketId == packet.queueStatus.meshPacketId) {
        _packetAckCompleter.complete();
      }
    }
  }

  Future<void> _startPacketQueue() async {
    _logger.i('Started packet queue');
    while (_packetQueue.isNotEmpty) {
      _packetAckCompleter = Completer();
      final packet = _packetQueue.first;
      try {
        _needAckPacketId = packet.id;
        await _toRadio?.write(ToRadio(packet: packet).writeToBuffer());
        await _packetAckCompleter.future.timeout(const Duration(seconds: 30));
        _packetQueue.removeFirst();
        _logger.i('${packet.id} acknowledged');
      } catch (e) {
        _logger.w('Packet queue ended with $e');
        _packetQueue.removeFirst();
      }
    }
    _logger.i('Packet queue empty');
  }

  void clearPacketQueue() {
    _packetQueue.clear();
  }
}
