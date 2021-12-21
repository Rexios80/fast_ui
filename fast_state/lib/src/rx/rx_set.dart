import 'dart:async';

import 'package:collection/collection.dart';
import 'package:fast_state/src/rx/rx.dart';
import 'package:fast_state/src/rx_notifier.dart';
import 'package:flutter/foundation.dart';

/// A reactive set
class RxSet<T> extends DelegatingSet<T> implements Rx<Set<T>> {
  @override
  StreamController<Set<T>> get controller => StreamController.broadcast();

  /// Create a reactive list
  RxSet(Set<T> set) : super(set);

  @override
  @protected
  Set<T> get value {
    RxNotifier.addStream(controller.stream);
    return this;
  }

  @override
  @protected
  set value(Set<T> value) {}

  @override
  StreamSubscription<Set<T>> listen(void Function(Set<T>) onChanged) {
    return controller.stream.listen(onChanged);
  }

  @override
  void notify() {
    controller.add(this);
  }

  // Set methods

  @override
  bool add(T value) {
    final result = super.add(value);
    notify();
    return result;
  }

  @override
  void addAll(Iterable<T> elements) {
    super.addAll(elements);
    notify();
  }

  @override
  bool remove(Object? value) {
    final result = super.remove(value);
    notify();
    return result;
  }

  @override
  void clear() {
    super.clear();
    notify();
  }
}

/// Extension to allow creating reactive sets
extension RxSetExtension<T> on Set<T> {
  /// Create a reactive set
  RxSet<T> get rx => RxSet<T>(this);
}
