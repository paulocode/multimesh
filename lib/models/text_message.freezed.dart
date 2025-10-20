// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TextMessage {
  int get packetId;
  String get text;
  int get from;
  int get to;
  int get channel;
  DateTime get time;
  TextMessageStatus get state;
  int get owner;
  Routing_Error get routingError;

  /// Create a copy of TextMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TextMessageCopyWith<TextMessage> get copyWith =>
      _$TextMessageCopyWithImpl<TextMessage>(this as TextMessage, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TextMessage &&
            (identical(other.packetId, packetId) ||
                other.packetId == packetId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.routingError, routingError) ||
                other.routingError == routingError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, packetId, text, from, to,
      channel, time, state, owner, routingError);

  @override
  String toString() {
    return 'TextMessage(packetId: $packetId, text: $text, from: $from, to: $to, channel: $channel, time: $time, state: $state, owner: $owner, routingError: $routingError)';
  }
}

/// @nodoc
abstract mixin class $TextMessageCopyWith<$Res> {
  factory $TextMessageCopyWith(
          TextMessage value, $Res Function(TextMessage) _then) =
      _$TextMessageCopyWithImpl;
  @useResult
  $Res call(
      {int packetId,
      String text,
      int from,
      int to,
      int channel,
      DateTime time,
      TextMessageStatus state,
      int owner,
      Routing_Error routingError});
}

/// @nodoc
class _$TextMessageCopyWithImpl<$Res> implements $TextMessageCopyWith<$Res> {
  _$TextMessageCopyWithImpl(this._self, this._then);

  final TextMessage _self;
  final $Res Function(TextMessage) _then;

  /// Create a copy of TextMessage
  /// with the given fields replaced by the non-null parameter values.
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
    Object? routingError = null,
  }) {
    return _then(_self.copyWith(
      packetId: null == packetId
          ? _self.packetId
          : packetId // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _self.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      to: null == to
          ? _self.to
          : to // ignore: cast_nullable_to_non_nullable
              as int,
      channel: null == channel
          ? _self.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as TextMessageStatus,
      owner: null == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as int,
      routingError: null == routingError
          ? _self.routingError
          : routingError // ignore: cast_nullable_to_non_nullable
              as Routing_Error,
    ));
  }
}

/// Adds pattern-matching-related methods to [TextMessage].
extension TextMessagePatterns on TextMessage {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TextMessage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TextMessage() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TextMessage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TextMessage():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TextMessage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TextMessage() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int packetId,
            String text,
            int from,
            int to,
            int channel,
            DateTime time,
            TextMessageStatus state,
            int owner,
            Routing_Error routingError)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TextMessage() when $default != null:
        return $default(
            _that.packetId,
            _that.text,
            _that.from,
            _that.to,
            _that.channel,
            _that.time,
            _that.state,
            _that.owner,
            _that.routingError);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int packetId,
            String text,
            int from,
            int to,
            int channel,
            DateTime time,
            TextMessageStatus state,
            int owner,
            Routing_Error routingError)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TextMessage():
        return $default(
            _that.packetId,
            _that.text,
            _that.from,
            _that.to,
            _that.channel,
            _that.time,
            _that.state,
            _that.owner,
            _that.routingError);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int packetId,
            String text,
            int from,
            int to,
            int channel,
            DateTime time,
            TextMessageStatus state,
            int owner,
            Routing_Error routingError)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TextMessage() when $default != null:
        return $default(
            _that.packetId,
            _that.text,
            _that.from,
            _that.to,
            _that.channel,
            _that.time,
            _that.state,
            _that.owner,
            _that.routingError);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TextMessage extends TextMessage {
  const _TextMessage(
      {this.packetId = 0,
      required this.text,
      required this.from,
      required this.to,
      required this.channel,
      required this.time,
      this.state = TextMessageStatus.SENDING,
      required this.owner,
      this.routingError = Routing_Error.NONE})
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
  @JsonKey()
  final Routing_Error routingError;

  /// Create a copy of TextMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TextMessageCopyWith<_TextMessage> get copyWith =>
      __$TextMessageCopyWithImpl<_TextMessage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TextMessage &&
            (identical(other.packetId, packetId) ||
                other.packetId == packetId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.routingError, routingError) ||
                other.routingError == routingError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, packetId, text, from, to,
      channel, time, state, owner, routingError);

  @override
  String toString() {
    return 'TextMessage(packetId: $packetId, text: $text, from: $from, to: $to, channel: $channel, time: $time, state: $state, owner: $owner, routingError: $routingError)';
  }
}

/// @nodoc
abstract mixin class _$TextMessageCopyWith<$Res>
    implements $TextMessageCopyWith<$Res> {
  factory _$TextMessageCopyWith(
          _TextMessage value, $Res Function(_TextMessage) _then) =
      __$TextMessageCopyWithImpl;
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
      int owner,
      Routing_Error routingError});
}

/// @nodoc
class __$TextMessageCopyWithImpl<$Res> implements _$TextMessageCopyWith<$Res> {
  __$TextMessageCopyWithImpl(this._self, this._then);

  final _TextMessage _self;
  final $Res Function(_TextMessage) _then;

  /// Create a copy of TextMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? packetId = null,
    Object? text = null,
    Object? from = null,
    Object? to = null,
    Object? channel = null,
    Object? time = null,
    Object? state = null,
    Object? owner = null,
    Object? routingError = null,
  }) {
    return _then(_TextMessage(
      packetId: null == packetId
          ? _self.packetId
          : packetId // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _self.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      to: null == to
          ? _self.to
          : to // ignore: cast_nullable_to_non_nullable
              as int,
      channel: null == channel
          ? _self.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as TextMessageStatus,
      owner: null == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as int,
      routingError: null == routingError
          ? _self.routingError
          : routingError // ignore: cast_nullable_to_non_nullable
              as Routing_Error,
    ));
  }
}

// dart format on
