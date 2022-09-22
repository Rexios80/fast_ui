import 'dart:async';

import 'package:fast_rx/src/rx/rx.dart';
import 'package:flutter/foundation.dart';

/// An [Rx] that is composed of other [Rx] objects
abstract class RxComposite extends Rx<void> {
  final _subs = <Stream, StreamSubscription>{};

  /// Add an [Rx] to this composite
  @protected
  void addRx(Rx rx) {
    final stream = rx.stream;
    if (_subs[stream] != null) return; // Should this throw?
    final sub = rx.stream.listen((_) => notify());
    _subs[stream] = sub;
  }

  /// Remove an [Rx] from this composite
  @protected
  void removeRx(Rx rx) {
    final stream = rx.stream;
    final sub = _subs.remove(stream);
    sub?.cancel();
  }

  @override
  void notify() {
    notifyWithValue(null);
  }

  @override
  void run(VoidCallback action) {
    var changed = false;
    final subs = _subs.keys.map((e) => e.listen((_) => changed = true));

    super.run(action);

    for (final sub in subs) {
      sub.cancel();
    }
    if (changed) {
      notify();
    }
  }
}
