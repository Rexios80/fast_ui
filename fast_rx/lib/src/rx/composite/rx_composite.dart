import 'dart:async';

import 'package:fast_rx/src/rx/rx.dart';
import 'package:flutter/foundation.dart';

/// Mixin version of [RxComposite] for use on classes that already extend [Rx]
mixin RxCompositeMixin<T> on Rx<T> {
  final _subs = <Rx, StreamSubscription>{};

  @override
  Future<void> close() async {
    for (final rx in _subs.keys) {
      await rx.close();
    }
    return super.close();
  }

  /// Add an [Rx] to this composite
  @protected
  void addRx(Rx rx) {
    if (_subs[rx] != null) return;
    final sub = rx.stream.listen((_) => notify());
    _subs[rx] = sub;
  }

  /// Remove an [Rx] from this composite
  @protected
  void removeRx(Rx rx) {
    final sub = _subs.remove(rx);
    sub?.cancel();
  }

  @override
  bool run(VoidCallback action) {
    final notified = super.run(action);
    if (notified) {
      notify();
    }
    return notified;
  }
}

/// An [Rx] that is composed of other [Rx] objects and notifies when they do
abstract class RxComposite extends Rx<void> with RxCompositeMixin<void> {
  @override
  void notify() {
    notifyWithValue(null);
  }
}
