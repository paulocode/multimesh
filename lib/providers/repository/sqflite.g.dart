// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sqflite.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sqflite)
const sqfliteProvider = SqfliteProvider._();

final class SqfliteProvider extends $FunctionalProvider<AsyncValue<Database>,
        Database, FutureOr<Database>>
    with $FutureModifier<Database>, $FutureProvider<Database> {
  const SqfliteProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sqfliteProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sqfliteHash();

  @$internal
  @override
  $FutureProviderElement<Database> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Database> create(Ref ref) {
    return sqflite(ref);
  }
}

String _$sqfliteHash() => r'60fb2933fa1be75ccad7e55d2a8b9c5854e9ba35';
