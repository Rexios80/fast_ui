import 'dart:async';

import 'package:collection/collection.dart';
import 'package:fast_state/src/rx/rx.dart';
import 'package:fast_state/src/rx_notifier.dart';
import 'package:flutter/foundation.dart';

/// An observable list
class RxList<T> extends DelegatingList<T> implements Rx<List<T>> {
  @override
  StreamController<List<T>> get controller => StreamController.broadcast();

  /// Create an observable list
  RxList(List<T> list) : super(list);

  @override
  @protected
  List<T> get value {
    RxNotifier.addStream(controller.stream);
    return this;
  }

  @override
  @protected
  set value(List<T> value) {}

  @override
  StreamSubscription<List<T>> listen(void Function(List<T>) onChanged) {
    return controller.stream.listen(onChanged);
  }

  @override
  void notify() {
    controller.add(this);
  }

  // List methods

  @override
  operator [](int index) {
    RxNotifier.addStream(controller.stream);
    return super[index];
  }

  @override
  operator []=(int index, T value) {
    final old = List.from(this);
    super[index] = value;
    if (old != this) {
      notify();
    }
  }

  @override
  void add(T value) {
    super.add(value);
    notify();
  }

  @override
  void addAll(Iterable<T> iterable) {
    super.addAll(iterable);
    notify();
  }

  @override
  void insert(int index, T element) {
    super.insert(index, element);
  }

  @override
  bool remove(Object? value) {
    final result = super.remove(value);
    notify();
    return result;
  }

  @override
  void clear() {
    super.clear();
    notify();
  }
}

/// Extension to allow creating reactive objects for lists
extension RxListExtension<T> on List<T> {
  /// Create an observable list
  RxList<T> get rx => RxList<T>(this);
}
