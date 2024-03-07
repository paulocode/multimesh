class MeshRadioException implements Exception {
  const MeshRadioException(this.msg);

  final String msg;

  @override
  String toString() => 'MeshRadioException: $msg';
}
