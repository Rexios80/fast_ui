import 'dart:math';

import 'package:fast_rx/src/rx/rx_iterable.dart';

/// A reactive list
class RxList<E> extends RxIterable<E> implements List<E> {
  final List<E> _list;

  /// Create a reactive list
  RxList(this._list);

  @override
  List<R> cast<R>() {
    register();
    return _list.cast<R>();
  }

  @override
  List<E> operator +(List<E> other) {
    register();
    return _list + other;
  }

  @override
  E operator [](int index) {
    register();
    return _list[index];
  }

  @override
  void operator []=(int index, E value) {
    final old = List<E>.from(this);
    _list[index] = value;
    notifyIfChanged(old);
  }

  @override
  void add(E value) {
    _list.add(value);
    notify();
  }

  @override
  void addAll(Iterable<E> iterable) {
    final old = List<E>.from(this);
    _list.addAll(iterable);
    notifyIfChanged(old);
  }

  @override
  Map<int, E> asMap() {
    register();
    return _list.asMap();
  }

  @override
  void clear() {
    final old = List<E>.from(this);
    _list.clear();
    notifyIfChanged(old);
  }

  @override
  void fillRange(int start, int end, [E? fillValue]) {
    final old = List<E>.from(this);
    _list.fillRange(start, end, fillValue);
    notifyIfChanged(old);
  }

  @override
  set first(E value) {
    final old = List<E>.from(this);
    _list.first = value;
    notifyIfChanged(old);
  }

  @override
  Iterable<E> getRange(int start, int end) {
    register();
    return _list.getRange(start, end);
  }

  @override
  int indexOf(E element, [int start = 0]) {
    register();
    return _list.indexOf(element, start);
  }

  @override
  int indexWhere(bool Function(E element) test, [int start = 0]) {
    register();
    return _list.indexWhere(test, start);
  }

  @override
  void insert(int index, E element) {
    final old = List<E>.from(this);
    _list.insert(index, element);
    notifyIfChanged(old);
  }

  @override
  void insertAll(int index, Iterable<E> iterable) {
    final old = List<E>.from(this);
    _list.insertAll(index, iterable);
    notifyIfChanged(old);
  }

  @override
  set last(E value) {
    final old = List<E>.from(this);
    _list.last = value;
    notifyIfChanged(old);
  }

  @override
  int lastIndexOf(E element, [int? start]) {
    register();
    return _list.lastIndexOf(element, start);
  }

  @override
  int lastIndexWhere(bool Function(E element) test, [int? start]) {
    register();
    return _list.lastIndexWhere(test, start);
  }

  @override
  set length(int newLength) {
    final old = List<E>.from(this);
    _list.length = newLength;
    notifyIfChanged(old);
  }

  @override
  bool remove(Object? value) {
    final old = List<E>.from(this);
    final result = _list.remove(value);
    notifyIfChanged(old);
    return result;
  }

  @override
  E removeAt(int index) {
    final old = List<E>.from(this);
    final result = _list.removeAt(index);
    notifyIfChanged(old);
    return result;
  }

  @override
  E removeLast() {
    final result = _list.removeLast();
    notify();
    return result;
  }

  @override
  void removeRange(int start, int end) {
    final old = List<E>.from(this);
    _list.removeRange(start, end);
    notifyIfChanged(old);
  }

  @override
  void removeWhere(bool Function(E element) test) {
    final old = List<E>.from(this);
    _list.removeWhere(test);
    notifyIfChanged(old);
  }

  @override
  void replaceRange(int start, int end, Iterable<E> replacements) {
    final old = List<E>.from(this);
    _list.replaceRange(start, end, replacements);
    notifyIfChanged(old);
  }

  @override
  void retainWhere(bool Function(E element) test) {
    final old = List<E>.from(this);
    _list.retainWhere(test);
    notifyIfChanged(old);
  }

  @override
  Iterable<E> get reversed {
    register();
    return _list.reversed;
  }

  @override
  void setAll(int index, Iterable<E> iterable) {
    final old = List<E>.from(this);
    _list.setAll(index, iterable);
    notifyIfChanged(old);
  }

  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    final old = List<E>.from(this);
    _list.setRange(start, end, iterable, skipCount);
    notifyIfChanged(old);
  }

  @override
  void shuffle([Random? random]) {
    _list.shuffle(random);
    notify();
  }

  @override
  void sort([int Function(E a, E b)? compare]) {
    final old = List<E>.from(this);
    _list.sort(compare);
    notifyIfChanged(old);
  }

  @override
  List<E> sublist(int start, [int? end]) {
    register();
    return _list.sublist(start, end);
  }
}

/// Extension to allow creating reactive lists
extension RxListExtension<T> on List<T> {
  /// Create a reactive list
  RxList<T> get rx => RxList<T>(this);
}
