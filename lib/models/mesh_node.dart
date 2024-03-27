class MeshNode {
  MeshNode({
    required this.nodeNum,
    required this.longName,
    this.hwModel,
    required this.shortName,
    required this.channel,
    required this.id,
    this.batteryLevel,
  });

  final int nodeNum;
  final String longName;
  final String shortName;
  final String? hwModel;
  final int channel;
  final String id;
  final int? batteryLevel;
}
