// Mocks generated by Mockito 5.4.4 from annotations
// in meshx/test/providers/radio_writer_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:convert' as _i4;
import 'dart:io' as _i3;
import 'dart:typed_data' as _i8;

import 'package:flutter_blue_plus/flutter_blue_plus.dart' as _i2;
import 'package:multimesh/models/ble_characteristics.dart' as _i6;
import 'package:multimesh/models/mesh_radio.dart' as _i7;
import 'package:multimesh/models/radio_connector_state.dart' as _i10;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i9;

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

class _FakeDeviceIdentifier_0 extends _i1.SmartFake
    implements _i2.DeviceIdentifier {
  _FakeDeviceIdentifier_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGuid_1 extends _i1.SmartFake implements _i2.Guid {
  _FakeGuid_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBluetoothDevice_2 extends _i1.SmartFake
    implements _i2.BluetoothDevice {
  _FakeBluetoothDevice_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCharacteristicProperties_3 extends _i1.SmartFake
    implements _i2.CharacteristicProperties {
  _FakeCharacteristicProperties_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeInternetAddress_4 extends _i1.SmartFake
    implements _i3.InternetAddress {
  _FakeInternetAddress_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEncoding_5 extends _i1.SmartFake implements _i4.Encoding {
  _FakeEncoding_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamSubscription_6<T> extends _i1.SmartFake
    implements _i5.StreamSubscription<T> {
  _FakeStreamSubscription_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFuture_7<T> extends _i1.SmartFake implements _i5.Future<T> {
  _FakeFuture_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBleCharacteristics_8 extends _i1.SmartFake
    implements _i6.BleCharacteristics {
  _FakeBleCharacteristics_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBleMeshRadio_9 extends _i1.SmartFake implements _i7.BleMeshRadio {
  _FakeBleMeshRadio_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBluetoothCharacteristic_10 extends _i1.SmartFake
    implements _i2.BluetoothCharacteristic {
  _FakeBluetoothCharacteristic_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [BluetoothCharacteristic].
///
/// See the documentation for Mockito's code generation for more information.
class MockBluetoothCharacteristic extends _i1.Mock
    implements _i2.BluetoothCharacteristic {
  MockBluetoothCharacteristic() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.DeviceIdentifier get remoteId => (super.noSuchMethod(
        Invocation.getter(#remoteId),
        returnValue: _FakeDeviceIdentifier_0(
          this,
          Invocation.getter(#remoteId),
        ),
      ) as _i2.DeviceIdentifier);

  @override
  _i2.Guid get serviceUuid => (super.noSuchMethod(
        Invocation.getter(#serviceUuid),
        returnValue: _FakeGuid_1(
          this,
          Invocation.getter(#serviceUuid),
        ),
      ) as _i2.Guid);

  @override
  _i2.Guid get characteristicUuid => (super.noSuchMethod(
        Invocation.getter(#characteristicUuid),
        returnValue: _FakeGuid_1(
          this,
          Invocation.getter(#characteristicUuid),
        ),
      ) as _i2.Guid);

  @override
  _i2.Guid get uuid => (super.noSuchMethod(
        Invocation.getter(#uuid),
        returnValue: _FakeGuid_1(
          this,
          Invocation.getter(#uuid),
        ),
      ) as _i2.Guid);

  @override
  _i2.BluetoothDevice get device => (super.noSuchMethod(
        Invocation.getter(#device),
        returnValue: _FakeBluetoothDevice_2(
          this,
          Invocation.getter(#device),
        ),
      ) as _i2.BluetoothDevice);

  @override
  _i2.CharacteristicProperties get properties => (super.noSuchMethod(
        Invocation.getter(#properties),
        returnValue: _FakeCharacteristicProperties_3(
          this,
          Invocation.getter(#properties),
        ),
      ) as _i2.CharacteristicProperties);

  @override
  List<_i2.BluetoothDescriptor> get descriptors => (super.noSuchMethod(
        Invocation.getter(#descriptors),
        returnValue: <_i2.BluetoothDescriptor>[],
      ) as List<_i2.BluetoothDescriptor>);

  @override
  List<int> get lastValue => (super.noSuchMethod(
        Invocation.getter(#lastValue),
        returnValue: <int>[],
      ) as List<int>);

  @override
  _i5.Stream<List<int>> get lastValueStream => (super.noSuchMethod(
        Invocation.getter(#lastValueStream),
        returnValue: _i5.Stream<List<int>>.empty(),
      ) as _i5.Stream<List<int>>);

  @override
  _i5.Stream<List<int>> get onValueReceived => (super.noSuchMethod(
        Invocation.getter(#onValueReceived),
        returnValue: _i5.Stream<List<int>>.empty(),
      ) as _i5.Stream<List<int>>);

  @override
  bool get isNotifying => (super.noSuchMethod(
        Invocation.getter(#isNotifying),
        returnValue: false,
      ) as bool);

  @override
  _i2.DeviceIdentifier get deviceId => (super.noSuchMethod(
        Invocation.getter(#deviceId),
        returnValue: _FakeDeviceIdentifier_0(
          this,
          Invocation.getter(#deviceId),
        ),
      ) as _i2.DeviceIdentifier);

  @override
  _i5.Stream<List<int>> get value => (super.noSuchMethod(
        Invocation.getter(#value),
        returnValue: _i5.Stream<List<int>>.empty(),
      ) as _i5.Stream<List<int>>);

  @override
  _i5.Stream<List<int>> get onValueChangedStream => (super.noSuchMethod(
        Invocation.getter(#onValueChangedStream),
        returnValue: _i5.Stream<List<int>>.empty(),
      ) as _i5.Stream<List<int>>);

  @override
  _i5.Future<List<int>> read({int? timeout = 15}) => (super.noSuchMethod(
        Invocation.method(
          #read,
          [],
          {#timeout: timeout},
        ),
        returnValue: _i5.Future<List<int>>.value(<int>[]),
      ) as _i5.Future<List<int>>);

  @override
  _i5.Future<void> write(
    List<int>? value, {
    bool? withoutResponse = false,
    bool? allowLongWrite = false,
    int? timeout = 15,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #write,
          [value],
          {
            #withoutResponse: withoutResponse,
            #allowLongWrite: allowLongWrite,
            #timeout: timeout,
          },
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<bool> setNotifyValue(
    bool? notify, {
    int? timeout = 15,
    bool? forceIndications = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #setNotifyValue,
          [notify],
          {
            #timeout: timeout,
            #forceIndications: forceIndications,
          },
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}

/// A class which mocks [Socket].
///
/// See the documentation for Mockito's code generation for more information.
class MockSocket extends _i1.Mock implements _i3.Socket {
  MockSocket() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get port => (super.noSuchMethod(
        Invocation.getter(#port),
        returnValue: 0,
      ) as int);

  @override
  int get remotePort => (super.noSuchMethod(
        Invocation.getter(#remotePort),
        returnValue: 0,
      ) as int);

  @override
  _i3.InternetAddress get address => (super.noSuchMethod(
        Invocation.getter(#address),
        returnValue: _FakeInternetAddress_4(
          this,
          Invocation.getter(#address),
        ),
      ) as _i3.InternetAddress);

  @override
  _i3.InternetAddress get remoteAddress => (super.noSuchMethod(
        Invocation.getter(#remoteAddress),
        returnValue: _FakeInternetAddress_4(
          this,
          Invocation.getter(#remoteAddress),
        ),
      ) as _i3.InternetAddress);

  @override
  _i5.Future<dynamic> get done => (super.noSuchMethod(
        Invocation.getter(#done),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);

  @override
  bool get isBroadcast => (super.noSuchMethod(
        Invocation.getter(#isBroadcast),
        returnValue: false,
      ) as bool);

  @override
  _i5.Future<int> get length => (super.noSuchMethod(
        Invocation.getter(#length),
        returnValue: _i5.Future<int>.value(0),
      ) as _i5.Future<int>);

  @override
  _i5.Future<bool> get isEmpty => (super.noSuchMethod(
        Invocation.getter(#isEmpty),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<_i8.Uint8List> get first => (super.noSuchMethod(
        Invocation.getter(#first),
        returnValue: _i5.Future<_i8.Uint8List>.value(_i8.Uint8List(0)),
      ) as _i5.Future<_i8.Uint8List>);

  @override
  _i5.Future<_i8.Uint8List> get last => (super.noSuchMethod(
        Invocation.getter(#last),
        returnValue: _i5.Future<_i8.Uint8List>.value(_i8.Uint8List(0)),
      ) as _i5.Future<_i8.Uint8List>);

  @override
  _i5.Future<_i8.Uint8List> get single => (super.noSuchMethod(
        Invocation.getter(#single),
        returnValue: _i5.Future<_i8.Uint8List>.value(_i8.Uint8List(0)),
      ) as _i5.Future<_i8.Uint8List>);

  @override
  _i4.Encoding get encoding => (super.noSuchMethod(
        Invocation.getter(#encoding),
        returnValue: _FakeEncoding_5(
          this,
          Invocation.getter(#encoding),
        ),
      ) as _i4.Encoding);

  @override
  set encoding(_i4.Encoding? _encoding) => super.noSuchMethod(
        Invocation.setter(
          #encoding,
          _encoding,
        ),
        returnValueForMissingStub: null,
      );

  @override
  void destroy() => super.noSuchMethod(
        Invocation.method(
          #destroy,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool setOption(
    _i3.SocketOption? option,
    bool? enabled,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setOption,
          [
            option,
            enabled,
          ],
        ),
        returnValue: false,
      ) as bool);

  @override
  _i8.Uint8List getRawOption(_i3.RawSocketOption? option) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRawOption,
          [option],
        ),
        returnValue: _i8.Uint8List(0),
      ) as _i8.Uint8List);

  @override
  void setRawOption(_i3.RawSocketOption? option) => super.noSuchMethod(
        Invocation.method(
          #setRawOption,
          [option],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<dynamic> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);

  @override
  _i5.Stream<_i8.Uint8List> asBroadcastStream({
    void Function(_i5.StreamSubscription<_i8.Uint8List>)? onListen,
    void Function(_i5.StreamSubscription<_i8.Uint8List>)? onCancel,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #asBroadcastStream,
          [],
          {
            #onListen: onListen,
            #onCancel: onCancel,
          },
        ),
        returnValue: _i5.Stream<_i8.Uint8List>.empty(),
      ) as _i5.Stream<_i8.Uint8List>);

  @override
  _i5.StreamSubscription<_i8.Uint8List> listen(
    void Function(_i8.Uint8List)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #listen,
          [onData],
          {
            #onError: onError,
            #onDone: onDone,
            #cancelOnError: cancelOnError,
          },
        ),
        returnValue: _FakeStreamSubscription_6<_i8.Uint8List>(
          this,
          Invocation.method(
            #listen,
            [onData],
            {
              #onError: onError,
              #onDone: onDone,
              #cancelOnError: cancelOnError,
            },
          ),
        ),
      ) as _i5.StreamSubscription<_i8.Uint8List>);

  @override
  _i5.Stream<_i8.Uint8List> where(bool Function(_i8.Uint8List)? test) =>
      (super.noSuchMethod(
        Invocation.method(
          #where,
          [test],
        ),
        returnValue: _i5.Stream<_i8.Uint8List>.empty(),
      ) as _i5.Stream<_i8.Uint8List>);

  @override
  _i5.Stream<S> map<S>(S Function(_i8.Uint8List)? convert) =>
      (super.noSuchMethod(
        Invocation.method(
          #map,
          [convert],
        ),
        returnValue: _i5.Stream<S>.empty(),
      ) as _i5.Stream<S>);

  @override
  _i5.Stream<E> asyncMap<E>(_i5.FutureOr<E> Function(_i8.Uint8List)? convert) =>
      (super.noSuchMethod(
        Invocation.method(
          #asyncMap,
          [convert],
        ),
        returnValue: _i5.Stream<E>.empty(),
      ) as _i5.Stream<E>);

  @override
  _i5.Stream<E> asyncExpand<E>(
          _i5.Stream<E>? Function(_i8.Uint8List)? convert) =>
      (super.noSuchMethod(
        Invocation.method(
          #asyncExpand,
          [convert],
        ),
        returnValue: _i5.Stream<E>.empty(),
      ) as _i5.Stream<E>);

  @override
  _i5.Stream<_i8.Uint8List> handleError(
    Function? onError, {
    bool Function(dynamic)? test,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #handleError,
          [onError],
          {#test: test},
        ),
        returnValue: _i5.Stream<_i8.Uint8List>.empty(),
      ) as _i5.Stream<_i8.Uint8List>);

  @override
  _i5.Stream<S> expand<S>(Iterable<S> Function(_i8.Uint8List)? convert) =>
      (super.noSuchMethod(
        Invocation.method(
          #expand,
          [convert],
        ),
        returnValue: _i5.Stream<S>.empty(),
      ) as _i5.Stream<S>);

  @override
  _i5.Future<dynamic> pipe(_i5.StreamConsumer<_i8.Uint8List>? streamConsumer) =>
      (super.noSuchMethod(
        Invocation.method(
          #pipe,
          [streamConsumer],
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);

  @override
  _i5.Stream<S> transform<S>(
          _i5.StreamTransformer<_i8.Uint8List, S>? streamTransformer) =>
      (super.noSuchMethod(
        Invocation.method(
          #transform,
          [streamTransformer],
        ),
        returnValue: _i5.Stream<S>.empty(),
      ) as _i5.Stream<S>);

  @override
  _i5.Future<_i8.Uint8List> reduce(
          _i8.Uint8List Function(
            _i8.Uint8List,
            _i8.Uint8List,
          )? combine) =>
      (super.noSuchMethod(
        Invocation.method(
          #reduce,
          [combine],
        ),
        returnValue: _i5.Future<_i8.Uint8List>.value(_i8.Uint8List(0)),
      ) as _i5.Future<_i8.Uint8List>);

  @override
  _i5.Future<S> fold<S>(
    S? initialValue,
    S Function(
      S,
      _i8.Uint8List,
    )? combine,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #fold,
          [
            initialValue,
            combine,
          ],
        ),
        returnValue: _i9.ifNotNull(
              _i9.dummyValueOrNull<S>(
                this,
                Invocation.method(
                  #fold,
                  [
                    initialValue,
                    combine,
                  ],
                ),
              ),
              (S v) => _i5.Future<S>.value(v),
            ) ??
            _FakeFuture_7<S>(
              this,
              Invocation.method(
                #fold,
                [
                  initialValue,
                  combine,
                ],
              ),
            ),
      ) as _i5.Future<S>);

  @override
  _i5.Future<String> join([String? separator = r'']) => (super.noSuchMethod(
        Invocation.method(
          #join,
          [separator],
        ),
        returnValue: _i5.Future<String>.value(_i9.dummyValue<String>(
          this,
          Invocation.method(
            #join,
            [separator],
          ),
        )),
      ) as _i5.Future<String>);

  @override
  _i5.Future<bool> contains(Object? needle) => (super.noSuchMethod(
        Invocation.method(
          #contains,
          [needle],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<void> forEach(void Function(_i8.Uint8List)? action) =>
      (super.noSuchMethod(
        Invocation.method(
          #forEach,
          [action],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<bool> every(bool Function(_i8.Uint8List)? test) =>
      (super.noSuchMethod(
        Invocation.method(
          #every,
          [test],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool> any(bool Function(_i8.Uint8List)? test) =>
      (super.noSuchMethod(
        Invocation.method(
          #any,
          [test],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Stream<R> cast<R>() => (super.noSuchMethod(
        Invocation.method(
          #cast,
          [],
        ),
        returnValue: _i5.Stream<R>.empty(),
      ) as _i5.Stream<R>);

  @override
  _i5.Future<List<_i8.Uint8List>> toList() => (super.noSuchMethod(
        Invocation.method(
          #toList,
          [],
        ),
        returnValue: _i5.Future<List<_i8.Uint8List>>.value(<_i8.Uint8List>[]),
      ) as _i5.Future<List<_i8.Uint8List>>);

  @override
  _i5.Future<Set<_i8.Uint8List>> toSet() => (super.noSuchMethod(
        Invocation.method(
          #toSet,
          [],
        ),
        returnValue: _i5.Future<Set<_i8.Uint8List>>.value(<_i8.Uint8List>{}),
      ) as _i5.Future<Set<_i8.Uint8List>>);

  @override
  _i5.Future<E> drain<E>([E? futureValue]) => (super.noSuchMethod(
        Invocation.method(
          #drain,
          [futureValue],
        ),
        returnValue: _i9.ifNotNull(
              _i9.dummyValueOrNull<E>(
                this,
                Invocation.method(
                  #drain,
                  [futureValue],
                ),
              ),
              (E v) => _i5.Future<E>.value(v),
            ) ??
            _FakeFuture_7<E>(
              this,
              Invocation.method(
                #drain,
                [futureValue],
              ),
            ),
      ) as _i5.Future<E>);

  @override
  _i5.Stream<_i8.Uint8List> take(int? count) => (super.noSuchMethod(
        Invocation.method(
          #take,
          [count],
        ),
        returnValue: _i5.Stream<_i8.Uint8List>.empty(),
      ) as _i5.Stream<_i8.Uint8List>);

  @override
  _i5.Stream<_i8.Uint8List> takeWhile(bool Function(_i8.Uint8List)? test) =>
      (super.noSuchMethod(
        Invocation.method(
          #takeWhile,
          [test],
        ),
        returnValue: _i5.Stream<_i8.Uint8List>.empty(),
      ) as _i5.Stream<_i8.Uint8List>);

  @override
  _i5.Stream<_i8.Uint8List> skip(int? count) => (super.noSuchMethod(
        Invocation.method(
          #skip,
          [count],
        ),
        returnValue: _i5.Stream<_i8.Uint8List>.empty(),
      ) as _i5.Stream<_i8.Uint8List>);

  @override
  _i5.Stream<_i8.Uint8List> skipWhile(bool Function(_i8.Uint8List)? test) =>
      (super.noSuchMethod(
        Invocation.method(
          #skipWhile,
          [test],
        ),
        returnValue: _i5.Stream<_i8.Uint8List>.empty(),
      ) as _i5.Stream<_i8.Uint8List>);

  @override
  _i5.Stream<_i8.Uint8List> distinct(
          [bool Function(
            _i8.Uint8List,
            _i8.Uint8List,
          )? equals]) =>
      (super.noSuchMethod(
        Invocation.method(
          #distinct,
          [equals],
        ),
        returnValue: _i5.Stream<_i8.Uint8List>.empty(),
      ) as _i5.Stream<_i8.Uint8List>);

  @override
  _i5.Future<_i8.Uint8List> firstWhere(
    bool Function(_i8.Uint8List)? test, {
    _i8.Uint8List Function()? orElse,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #firstWhere,
          [test],
          {#orElse: orElse},
        ),
        returnValue: _i5.Future<_i8.Uint8List>.value(_i8.Uint8List(0)),
      ) as _i5.Future<_i8.Uint8List>);

  @override
  _i5.Future<_i8.Uint8List> lastWhere(
    bool Function(_i8.Uint8List)? test, {
    _i8.Uint8List Function()? orElse,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #lastWhere,
          [test],
          {#orElse: orElse},
        ),
        returnValue: _i5.Future<_i8.Uint8List>.value(_i8.Uint8List(0)),
      ) as _i5.Future<_i8.Uint8List>);

  @override
  _i5.Future<_i8.Uint8List> singleWhere(
    bool Function(_i8.Uint8List)? test, {
    _i8.Uint8List Function()? orElse,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #singleWhere,
          [test],
          {#orElse: orElse},
        ),
        returnValue: _i5.Future<_i8.Uint8List>.value(_i8.Uint8List(0)),
      ) as _i5.Future<_i8.Uint8List>);

  @override
  _i5.Future<_i8.Uint8List> elementAt(int? index) => (super.noSuchMethod(
        Invocation.method(
          #elementAt,
          [index],
        ),
        returnValue: _i5.Future<_i8.Uint8List>.value(_i8.Uint8List(0)),
      ) as _i5.Future<_i8.Uint8List>);

  @override
  _i5.Stream<_i8.Uint8List> timeout(
    Duration? timeLimit, {
    void Function(_i5.EventSink<_i8.Uint8List>)? onTimeout,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #timeout,
          [timeLimit],
          {#onTimeout: onTimeout},
        ),
        returnValue: _i5.Stream<_i8.Uint8List>.empty(),
      ) as _i5.Stream<_i8.Uint8List>);

  @override
  void add(List<int>? data) => super.noSuchMethod(
        Invocation.method(
          #add,
          [data],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void write(Object? object) => super.noSuchMethod(
        Invocation.method(
          #write,
          [object],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void writeAll(
    Iterable<dynamic>? objects, [
    String? separator = r'',
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #writeAll,
          [
            objects,
            separator,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void writeln([Object? object = r'']) => super.noSuchMethod(
        Invocation.method(
          #writeln,
          [object],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void writeCharCode(int? charCode) => super.noSuchMethod(
        Invocation.method(
          #writeCharCode,
          [charCode],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<dynamic> addStream(_i5.Stream<List<int>>? stream) =>
      (super.noSuchMethod(
        Invocation.method(
          #addStream,
          [stream],
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);

  @override
  _i5.Future<dynamic> flush() => (super.noSuchMethod(
        Invocation.method(
          #flush,
          [],
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);
}

/// A class which mocks [BleConnected].
///
/// See the documentation for Mockito's code generation for more information.
// ignore: must_be_immutable
class MockBleConnected extends _i1.Mock implements _i10.BleConnected {
  MockBleConnected() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.BleCharacteristics get bleCharacteristics => (super.noSuchMethod(
        Invocation.getter(#bleCharacteristics),
        returnValue: _FakeBleCharacteristics_8(
          this,
          Invocation.getter(#bleCharacteristics),
        ),
      ) as _i6.BleCharacteristics);

  @override
  _i2.BluetoothDevice get device => (super.noSuchMethod(
        Invocation.getter(#device),
        returnValue: _FakeBluetoothDevice_2(
          this,
          Invocation.getter(#device),
        ),
      ) as _i2.BluetoothDevice);

  @override
  bool get isNewRadio => (super.noSuchMethod(
        Invocation.getter(#isNewRadio),
        returnValue: false,
      ) as bool);

  @override
  _i7.BleMeshRadio get radio => (super.noSuchMethod(
        Invocation.getter(#radio),
        returnValue: _FakeBleMeshRadio_9(
          this,
          Invocation.getter(#radio),
        ),
      ) as _i7.BleMeshRadio);

  @override
  String get radioId => (super.noSuchMethod(
        Invocation.getter(#radioId),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.getter(#radioId),
        ),
      ) as String);

  @override
  _i10.Connected<_i7.MeshRadio> copyWith({
    bool? isNewRadio,
    _i7.BleMeshRadio? radio,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #copyWith,
          [],
          {
            #isNewRadio: isNewRadio,
            #radio: radio,
          },
        ),
        returnValue: _i9.dummyValue<_i10.Connected<_i7.MeshRadio>>(
          this,
          Invocation.method(
            #copyWith,
            [],
            {
              #isNewRadio: isNewRadio,
              #radio: radio,
            },
          ),
        ),
      ) as _i10.Connected<_i7.MeshRadio>);
}

/// A class which mocks [BleCharacteristics].
///
/// See the documentation for Mockito's code generation for more information.
class MockBleCharacteristics extends _i1.Mock
    implements _i6.BleCharacteristics {
  MockBleCharacteristics() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.BluetoothCharacteristic get toRadio => (super.noSuchMethod(
        Invocation.getter(#toRadio),
        returnValue: _FakeBluetoothCharacteristic_10(
          this,
          Invocation.getter(#toRadio),
        ),
      ) as _i2.BluetoothCharacteristic);

  @override
  _i2.BluetoothCharacteristic get fromRadio => (super.noSuchMethod(
        Invocation.getter(#fromRadio),
        returnValue: _FakeBluetoothCharacteristic_10(
          this,
          Invocation.getter(#fromRadio),
        ),
      ) as _i2.BluetoothCharacteristic);

  @override
  _i2.BluetoothCharacteristic get fromNum => (super.noSuchMethod(
        Invocation.getter(#fromNum),
        returnValue: _FakeBluetoothCharacteristic_10(
          this,
          Invocation.getter(#fromNum),
        ),
      ) as _i2.BluetoothCharacteristic);
}
