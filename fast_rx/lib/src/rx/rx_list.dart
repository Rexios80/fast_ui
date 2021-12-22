import 'dart:math';

import 'package:fast_rx/src/rx/rx_iterable.dart';
import 'package:flutter/foundation.dart';

/// A reactive list
class RxList<E> extends RxIterable<E> implements List<E> {
  final List<E> _value;

  /// Create a reactive list
  RxList(this._value);

  @protected
  @override
  List<E> get value {
    register();
    return _value;
  }

  @override
  void notify() {
    notifyWithValue(List.from(value));
  }

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
    final old = List<E>.from(this.value);
    this.value[index] = value;
    notifyIfChanged(old);
  }

  @override
  void add(E value) {
    this.value.add(value);
    notify();
  }

  @override
  void addAll(Iterable<E> iterable) {
    final old = List<E>.from(value);
    value.addAll(iterable);
    notifyIfChanged(old);
  }

  @override
  Map<int, E> asMap() {
    return value.asMap();
  }

  @override
  void clear() {
    final old = List<E>.from(value);
    value.clear();
    notifyIfChanged(old);
  }

  @override
  void fillRange(int start, int end, [E? fillValue]) {
    final old = List<E>.from(value);
    value.fillRange(start, end, fillValue);
    notifyIfChanged(old);
  }

  @override
  set first(E value) {
    final old = List<E>.from(this.value);
    this.value.first = value;
    notifyIfChanged(old);
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
    final old = List<E>.from(value);
    value.insert(index, element);
    notifyIfChanged(old);
  }

  @override
  void insertAll(int index, Iterable<E> iterable) {
    final old = List<E>.from(value);
    value.insertAll(index, iterable);
    notifyIfChanged(old);
  }

  @override
  set last(E value) {
    final old = List<E>.from(this.value);
    this.value.last = value;
    notifyIfChanged(old);
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
    final old = List<E>.from(value);
    value.length = newLength;
    notifyIfChanged(old);
  }

  @override
  bool remove(Object? value) {
    final old = List<E>.from(this.value);
    final result = this.value.remove(value);
    notifyIfChanged(old);
    return result;
  }

  @override
  E removeAt(int index) {
    final old = List<E>.from(value);
    final result = value.removeAt(index);
    notifyIfChanged(old);
    return result;
  }

  @override
  E removeLast() {
    final result = value.removeLast();
    notify();
    return result;
  }

  @override
  void removeRange(int start, int end) {
    final old = List<E>.from(value);
    value.removeRange(start, end);
    notifyIfChanged(old);
  }

  @override
  void removeWhere(bool Function(E element) test) {
    final old = List<E>.from(value);
    value.removeWhere(test);
    notifyIfChanged(old);
  }

  @override
  void replaceRange(int start, int end, Iterable<E> replacements) {
    final old = List<E>.from(value);
    value.replaceRange(start, end, replacements);
    notifyIfChanged(old);
  }

  @override
  void retainWhere(bool Function(E element) test) {
    final old = List<E>.from(value);
    value.retainWhere(test);
    notifyIfChanged(old);
  }

  @override
  Iterable<E> get reversed {
    return value.reversed;
  }

  @override
  void setAll(int index, Iterable<E> iterable) {
    final old = List<E>.from(value);
    value.setAll(index, iterable);
    notifyIfChanged(old);
  }

  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    final old = List<E>.from(value);
    value.setRange(start, end, iterable, skipCount);
    notifyIfChanged(old);
  }

  @override
  void shuffle([Random? random]) {
    value.shuffle(random);
    notify();
  }

  @override
  void sort([int Function(E a, E b)? compare]) {
    final old = List<E>.from(value);
    value.sort(compare);
    notifyIfChanged(old);
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
