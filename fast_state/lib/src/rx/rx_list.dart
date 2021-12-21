import 'dart:math';

import 'package:fast_state/src/rx/rx_iterable.dart';

/// A reactive list
class RxList<E> extends RxIterable<E> implements List<E> {
  @override
  final List<E> value;

  /// Create a reactive list
  RxList(this.value);

  @override
  List<E> operator +(List<E> other) {
    // TODO: implement +
    throw UnimplementedError();
  }

  @override
  E operator [](int index) {
    // TODO: implement []
    throw UnimplementedError();
  }

  @override
  void operator []=(int index, E value) {
    // TODO: implement []=
  }

  @override
  void add(E value) {
    // TODO: implement add
  }

  @override
  void addAll(Iterable<E> iterable) {
    // TODO: implement addAll
  }

  @override
  Map<int, E> asMap() {
    // TODO: implement asMap
    throw UnimplementedError();
  }

  @override
  void clear() {
    // TODO: implement clear
  }

  @override
  void fillRange(int start, int end, [E? fillValue]) {
    // TODO: implement fillRange
  }

  @override
  set first(E value) {
    // TODO: implement first
  }

  @override
  Iterable<E> getRange(int start, int end) {
    // TODO: implement getRange
    throw UnimplementedError();
  }

  @override
  int indexOf(E element, [int start = 0]) {
    // TODO: implement indexOf
    throw UnimplementedError();
  }

  @override
  int indexWhere(bool Function(E element) test, [int start = 0]) {
    // TODO: implement indexWhere
    throw UnimplementedError();
  }

  @override
  void insert(int index, E element) {
    // TODO: implement insert
  }

  @override
  void insertAll(int index, Iterable<E> iterable) {
    // TODO: implement insertAll
  }

  @override
  set last(E value) {
    // TODO: implement last
  }

  @override
  int lastIndexOf(E element, [int? start]) {
    // TODO: implement lastIndexOf
    throw UnimplementedError();
  }

  @override
  int lastIndexWhere(bool Function(E element) test, [int? start]) {
    // TODO: implement lastIndexWhere
    throw UnimplementedError();
  }

  @override
  set length(int newLength) {
    // TODO: implement length
  }

  @override
  bool remove(Object? value) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  E removeAt(int index) {
    // TODO: implement removeAt
    throw UnimplementedError();
  }

  @override
  E removeLast() {
    // TODO: implement removeLast
    throw UnimplementedError();
  }

  @override
  void removeRange(int start, int end) {
    // TODO: implement removeRange
  }

  @override
  void removeWhere(bool Function(E element) test) {
    // TODO: implement removeWhere
  }

  @override
  void replaceRange(int start, int end, Iterable<E> replacements) {
    // TODO: implement replaceRange
  }

  @override
  void retainWhere(bool Function(E element) test) {
    // TODO: implement retainWhere
  }

  @override
  // TODO: implement reversed
  Iterable<E> get reversed => throw UnimplementedError();

  @override
  void setAll(int index, Iterable<E> iterable) {
    // TODO: implement setAll
  }

  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    // TODO: implement setRange
  }

  @override
  void shuffle([Random? random]) {
    // TODO: implement shuffle
  }

  @override
  void sort([int Function(E a, E b)? compare]) {
    // TODO: implement sort
  }

  @override
  List<E> sublist(int start, [int? end]) {
    // TODO: implement sublist
    throw UnimplementedError();
  }

  @override
  set value(Iterable<E> value) {
    // TODO: implement value
  }
}

/// Extension to allow creating reactive lists
extension RxListExtension<T> on List<T> {
  /// Create a reactive list
  RxList<T> get rx => RxList<T>(this);
}
