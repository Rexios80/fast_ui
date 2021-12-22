import 'dart:collection';

import 'package:fast_rx/src/rx/rx_iterable.dart';
import 'package:flutter/foundation.dart';

/// A reactive queue
class RxQueue<E> extends RxIterable<E> implements Queue<E> {
  final Queue<E> _value;

  /// Create a reactive queue
  RxQueue(this._value);

  @protected
  @override
  Queue<E> get value {
    register();
    return _value;
  }

  @override
  void notify() {
    notifyWithValue(Queue.from(value));
  }

  @override
  Queue<R> cast<R>() {
    return value.cast<R>();
  }

  @override
  void add(E value) {
    this.value.add(value);
    notify();
  }

  @override
  void addAll(Iterable<E> iterable) {
    final old = Queue<E>.from(value);
    value.addAll(iterable);
    notifyIfChanged(old);
  }

  @override
  void addFirst(E value) {
    this.value.addFirst(value);
    notify();
  }

  @override
  void addLast(E value) {
    this.value.addLast(value);
    notify();
  }

  @override
  void clear() {
    final old = Queue<E>.from(value);
    value.clear();
    notifyIfChanged(old);
  }

  @override
  bool remove(Object? value) {
    final result = this.value.remove(value);
    notify();
    return result;
  }

  @override
  E removeFirst() {
    final result = this.value.removeFirst();
    notify();
    return result;
  }

  @override
  E removeLast() {
    final result = this.value.removeLast();
    notify();
    return result;
  }

  @override
  void removeWhere(bool Function(E element) test) {
    final old = Queue<E>.from(value);
    value.removeWhere(test);
    notifyIfChanged(old);
  }

  @override
  void retainWhere(bool Function(E element) test) {
    final old = Queue<E>.from(value);
    value.retainWhere(test);
    notifyIfChanged(old);
  }
}

/// Extension to allow creating reactive queues
extension RxQueueExtension<T> on Queue<T> {
  /// Create a reactive queue
  RxQueue<T> get rx => RxQueue<T>(this);
}
