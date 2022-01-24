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
  @protected
  List<E> get unregisteredValue {
    return super.unregisteredValue as List<E>;
  }

  @override
  List<E> copyValue() => List.from(unregisteredValue);

  @override
  bool shouldNotify(Iterable<E> oldValue) =>
      oldValue is List<E> &&
      !listEquals(unregisteredValue, oldValue);

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
    unregisteredValue[index] = value;
  }

  @override
  void add(E value) {
    unregisteredValue.add(value);
    notify();
  }

  @override
  void addAll(Iterable<E> iterable) {
    notifyIfChanged(() => unregisteredValue.addAll(iterable));
  }

  @override
  Map<int, E> asMap() {
    return value.asMap();
  }

  @override
  void clear() {
    notifyIfChanged(() => unregisteredValue.clear());
  }

  @override
  void fillRange(int start, int end, [E? fillValue]) {
    notifyIfChanged(() => unregisteredValue.fillRange(start, end, fillValue));
  }

  @override
  set first(E value) {
    notifyIfChanged(() => unregisteredValue.first = value);
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
    notifyIfChanged(() => unregisteredValue.insert(index, element));
  }

  @override
  void insertAll(int index, Iterable<E> iterable) {
    notifyIfChanged(() => unregisteredValue.insertAll(index, iterable));
  }

  @override
  set last(E value) {
    notifyIfChanged(() => unregisteredValue.last = value);
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
    notifyIfChanged(() => unregisteredValue.length = newLength);
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
    notifyIfChanged(() => unregisteredValue.removeRange(start, end));
  }

  @override
  void removeWhere(bool Function(E element) test) {
    notifyIfChanged(() => unregisteredValue.removeWhere(test));
  }

  @override
  void replaceRange(int start, int end, Iterable<E> replacements) {
    notifyIfChanged(() => unregisteredValue.replaceRange(start, end, replacements));
  }

  @override
  void retainWhere(bool Function(E element) test) {
    notifyIfChanged(() => unregisteredValue.retainWhere(test));
  }

  @override
  Iterable<E> get reversed {
    return value.reversed;
  }

  @override
  void setAll(int index, Iterable<E> iterable) {
    notifyIfChanged(() => unregisteredValue.setAll(index, iterable));
  }

  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    notifyIfChanged(() => unregisteredValue.setRange(start, end, iterable, skipCount));
  }

  @override
  void shuffle([Random? random]) {
    unregisteredValue.shuffle(random);
    notify();
  }

  @override
  void sort([int Function(E a, E b)? compare]) {
    notifyIfChanged(() => unregisteredValue.sort(compare));
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
