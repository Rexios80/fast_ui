import 'dart:async';

import 'package:fast_rx/src/rx/rx.dart';
import 'package:flutter/foundation.dart';

/// Mixin version of [RxComposite] for use on classes that already extend [Rx]
mixin RxCompositeMixin<T> on Rx<T> {
  final _subs = <int, StreamSubscription>{};

  /// Add an [Rx] to this composite
  @protected
  void addRx(Rx rx) {
    if (_subs[identityHashCode(rx)] != null) return;
    final sub = rx.stream.listen((_) => notify());
    _subs[identityHashCode(rx)] = sub;
  }

  /// Remove an [Rx] from this composite
  @protected
  void removeRx(Rx rx) {
    final sub = _subs.remove(identityHashCode(rx));
    sub?.cancel();
  }

  @override
  bool run(VoidCallback action, {bool notify = true}) {
    final notified = super.run(action, notify: notify);
    if (notify && notified) {
      this.notify();
    }
    return notified;
  }

  /// Check if an [Rx] stream is registered for testing
  @visibleForTesting
  bool hasStream(int rxId) => _subs[identityHashCode(rxId)] != null;
}

/// An [Rx] that is composed of other [Rx] objects and notifies when they do
abstract class RxComposite extends Rx<void> with RxCompositeMixin<void> {
  @override
  void notify() {
    notifyWithValue(null);
  }
}
