// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telemetry_saver.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(telemetrySaver)
const telemetrySaverProvider = TelemetrySaverFamily._();

final class TelemetrySaverProvider extends $FunctionalProvider<
    Raw<Future<void>>,
    Raw<Future<void>>,
    Raw<Future<void>>> with $Provider<Raw<Future<void>>> {
  const TelemetrySaverProvider._(
      {required TelemetrySaverFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'telemetrySaverProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$telemetrySaverHash();

  @override
  String toString() {
    return r'telemetrySaverProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Raw<Future<void>>> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Raw<Future<void>> create(Ref ref) {
    final argument = this.argument as int;
    return telemetrySaver(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<Future<void>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<Future<void>>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TelemetrySaverProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$telemetrySaverHash() => r'd146385057215a3a2292909f2fe3b9100873a1cd';

final class TelemetrySaverFamily extends $Family
    with $FunctionalFamilyOverride<Raw<Future<void>>, int> {
  const TelemetrySaverFamily._()
      : super(
          retry: null,
          name: r'telemetrySaverProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  TelemetrySaverProvider call(
    int nodeNum,
  ) =>
      TelemetrySaverProvider._(argument: nodeNum, from: this);

  @override
  String toString() => r'telemetrySaverProvider';
}
