import 'dart:async';

import 'package:fast_state/src/rx_notifier.dart';
import 'package:flutter/foundation.dart';

/// Reactive object
class Rx<T> {
  /// The stream controller
  @visibleForTesting
  final StreamController<T> controller = StreamController.broadcast();

  T _value;

  /// Create a reacive object
  Rx(this._value);

  /// The current value
  ///
  /// Using this in a Widget will cause the Widget to rebuild when the value changes
  T get value {
    // If this is called in a Widget build method, this will add the stream to the widget's observer
    RxNotifier.addStream(controller.stream);
    return _value;
  }

  /// Set the current value
  ///
  /// Will notify listeners if the value has changed
  set value(T value) {
    if (_value != value) {
      _value = value;
      notify();
    }
  }

  /// Listen to value changes
  StreamSubscription<T> listen(void Function(T) onChanged) {
    return controller.stream.listen(onChanged);
  }

  /// Notify listeners with the current value
  ///
  /// Useful if using custom objects
  void notify() {
    controller.add(_value);
  }
}

/// Extension to allow creating reactive objects for any type
extension RxExtension<T> on T {
  /// Get an observable version of this object
  Rx<T> get rx => Rx<T>(this);
}
