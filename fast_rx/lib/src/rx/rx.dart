import 'dart:async';
import 'package:fast_rx/src/rx_notifier.dart';
import 'package:flutter/foundation.dart';

/// Reactive object
abstract class Rx<T> {
  final StreamController<T> _controller = StreamController.broadcast();

  /// Stream of value changes
  Stream<T> get stream => _controller.stream;

  /// Register with the [RxNotifier] for UI updates
  @protected
  void register() {
    RxNotifier.addStream(stream);
  }

  /// The current value
  ///
  /// Using this in a FastBuilder will cause a rebuild when the value changes
  T get value;

  /// Set the current value
  ///
  /// Will notify listeners if the value has changed
  set value(T value);

  /// Notify listeners with the current value
  ///
  /// Useful if using custom objects
  void notify() {
    _controller.add(value);
  }

  /// Notify listeners with the given value
  ///
  /// This is used so that object reference reactives can emit updates properly
  @protected
  void notifyWithValue(T value) {
    _controller.add(value);
  }

  /// Notify if the value has changed
  @protected
  void notifyIfChanged(T old) {
    if (old != value) {
      notify();
    }
  }

  // Override [Object] methods so that they call [register]

  @override
  bool operator ==(Object other) {
    return value == other;
  }

  @override
  int get hashCode {
    return value.hashCode;
  }

  @override
  String toString() {
    return value.toString();
  }

  @override
  Type get runtimeType {
    return value.runtimeType;
  }
}
