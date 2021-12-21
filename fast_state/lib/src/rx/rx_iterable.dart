import 'package:fast_state/src/rx/rx.dart';

/// A reactive iterable
abstract class RxIterable<E> with Rx<Iterable<E>> implements Iterable<E> {
  @override
  bool any(bool Function(E element) test) {
    register();
    return value.any(test);
  }

  @override
  Iterable<R> cast<R>() {
    register();
    return value.cast<R>();
  }

  @override
  bool contains(Object? element) {
    register();
    return value.contains(element);
  }

  @override
  E elementAt(int index) {
    register();
    return value.elementAt(index);
  }

  @override
  bool every(bool Function(E element) test) {
    register();
    return value.every(test);
  }

  @override
  Iterable<T> expand<T>(Iterable<T> Function(E element) toElements) {
    register();
    return value.expand(toElements);
  }

  @override
  E get first {
    register();
    return value.first;
  }

  @override
  E firstWhere(bool Function(E element) test, {E Function()? orElse}) {
    register();
    return value.firstWhere(test, orElse: orElse);
  }

  @override
  T fold<T>(T initialValue, T Function(T previousValue, E element) combine) {
    register();
    return value.fold(initialValue, combine);
  }

  @override
  Iterable<E> followedBy(Iterable<E> other) {
    register();
    return value.followedBy(other);
  }

  @override
  void forEach(void Function(E element) action) {
    register();
    value.forEach(action);
  }

  @override
  bool get isEmpty {
    register();
    return value.isEmpty;
  }

  @override
  bool get isNotEmpty {
    register();
    return value.isNotEmpty;
  }

  @override
  Iterator<E> get iterator => value.iterator;

  @override
  String join([String separator = '']) {
    register();
    return value.join(separator);
  }

  @override
  E get last {
    register();
    return value.last;
  }

  @override
  E lastWhere(bool Function(E element) test, {E Function()? orElse}) {
    register();
    return value.lastWhere(test, orElse: orElse);
  }

  @override
  int get length {
    register();
    return value.length;
  }

  @override
  Iterable<T> map<T>(T Function(E e) toElement) {
    register();
    return value.map(toElement);
  }

  @override
  E reduce(E Function(E value, E element) combine) {
    register();
    return value.reduce(combine);
  }

  @override
  E get single {
    register();
    return value.single;
  }

  @override
  E singleWhere(bool Function(E element) test, {E Function()? orElse}) {
    register();
    return value.singleWhere(test, orElse: orElse);
  }

  @override
  Iterable<E> skip(int count) {
    register();
    return value.skip(count);
  }

  @override
  Iterable<E> skipWhile(bool Function(E value) test) {
    register();
    return value.skipWhile(test);
  }

  @override
  Iterable<E> take(int count) {
    register();
    return value.take(count);
  }

  @override
  Iterable<E> takeWhile(bool Function(E value) test) {
    register();
    return value.takeWhile(test);
  }

  @override
  List<E> toList({bool growable = true}) {
    register();
    return value.toList(growable: growable);
  }

  @override
  Set<E> toSet() {
    register();
    return value.toSet();
  }

  @override
  Iterable<E> where(bool Function(E element) test) {
    register();
    return value.where(test);
  }

  @override
  Iterable<T> whereType<T>() {
    register();
    return value.whereType<T>();
  }
}
