// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ack_waiting_radio_writer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ackWaitingRadioWriter)
const ackWaitingRadioWriterProvider = AckWaitingRadioWriterProvider._();

final class AckWaitingRadioWriterProvider extends $FunctionalProvider<
    AckWaitingRadioWriter,
    AckWaitingRadioWriter,
    AckWaitingRadioWriter> with $Provider<AckWaitingRadioWriter> {
  const AckWaitingRadioWriterProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'ackWaitingRadioWriterProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$ackWaitingRadioWriterHash();

  @$internal
  @override
  $ProviderElement<AckWaitingRadioWriter> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AckWaitingRadioWriter create(Ref ref) {
    return ackWaitingRadioWriter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AckWaitingRadioWriter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AckWaitingRadioWriter>(value),
    );
  }
}

String _$ackWaitingRadioWriterHash() =>
    r'5b65d834f39b1a3eb3e4cb4475b1e45189304e94';
