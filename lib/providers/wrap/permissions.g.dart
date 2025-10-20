// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permissions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(permissions)
const permissionsProvider = PermissionsProvider._();

final class PermissionsProvider
    extends $FunctionalProvider<Permissions, Permissions, Permissions>
    with $Provider<Permissions> {
  const PermissionsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'permissionsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$permissionsHash();

  @$internal
  @override
  $ProviderElement<Permissions> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Permissions create(Ref ref) {
    return permissions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Permissions value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Permissions>(value),
    );
  }
}

String _$permissionsHash() => r'5f3f178de6159d8a7a8398d1ac3cfa20ca128d6c';
