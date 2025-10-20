// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socket.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(socket)
const socketProvider = SocketProvider._();

final class SocketProvider
    extends $FunctionalProvider<SocketMockable, SocketMockable, SocketMockable>
    with $Provider<SocketMockable> {
  const SocketProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'socketProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$socketHash();

  @$internal
  @override
  $ProviderElement<SocketMockable> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SocketMockable create(Ref ref) {
    return socket(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SocketMockable value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SocketMockable>(value),
    );
  }
}

String _$socketHash() => r'89dd7fe7992657983e64d74ef7dfa785c7628854';
