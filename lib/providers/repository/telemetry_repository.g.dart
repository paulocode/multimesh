// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telemetry_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(telemetryRepository)
const telemetryRepositoryProvider = TelemetryRepositoryProvider._();

final class TelemetryRepositoryProvider extends $FunctionalProvider<
    TelemetryRepository,
    TelemetryRepository,
    TelemetryRepository> with $Provider<TelemetryRepository> {
  const TelemetryRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'telemetryRepositoryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$telemetryRepositoryHash();

  @$internal
  @override
  $ProviderElement<TelemetryRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TelemetryRepository create(Ref ref) {
    return telemetryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TelemetryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TelemetryRepository>(value),
    );
  }
}

String _$telemetryRepositoryHash() =>
    r'1247577e6b338829e0d6ed720446323794a5da2c';
