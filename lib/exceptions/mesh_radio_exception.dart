class MeshRadioException implements Exception {
  const MeshRadioException({String? msg}) : msg = msg ?? 'Unknown error';

  final String msg;

  @override
  String toString() => 'MeshRadioException: $msg';
}
