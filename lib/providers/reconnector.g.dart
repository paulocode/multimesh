// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reconnector.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReconnectorService)
const reconnectorServiceProvider = ReconnectorServiceFamily._();

final class ReconnectorServiceProvider
    extends $NotifierProvider<ReconnectorService, dynamic> {
  const ReconnectorServiceProvider._(
      {required ReconnectorServiceFamily super.from,
      required Duration super.argument})
      : super(
          retry: null,
          name: r'reconnectorServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$reconnectorServiceHash();

  @override
  String toString() {
    return r'reconnectorServiceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ReconnectorService create() => ReconnectorService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(dynamic value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<dynamic>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ReconnectorServiceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reconnectorServiceHash() =>
    r'b68aaf40e5414d130a6c4a004fd758e97d82d857';

final class ReconnectorServiceFamily extends $Family
    with
        $ClassFamilyOverride<ReconnectorService, dynamic, dynamic, dynamic,
            Duration> {
  const ReconnectorServiceFamily._()
      : super(
          retry: null,
          name: r'reconnectorServiceProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: false,
        );

  ReconnectorServiceProvider call({
    Duration delay = const Duration(seconds: 15),
  }) =>
      ReconnectorServiceProvider._(argument: delay, from: this);

  @override
  String toString() => r'reconnectorServiceProvider';
}

abstract class _$ReconnectorService extends $Notifier<dynamic> {
  late final _$args = ref.$arg as Duration;
  Duration get delay => _$args;

  dynamic build({
    Duration delay = const Duration(seconds: 15),
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      delay: _$args,
    );
    final ref = this.ref as $Ref<dynamic, dynamic>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<dynamic, dynamic>, dynamic, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
