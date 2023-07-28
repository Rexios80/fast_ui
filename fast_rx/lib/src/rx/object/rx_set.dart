import 'package:collection/collection.dart';
import 'package:fast_rx/src/rx/object/rx_iterable.dart';

/// A reactive [Set]
class RxSet<E> extends RxIterable<E> implements Set<E> {
  /// Create a reactive [Set]
  RxSet([Set<E>? value]) : super(value ?? {});

  @override
  Set<E> get value {
    return super.value as Set<E>;
  }

  @override
  Set<E> get unregisteredValue {
    return super.unregisteredValue as Set<E>;
  }

  @override
  Set<E> copyValue() => Set.from(unregisteredValue);

  @override
  bool shouldNotify(Iterable<E> oldValue) =>
      !const SetEquality().equals(unregisteredValue, oldValue as Set<E>);

  @override
  void replaceAll(Iterable<E> elements) {
    notifyIfChanged(() {
      unregisteredValue.clear();
      unregisteredValue.addAll(elements);
    });
  }

  @override
  Set<R> cast<R>() {
    return value.cast<R>();
  }

  @override
  bool add(E value) {
    final result = this.value.add(value);
    if (result) notify();
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
    final result = this.value.remove(value);
    if (result) notify();
    return result;
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

/// Extension to allow creating reactive [Set]s
extension RxSetExtension<E> on Set<E> {
  /// Create a reactive [Set]
  RxSet<E> get rx => RxSet<E>(this);
}
