// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hops_away.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HopsAway)
const hopsAwayProvider = HopsAwayFamily._();

final class HopsAwayProvider extends $NotifierProvider<HopsAway, int?> {
  const HopsAwayProvider._(
      {required HopsAwayFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'hopsAwayProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$hopsAwayHash();

  @override
  String toString() {
    return r'hopsAwayProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  HopsAway create() => HopsAway();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is HopsAwayProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$hopsAwayHash() => r'359013b0ad14b82fcc6757712f356cc82f147bbf';

final class HopsAwayFamily extends $Family
    with $ClassFamilyOverride<HopsAway, int?, int?, int?, int> {
  const HopsAwayFamily._()
      : super(
          retry: null,
          name: r'hopsAwayProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: false,
        );

  HopsAwayProvider call(
    int nodeNum,
  ) =>
      HopsAwayProvider._(argument: nodeNum, from: this);

  @override
  String toString() => r'hopsAwayProvider';
}

abstract class _$HopsAway extends $Notifier<int?> {
  late final _$args = ref.$arg as int;
  int get nodeNum => _$args;

  int? build(
    int nodeNum,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<int?, int?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<int?, int?>, int?, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
