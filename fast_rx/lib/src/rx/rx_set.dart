import 'package:fast_rx/src/rx/rx_iterable.dart';
import 'package:flutter/foundation.dart';

/// A reactive set
class RxSet<E> extends RxIterable<E> implements Set<E> {
  final Set<E> _value;

  /// Create a reactive set
  RxSet(this._value);

  @protected
  @override
  Set<E> get value {
    register();
    return _value;
  }

  @override
  Set<R> cast<R>() {
    return value.cast<R>();
  }

  @override
  bool add(E value) {
    final result = this.value.add(value);
    notify();
    return result;
  }

  @override
  void addAll(Iterable<E> elements) {
    final old = Set<E>.from(value);
    value.addAll(elements);
    notifyIfChanged(old);
  }

  @override
  void clear() {
    final old = Set<E>.from(value);
    value.clear();
    notifyIfChanged(old);
  }

  @override
  bool containsAll(Iterable<Object?> other) {
    return value.containsAll(other);
  }

  @override
  Set<E> difference(Set<Object?> other) {
    return value.difference(other);
  }

  @override
  Set<E> intersection(Set<Object?> other) {
    return value.intersection(other);
  }

  @override
  E? lookup(Object? object) {
    return value.lookup(object);
  }

  @override
  bool remove(Object? value) {
    final old = Set<E>.from(this.value);
    final result = this.value.remove(value);
    notifyIfChanged(old);
    return result;
  }

  @override
  void removeAll(Iterable<Object?> elements) {
    final old = Set<E>.from(value);
    value.removeAll(elements);
    notifyIfChanged(old);
  }

  @override
  void removeWhere(bool Function(E element) test) {
    final old = Set<E>.from(value);
    value.removeWhere(test);
    notifyIfChanged(old);
  }

  @override
  void retainAll(Iterable<Object?> elements) {
    final old = Set<E>.from(value);
    value.retainAll(elements);
    notifyIfChanged(old);
  }

  @override
  void retainWhere(bool Function(E element) test) {
    final old = Set<E>.from(value);
    value.retainWhere(test);
    notifyIfChanged(old);
  }

  @override
  Set<E> union(Set<E> other) {
    return value.union(other);
  }
}

/// Extension to allow creating reactive sets
extension RxSetExtension<T> on Set<T> {
  /// Create a reactive set
  RxSet<T> get rx => RxSet<T>(this);
}
