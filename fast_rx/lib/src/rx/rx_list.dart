import 'dart:math';

import 'package:fast_rx/src/rx/rx_iterable.dart';
import 'package:flutter/foundation.dart';

/// A reactive list
class RxList<E> extends RxIterable<E> implements List<E> {
  /// Create a reactive list
  RxList(List<E> value) : super(value);

  @override
  @protected
  List<E> get value {
    return super.value as List<E>;
  }

  @override
  List<E> copyValue() => List.from(unregisteredValue);

  @override
  bool shouldNotify(Iterable<E> oldValue) =>
      oldValue is List<E> &&
      !listEquals(unregisteredValue as List<E>, oldValue);

  @override
  List<R> cast<R>() {
    return value.cast<R>();
  }

  @override
  List<E> operator +(List<E> other) {
    return value + other;
  }

  @override
  E operator [](int index) {
    return value[index];
  }

  @override
  void operator []=(int index, E value) {
    notifyIfChanged(() => this.value[index] = value);
  }

  @override
  void add(E value) {
    this.value.add(value);
    notify();
  }

  @override
  void addAll(Iterable<E> iterable) {
    notifyIfChanged(() => value.addAll(iterable));
  }

  @override
  Map<int, E> asMap() {
    return value.asMap();
  }

  @override
  void clear() {
    notifyIfChanged(() => value.clear());
  }

  @override
  void fillRange(int start, int end, [E? fillValue]) {
    notifyIfChanged(() => value.fillRange(start, end, fillValue));
  }

  @override
  set first(E value) {
    notifyIfChanged(() => this.value.first = value);
  }

  @override
  Iterable<E> getRange(int start, int end) {
    return value.getRange(start, end);
  }

  @override
  int indexOf(E element, [int start = 0]) {
    return value.indexOf(element, start);
  }

  @override
  int indexWhere(bool Function(E element) test, [int start = 0]) {
    return value.indexWhere(test, start);
  }

  @override
  void insert(int index, E element) {
    notifyIfChanged(() => value.insert(index, element));
  }

  @override
  void insertAll(int index, Iterable<E> iterable) {
    notifyIfChanged(() => value.insertAll(index, iterable));
  }

  @override
  set last(E value) {
    notifyIfChanged(() => this.value.last = value);
  }

  @override
  int lastIndexOf(E element, [int? start]) {
    return value.lastIndexOf(element, start);
  }

  @override
  int lastIndexWhere(bool Function(E element) test, [int? start]) {
    return value.lastIndexWhere(test, start);
  }

  @override
  set length(int newLength) {
    notifyIfChanged(() => value.length = newLength);
  }

  @override
  bool remove(Object? value) {
    return notifyIfChanged(() => this.value.remove(value));
  }

  @override
  E removeAt(int index) {
    return notifyIfChanged(() => value.removeAt(index));
  }

  @override
  E removeLast() {
    final result = value.removeLast();
    notify();
    return result;
  }

  @override
  void removeRange(int start, int end) {
    notifyIfChanged(() => value.removeRange(start, end));
  }

  @override
  void removeWhere(bool Function(E element) test) {
    notifyIfChanged(() => value.removeWhere(test));
  }

  @override
  void replaceRange(int start, int end, Iterable<E> replacements) {
    notifyIfChanged(() => value.replaceRange(start, end, replacements));
  }

  @override
  void retainWhere(bool Function(E element) test) {
    notifyIfChanged(() => value.retainWhere(test));
  }

  @override
  Iterable<E> get reversed {
    return value.reversed;
  }

  @override
  void setAll(int index, Iterable<E> iterable) {
    notifyIfChanged(() => value.setAll(index, iterable));
  }

  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    notifyIfChanged(() => value.setRange(start, end, iterable, skipCount));
  }

  @override
  void shuffle([Random? random]) {
    value.shuffle(random);
    notify();
  }

  @override
  void sort([int Function(E a, E b)? compare]) {
    notifyIfChanged(() => value.sort(compare));
  }

  @override
  List<E> sublist(int start, [int? end]) {
    return value.sublist(start, end);
  }
}

/// Extension to allow creating reactive lists
extension RxListExtension<T> on List<T> {
  /// Create a reactive list
  RxList<T> get rx => RxList<T>(this);
}
