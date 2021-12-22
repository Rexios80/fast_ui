import 'dart:async';

import 'package:flutter/foundation.dart';

/// Class to deal with setting up [RxObserver]s
class RxNotifier {
  RxNotifier._();

  /// Holds the working [RxObserver]
  static RxObserver? _observerIntermediate;

  /// Add a stream to the working [RxObserver]
  static void addStream(Stream stream) {
    _observerIntermediate?.addStream(stream);
  }

  /// Set up the given [observer] with the given [builder]
  static T setupObserver<T>(RxObserver observer, ValueGetter<T> builder) {
    _observerIntermediate = observer;
    // Calling the builder will add any relevant streams to the observer
    final built = builder();
    if (!observer.listenable) {
      throw 'No reactive values found in the given FastBuilder.'
          ' Rx values must be used in the root widget of a FastBuilder.';
    }
    _observerIntermediate = null;
    return built;
  }
}

/// Listen to multiple Rx streams
class RxObserver {
  /// The [Stream]s this observer is listening to
  final _streams = <Stream, bool>{};
  final _streamSubscriptions = <StreamSubscription>[];
  final _controller = StreamController<void>();
  StreamSubscription? _subscription;

  /// Returns false if there are no streams to listen to
  bool get listenable => _streams.isNotEmpty;

  /// Add a stream to the observer
  void addStream(Stream stream) {
    // Don't add duplicate streams
    if (_streams[stream] != null) return;
    _streams[stream] = true;
    final subscription = stream.listen((_) => _controller.add(null));
    _streamSubscriptions.add(subscription);
  }

  /// Listen to all [_streams] and call [callback] when any of them emits
  void listen(VoidCallback callback) {
    _subscription = _controller.stream.listen((_) => callback());
  }

  /// Cancel all stream subscriptions
  void dispose() {
    _subscription?.cancel();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
    _streamSubscriptions.clear();
  }
}
