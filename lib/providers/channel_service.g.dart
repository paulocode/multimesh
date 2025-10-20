// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChannelService)
const channelServiceProvider = ChannelServiceProvider._();

final class ChannelServiceProvider
    extends $NotifierProvider<ChannelService, List<MeshChannel>> {
  const ChannelServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'channelServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$channelServiceHash();

  @$internal
  @override
  ChannelService create() => ChannelService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<MeshChannel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<MeshChannel>>(value),
    );
  }
}

String _$channelServiceHash() => r'ded70bafca9778b46ec78810085145200d71724d';

abstract class _$ChannelService extends $Notifier<List<MeshChannel>> {
  List<MeshChannel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<MeshChannel>, List<MeshChannel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<MeshChannel>, List<MeshChannel>>,
        List<MeshChannel>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
