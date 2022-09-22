import 'package:fast_rx/src/rx/object/rx_object.dart';

/// A reactive iterable
abstract class RxIterable<E> extends RxObject<Iterable<E>>
    implements Iterable<E> {
  /// Create a reactive iterable
  RxIterable(super.initialValue);

  /// Convenience method to replace all current elements with [elements]
  void replaceAll(Iterable<E> elements);

  @override
  bool any(bool Function(E element) test) {
    return value.any(test);
  }

  // coverage:ignore-start
  @override
  Iterable<R> cast<R>() {
    return value.cast<R>();
  }
  // coverage:ignore-end

  @override
  bool contains(Object? element) {
    return value.contains(element);
  }

  @override
  E elementAt(int index) {
    return value.elementAt(index);
  }

  @override
  bool every(bool Function(E element) test) {
    return value.every(test);
  }

  @override
  Iterable<T> expand<T>(Iterable<T> Function(E element) toElements) {
    return value.expand(toElements);
  }

  @override
  E get first {
    return value.first;
  }

  @override
  E firstWhere(bool Function(E element) test, {E Function()? orElse}) {
    return value.firstWhere(test, orElse: orElse);
  }

  @override
  T fold<T>(T initialValue, T Function(T previousValue, E element) combine) {
    return value.fold(initialValue, combine);
  }

  @override
  Iterable<E> followedBy(Iterable<E> other) {
    return value.followedBy(other);
  }

  @override
  void forEach(void Function(E element) action) {
    unregisteredValue.forEach(action);
  }

  @override
  bool get isEmpty {
    return value.isEmpty;
  }

  @override
  bool get isNotEmpty {
    return value.isNotEmpty;
  }

  @override
  Iterator<E> get iterator => value.iterator;

  @override
  String join([String separator = '']) {
    return value.join(separator);
  }

  @override
  E get last {
    return value.last;
  }

  @override
  E lastWhere(bool Function(E element) test, {E Function()? orElse}) {
    return value.lastWhere(test, orElse: orElse);
  }

  @override
  int get length {
    return value.length;
  }

  @override
  Iterable<T> map<T>(T Function(E e) toElement) {
    return value.map(toElement);
  }

  @override
  E reduce(E Function(E value, E element) combine) {
    return value.reduce(combine);
  }

  @override
  E get single {
    return value.single;
  }

  @override
  E singleWhere(bool Function(E element) test, {E Function()? orElse}) {
    return value.singleWhere(test, orElse: orElse);
  }

  @override
  Iterable<E> skip(int count) {
    return value.skip(count);
  }

  @override
  Iterable<E> skipWhile(bool Function(E value) test) {
    return value.skipWhile(test);
  }

  @override
  Iterable<E> take(int count) {
    return value.take(count);
  }

  @override
  Iterable<E> takeWhile(bool Function(E value) test) {
    return value.takeWhile(test);
  }

  @override
  List<E> toList({bool growable = true}) {
    return value.toList(growable: growable);
  }

  @override
  Set<E> toSet() {
    return value.toSet();
  }

  @override
  Iterable<E> where(bool Function(E element) test) {
    return value.where(test);
  }

  @override
  Iterable<T> whereType<T>() {
    return value.whereType<T>();
  }
}
