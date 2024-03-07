import 'dart:async';

import 'package:mockito/mockito.dart';
import 'package:tuple/tuple.dart';

// stream but waits for async listeners to finish
class MockStream<T> extends Mock implements Stream<T> {
  final listeners = <void Function(T event)>[];
  final subStreams = <Tuple2<MockStream<T>, bool Function(T event)>>[];
  Completer<T>? _firstCompleter;

  bool get hasListener => listeners.isNotEmpty;

  @override
  StreamSubscription<T> listen(
    void Function(T event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    if (onData != null) {
      listeners.add(onData);
    }

    return MockStreamSubscription(stream: this, listener: onData);
  }

  @override
  MockStream<T> where(bool Function(T event) test) {
    final stream = MockStream<T>();
    subStreams.add(Tuple2(stream, test));
    return stream;
  }

  @override
  Future<T> get first {
    _firstCompleter = Completer<T>();
    return _firstCompleter!.future;
  }

  void _removeListener(void Function(T event)? listener) {
    listeners.remove(listener);
  }

  Future<void> emit(T event) async {
    if (_firstCompleter != null) {
      _firstCompleter!.complete(event);
      return;
    }

    for (final subStream in subStreams) {
      if (subStream.item2(event)) {
        await subStream.item1.emit(event);
      }
    }
    for (final listener in listeners) {
      if (listener is Future<void> Function(T)) {
        await listener(event);
      } else {
        listener(event);
      }
    }
  }
}

class MockStreamSubscription<T> extends Mock implements StreamSubscription<T> {
  MockStreamSubscription({
    required MockStream<T> stream,
    required void Function(T event)? listener,
  })  : _stream = stream,
        _listener = listener;

  final MockStream<T> _stream;
  final void Function(T event)? _listener;

  @override
  Future<void> cancel() {
    if (_listener != null) {
      _stream._removeListener(_listener);
    }
    return Future.value();
  }
}
