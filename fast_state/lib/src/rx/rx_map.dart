import 'dart:async';

import 'package:collection/collection.dart';
import 'package:fast_state/src/rx/rx.dart';
import 'package:fast_state/src/rx_notifier.dart';
import 'package:flutter/foundation.dart';

/// A reactive map
class RxMap<K, V> extends DelegatingMap<K, V> implements Rx<Map<K, V>> {
  @override
  StreamController<Map<K, V>> get controller => StreamController.broadcast();

  /// Create a reactive map
  RxMap(Map<K, V> map) : super(map);

  @override
  @protected
  Map<K, V> get value {
    RxNotifier.addStream(controller.stream);
    return this;
  }

  @override
  @protected
  set value(Map<K, V> value) {}

  @override
  StreamSubscription<Map<K, V>> listen(void Function(Map<K, V>) onChanged) {
    return controller.stream.listen(onChanged);
  }

  @override
  void notify() {
    controller.add(this);
  }

  // Map methods

  @override
  V? operator [](Object? key) {
    RxNotifier.addStream(controller.stream);
    return super[key];
  }

  @override
  operator []=(K key, V value) {
    final old = Map.from(this);
    super[key] = value;
    if (old != this) {
      notify();
    }
  }

  @override
  void addAll(Map<K, V> other) {
    super.addAll(other);
    notify();
  }

  @override
  V? remove(Object? key) {
    final result = super.remove(key);
    notify();
    return result;
  }

  @override
  void clear() {
    super.clear();
    notify();
  }
}

/// Extension to allow creating reactive maps
extension RxMapExtension<K, V> on Map<K, V> {
  /// Create a reactive map
  RxMap<K, V> get rx => RxMap<K, V>(this);
}
