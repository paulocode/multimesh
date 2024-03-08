// Mocks generated by Mockito 5.4.4 from annotations
// in meshx/test/providers/services/text_message_sender_service.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:typed_data' as _i8;

import 'package:meshx/models/radio_configuration.dart' as _i3;
import 'package:meshx/models/text_message.dart' as _i4;
import 'package:meshx/models/text_message_status.dart' as _i13;
import 'package:meshx/protobufs/generated/meshtastic/config.pb.dart' as _i10;
import 'package:meshx/protobufs/generated/meshtastic/mesh.pb.dart' as _i11;
import 'package:meshx/protobufs/generated/meshtastic/portnums.pb.dart' as _i7;
import 'package:meshx/providers/ble/radio_writer.dart' as _i5;
import 'package:meshx/providers/repository/text_message_repository.dart'
    as _i12;
import 'package:meshx/providers/services/radio_config_service.dart' as _i9;
import 'package:meshx/providers/services/text_message_stream_service.dart'
    as _i14;
import 'package:mockito/mockito.dart' as _i1;
import 'package:riverpod_annotation/riverpod_annotation.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeNotifierProviderRef_0<T> extends _i1.SmartFake
    implements _i2.NotifierProviderRef<T> {
  _FakeNotifierProviderRef_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRadioConfiguration_1 extends _i1.SmartFake
    implements _i3.RadioConfiguration {
  _FakeRadioConfiguration_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTextMessage_2 extends _i1.SmartFake implements _i4.TextMessage {
  _FakeTextMessage_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RadioWriter].
///
/// See the documentation for Mockito's code generation for more information.
class MockRadioWriter extends _i1.Mock implements _i5.RadioWriter {
  MockRadioWriter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<int> sendMeshPacket({
    required int? to,
    int? channel = 0,
    required _i7.PortNum? portNum,
    required _i8.Uint8List? payload,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendMeshPacket,
          [],
          {
            #to: to,
            #channel: channel,
            #portNum: portNum,
            #payload: payload,
          },
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);

  @override
  _i6.Future<void> sendWantConfig({required int? wantConfigId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendWantConfig,
          [],
          {#wantConfigId: wantConfigId},
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}

/// A class which mocks [RadioConfigService].
///
/// See the documentation for Mockito's code generation for more information.
class MockRadioConfigService extends _i1.Mock
    implements _i9.RadioConfigService {
  MockRadioConfigService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.NotifierProviderRef<_i3.RadioConfiguration> get ref =>
      (super.noSuchMethod(
        Invocation.getter(#ref),
        returnValue: _FakeNotifierProviderRef_0<_i3.RadioConfiguration>(
          this,
          Invocation.getter(#ref),
        ),
      ) as _i2.NotifierProviderRef<_i3.RadioConfiguration>);

  @override
  _i3.RadioConfiguration get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeRadioConfiguration_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.RadioConfiguration);

  @override
  set state(_i3.RadioConfiguration? value) => super.noSuchMethod(
        Invocation.setter(
          #state,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.RadioConfiguration build() => (super.noSuchMethod(
        Invocation.method(
          #build,
          [],
        ),
        returnValue: _FakeRadioConfiguration_1(
          this,
          Invocation.method(
            #build,
            [],
          ),
        ),
      ) as _i3.RadioConfiguration);

  @override
  _i6.Future<void> setRegion(
    _i10.Config_LoRaConfig_RegionCode? region, {
    bool? upload = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #setRegion,
          [region],
          {#upload: upload},
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> setMyNodeNum(
    int? myNodeNum, {
    bool? upload = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #setMyNodeNum,
          [myNodeNum],
          {#upload: upload},
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> setShortName(
    String? shortName, {
    bool? upload = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #setShortName,
          [shortName],
          {#upload: upload},
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> setLongName(
    String? longName, {
    bool? upload = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #setLongName,
          [longName],
          {#upload: upload},
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> setHwModel(
    _i11.HardwareModel? hwModel, {
    bool? upload = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #setHwModel,
          [hwModel],
          {#upload: upload},
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  void setConfigDownloaded() => super.noSuchMethod(
        Invocation.method(
          #setConfigDownloaded,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void clear() => super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool updateShouldNotify(
    _i3.RadioConfiguration? previous,
    _i3.RadioConfiguration? next,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateShouldNotify,
          [
            previous,
            next,
          ],
        ),
        returnValue: false,
      ) as bool);
}

/// A class which mocks [TextMessageRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTextMessageRepository extends _i1.Mock
    implements _i12.TextMessageRepository {
  MockTextMessageRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<List<_i4.TextMessage>>> getByNodeNum() => (super.noSuchMethod(
        Invocation.method(
          #getByNodeNum,
          [],
        ),
        returnValue: _i6.Future<List<List<_i4.TextMessage>>>.value(
            <List<_i4.TextMessage>>[]),
      ) as _i6.Future<List<List<_i4.TextMessage>>>);

  @override
  _i6.Future<int> add({required _i4.TextMessage? textMessage}) =>
      (super.noSuchMethod(
        Invocation.method(
          #add,
          [],
          {#textMessage: textMessage},
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);

  @override
  _i6.Future<void> updateStatusByPacketId({
    required _i13.TextMessageStatus? status,
    required int? packetId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateStatusByPacketId,
          [],
          {
            #status: status,
            #packetId: packetId,
          },
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<_i4.TextMessage> getByPacketId({required int? packetId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getByPacketId,
          [],
          {#packetId: packetId},
        ),
        returnValue: _i6.Future<_i4.TextMessage>.value(_FakeTextMessage_2(
          this,
          Invocation.method(
            #getByPacketId,
            [],
            {#packetId: packetId},
          ),
        )),
      ) as _i6.Future<_i4.TextMessage>);

  @override
  _i6.Future<List<_i4.TextMessage>> getBy({
    required int? nodeNum,
    required int? channel,
    required int? limit,
    int? offset = 0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getBy,
          [],
          {
            #nodeNum: nodeNum,
            #channel: channel,
            #limit: limit,
            #offset: offset,
          },
        ),
        returnValue:
            _i6.Future<List<_i4.TextMessage>>.value(<_i4.TextMessage>[]),
      ) as _i6.Future<List<_i4.TextMessage>>);

  @override
  _i6.Future<int> count({
    required int? channel,
    required int? nodeNum,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #count,
          [],
          {
            #channel: channel,
            #nodeNum: nodeNum,
          },
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);
}

/// A class which mocks [TextMessageStreamService].
///
/// See the documentation for Mockito's code generation for more information.
class MockTextMessageStreamService extends _i1.Mock
    implements _i14.TextMessageStreamService {
  MockTextMessageStreamService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Stream<List<_i4.TextMessage>> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i6.Stream<List<_i4.TextMessage>>.empty(),
      ) as _i6.Stream<List<_i4.TextMessage>>);

  @override
  _i6.Future<bool> get allMessagesLoaded => (super.noSuchMethod(
        Invocation.getter(#allMessagesLoaded),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);

  @override
  _i6.Future<void> loadOlderMessages() => (super.noSuchMethod(
        Invocation.method(
          #loadOlderMessages,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> onNewMessage(_i4.TextMessage? textMessage) =>
      (super.noSuchMethod(
        Invocation.method(
          #onNewMessage,
          [textMessage],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  List<_i4.TextMessage> getMessages() => (super.noSuchMethod(
        Invocation.method(
          #getMessages,
          [],
        ),
        returnValue: <_i4.TextMessage>[],
      ) as List<_i4.TextMessage>);

  @override
  void disposeOldMessages() => super.noSuchMethod(
        Invocation.method(
          #disposeOldMessages,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
