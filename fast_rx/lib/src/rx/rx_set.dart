import 'package:fast_rx/src/rx/rx_iterable.dart';
import 'package:flutter/foundation.dart';

/// A reactive set
class RxSet<E> extends RxIterable<E> implements Set<E> {
  /// Create a reactive set
  RxSet([Set<E>? value]) : super(value ?? {});

  @override
  @protected
  Set<E> get value {
    return super.value as Set<E>;
  }

  @override
  @protected
  Set<E> get unregisteredValue {
    return super.unregisteredValue as Set<E>;
  }

  @override
  Set<E> copyValue() => Set.from(unregisteredValue);

  @override
  bool shouldNotify(Iterable<E> oldValue) =>
      oldValue is Set<E> && !setEquals(unregisteredValue, oldValue);

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
    notifyIfChanged(() => unregisteredValue.addAll(elements));
  }

  @override
  void clear() {
    notifyIfChanged(() => unregisteredValue.clear());
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
    return notifyIfChanged(() => this.value.remove(value));
  }

  @override
  void removeAll(Iterable<Object?> elements) {
    notifyIfChanged(() => unregisteredValue.removeAll(elements));
  }

  @override
  void removeWhere(bool Function(E element) test) {
    notifyIfChanged(() => unregisteredValue.removeWhere(test));
  }

  @override
  void retainAll(Iterable<Object?> elements) {
    notifyIfChanged(() => unregisteredValue.retainAll(elements));
  }

  @override
  void retainWhere(bool Function(E element) test) {
    notifyIfChanged(() => unregisteredValue.retainWhere(test));
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
