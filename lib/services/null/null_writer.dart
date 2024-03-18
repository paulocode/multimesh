import '../interfaces/radio_writer.dart';

class NullWriter implements RadioWriter {
  @override
  Future<void> write(List<int> value) async {}
}
