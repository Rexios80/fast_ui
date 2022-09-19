import 'dart:async';
import 'package:fast_rx/src/rx_notifier.dart';
import 'package:flutter/foundation.dart';

/// Base class for reactives
abstract class Rx<T> {
  /// Key for getting the [_zonedKey] value from the current [Zone]
  static const _zonedKey = 'zoned';

  bool get _zoned => Zone.current[_zonedKey] ?? false;

  final StreamController<T> _controller = StreamController.broadcast();

  /// Stream of value changes
  Stream<T> get stream => _controller.stream;

  /// Register with the [RxNotifier] for UI updates
  @protected
  void register() {
    if (_zoned) return;
    RxNotifier.instance.addStream(stream);
  }

  /// The current value
  ///
  /// Using this in a FastBuilder will cause a rebuild when the value changes
  T get value;

  /// Set the current value
  ///
  /// Will notify listeners if the value has changed
  set value(T value);

  /// Run [action] with registration and notifications disabled
  @protected
  void run(VoidCallback action) {
    runZoned(action, zoneValues: {_zonedKey: false});
  }

  /// Notify listeners with the current value
  ///
  /// Useful if using objects that are out of your control. Consider wrapping
  /// the object in an RxObject if used frequently.
  void notify() {
    if (_zoned) return;
    _controller.add(value);
  }

  /// Notify listeners with the given value
  ///
  /// This is used so that object reference reactives can emit updates properly
  @protected
  void notifyWithValue(T value) {
    if (_zoned) return;
    _controller.add(value);
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
