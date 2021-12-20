import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

/// Class to deal with setting up [RxObserver]s
class RxNotifier {
  /// Holds the working [RxObserver]
  static RxObserver? _observerIntermediate;

  /// Add a stream to the working [RxObserver]
  static void addStream(Stream stream) {
    _observerIntermediate?.addStream(stream);
  }

  /// Set up the given [observer] with the given [builder]
  static void setupObserver(RxObserver observer, Function builder) {
    _observerIntermediate = observer;
    // Calling the builder will add any relevant streams to the observer
    builder();
    if (!observer.listenable) {
      throw 'No observables found in the given FastBuilder.'
          ' Rx objects must be used in the root widget of a FastBuilder.';
    }
    _observerIntermediate = null;
  }
}

/// Listen to multiple Rx streams
class RxObserver {
  final List<Stream> _streams = [];
  StreamSubscription? _subscription;

  /// Returns false if there are no streams to listen to
  bool get listenable => _streams.isNotEmpty;

  /// Add a stream to the observer
  void addStream(Stream stream) {
    _streams.add(stream);
  }

  /// Listen to all [_streams] and call [callback] when any of them emits
  void listen(VoidCallback callback) {
    _subscription = MergeStream(_streams).listen((_) => callback());
  }

  /// Dispose the [_subscription]
  void dispose() {
    _subscription?.cancel();
  }
}
