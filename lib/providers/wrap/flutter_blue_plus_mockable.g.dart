// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flutter_blue_plus_mockable.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(flutterBluePlus)
const flutterBluePlusProvider = FlutterBluePlusProvider._();

final class FlutterBluePlusProvider extends $FunctionalProvider<
    FlutterBluePlusMockable,
    FlutterBluePlusMockable,
    FlutterBluePlusMockable> with $Provider<FlutterBluePlusMockable> {
  const FlutterBluePlusProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'flutterBluePlusProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$flutterBluePlusHash();

  @$internal
  @override
  $ProviderElement<FlutterBluePlusMockable> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FlutterBluePlusMockable create(Ref ref) {
    return flutterBluePlus(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlutterBluePlusMockable value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FlutterBluePlusMockable>(value),
    );
  }
}

String _$flutterBluePlusHash() => r'1226eabf0f75127e6a49ca2b2c15529146b1a1bd';
