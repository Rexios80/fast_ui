import 'dart:async';
import 'dart:collection';

import 'package:fast_rx/src/exceptions.dart';
import 'package:fast_rx/src/rx/rx_zone.dart';
import 'package:flutter/foundation.dart';

/// Listen to multiple Rx streams
class RxObserver {
  /// The [Stream]s this observer is listening to
  final _streams = HashSet<Stream>();

  /// The subscriptions to the [_streams]
  final _streamSubscriptions = <StreamSubscription>[];

  /// The controller to send all reactive updates to
  final _controller = StreamController<void>();

  /// The subscription to the [_controller]
  StreamSubscription? _subscription;

  /// Returns false if there are no streams to listen to
  bool get _listenable => _streams.isNotEmpty;

  /// Add a stream to the observer
  void _addStream(Stream stream) {
    // Don't add duplicate streams
    if (_streams.contains(stream)) return;
    _streams.add(stream);
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
  }

  /// Set up this observer with the given [builder]
  T setup<T>(ValueGetter<T> builder) {
    // Calling the builder will add any relevant streams to the observer
    final built = runRxZoned(builder, registrar: _addStream);
    if (!_listenable) {
      throw NoRxValuesInFastBuilder();
    }
    return built;
  }
}
