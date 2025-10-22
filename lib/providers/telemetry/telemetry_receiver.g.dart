// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telemetry_receiver.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(telemetryReceiver)
const telemetryReceiverProvider = TelemetryReceiverProvider._();

final class TelemetryReceiverProvider extends $FunctionalProvider<
    TelemetryReceiver,
    TelemetryReceiver,
    TelemetryReceiver> with $Provider<TelemetryReceiver> {
  const TelemetryReceiverProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'telemetryReceiverProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$telemetryReceiverHash();

  @$internal
  @override
  $ProviderElement<TelemetryReceiver> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TelemetryReceiver create(Ref ref) {
    return telemetryReceiver(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TelemetryReceiver value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TelemetryReceiver>(value),
    );
  }
}

String _$telemetryReceiverHash() => r'b0676085a3c318a2d361c54d7c2dcbe6a223bee5';
