// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breadcrumb_logger.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(breadcrumbLogger)
const breadcrumbLoggerProvider = BreadcrumbLoggerProvider._();

final class BreadcrumbLoggerProvider extends $FunctionalProvider<
    BreadcrumbLogger,
    BreadcrumbLogger,
    BreadcrumbLogger> with $Provider<BreadcrumbLogger> {
  const BreadcrumbLoggerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'breadcrumbLoggerProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$breadcrumbLoggerHash();

  @$internal
  @override
  $ProviderElement<BreadcrumbLogger> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BreadcrumbLogger create(Ref ref) {
    return breadcrumbLogger(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BreadcrumbLogger value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BreadcrumbLogger>(value),
    );
  }
}

String _$breadcrumbLoggerHash() => r'87a8cd98c3746dbaa490c4662d2022bd4ac0637e';
