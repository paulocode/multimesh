import 'dart:convert';
import 'dart:math';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:logger/logger.dart' as console;

class BreadcrumbLogger {
  BreadcrumbLogger() {
    final random = Random();
    _nonce = List.generate(32, (index) => random.nextInt(0xff));
  }

  late final List<int> _nonce;
  final _logger = console.Logger();
  final _toHashRegex = RegExp(r'#\{([^}]*)\}');
  final _crashlytics = FirebaseCrashlytics.instance;

  Future<void> i(String string) async {
    _logger.i(string);
    await _crashlytics.log(_replaceHashedString(string));
  }

  Future<void> w(String string) async {
    _logger.w(string);
    await _crashlytics.log(_replaceHashedString(string));
  }

  Future<void> e(Object e) async {
    _logger.e(e);
    await _crashlytics.log(e.toString());
  }

  int anonymizeInt(int value) {
    final digest = anonymizeBytes([
      (value & 0xFF000000) >> 24,
      (value & 0xFF0000) >> 16,
      (value & 0xFF00) >> 8,
      (value & 0xFF),
    ]);
    return digest[0] | digest[1] << 8 | digest[2] << 16 | digest[3] << 24;
  }

  List<int> anonymizeBytes(List<int> bytes) {
    final output = AccumulatorSink<Digest>();
    final input = sha256.startChunkedConversion(output);
    input.add(bytes);
    input.add(_nonce);
    input.close();
    final digest = output.events.single.bytes;
    return digest;
  }

  String anonymizeString(String value) {
    final digest = anonymizeBytes(utf8.encode(value));
    return hex.encode(digest);
  }

  String _replaceHashedString(String line) {
    final replacedLine = line.replaceAllMapped(_toHashRegex, (match) {
      final insideBraces = match.group(1)!;
      final hashedString = sha256.convert(utf8.encode(insideBraces)).toString();
      return hashedString;
    });
    return replacedLine;
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> setEnabled(bool telemetryEnabled) async {
    await _crashlytics.setCrashlyticsCollectionEnabled(telemetryEnabled);
  }

  bool isEnabled() => _crashlytics.isCrashlyticsCollectionEnabled;
}
