// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TextMessage {
  int get packetId => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  int get from => throw _privateConstructorUsedError;
  int get to => throw _privateConstructorUsedError;
  int get channel => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  TextMessageStatus get state => throw _privateConstructorUsedError;
  int get owner => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TextMessageCopyWith<TextMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextMessageCopyWith<$Res> {
  factory $TextMessageCopyWith(
          TextMessage value, $Res Function(TextMessage) then) =
      _$TextMessageCopyWithImpl<$Res, TextMessage>;
  @useResult
  $Res call(
      {int packetId,
      String text,
      int from,
      int to,
      int channel,
      DateTime time,
      TextMessageStatus state,
      int owner});
}

/// @nodoc
class _$TextMessageCopyWithImpl<$Res, $Val extends TextMessage>
    implements $TextMessageCopyWith<$Res> {
  _$TextMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packetId = null,
    Object? text = null,
    Object? from = null,
    Object? to = null,
    Object? channel = null,
    Object? time = null,
    Object? state = null,
    Object? owner = null,
  }) {
    return _then(_value.copyWith(
      packetId: null == packetId
          ? _value.packetId
          : packetId // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TextMessageStatus,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextMessageImplCopyWith<$Res>
    implements $TextMessageCopyWith<$Res> {
  factory _$$TextMessageImplCopyWith(
          _$TextMessageImpl value, $Res Function(_$TextMessageImpl) then) =
      __$$TextMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int packetId,
      String text,
      int from,
      int to,
      int channel,
      DateTime time,
      TextMessageStatus state,
      int owner});
}

/// @nodoc
class __$$TextMessageImplCopyWithImpl<$Res>
    extends _$TextMessageCopyWithImpl<$Res, _$TextMessageImpl>
    implements _$$TextMessageImplCopyWith<$Res> {
  __$$TextMessageImplCopyWithImpl(
      _$TextMessageImpl _value, $Res Function(_$TextMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packetId = null,
    Object? text = null,
    Object? from = null,
    Object? to = null,
    Object? channel = null,
    Object? time = null,
    Object? state = null,
    Object? owner = null,
  }) {
    return _then(_$TextMessageImpl(
      packetId: null == packetId
          ? _value.packetId
          : packetId // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TextMessageStatus,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TextMessageImpl extends _TextMessage {
  const _$TextMessageImpl(
      {this.packetId = 0,
      required this.text,
      required this.from,
      required this.to,
      required this.channel,
      required this.time,
      this.state = TextMessageStatus.SENDING,
      required this.owner})
      : super._();

  @override
  @JsonKey()
  final int packetId;
  @override
  final String text;
  @override
  final int from;
  @override
  final int to;
  @override
  final int channel;
  @override
  final DateTime time;
  @override
  @JsonKey()
  final TextMessageStatus state;
  @override
  final int owner;

  @override
  String toString() {
    return 'TextMessage(packetId: $packetId, text: $text, from: $from, to: $to, channel: $channel, time: $time, state: $state, owner: $owner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextMessageImpl &&
            (identical(other.packetId, packetId) ||
                other.packetId == packetId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.owner, owner) || other.owner == owner));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, packetId, text, from, to, channel, time, state, owner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextMessageImplCopyWith<_$TextMessageImpl> get copyWith =>
      __$$TextMessageImplCopyWithImpl<_$TextMessageImpl>(this, _$identity);
}

abstract class _TextMessage extends TextMessage {
  const factory _TextMessage(
      {final int packetId,
      required final String text,
      required final int from,
      required final int to,
      required final int channel,
      required final DateTime time,
      final TextMessageStatus state,
      required final int owner}) = _$TextMessageImpl;
  const _TextMessage._() : super._();

  @override
  int get packetId;
  @override
  String get text;
  @override
  int get from;
  @override
  int get to;
  @override
  int get channel;
  @override
  DateTime get time;
  @override
  TextMessageStatus get state;
  @override
  int get owner;
  @override
  @JsonKey(ignore: true)
  _$$TextMessageImplCopyWith<_$TextMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
