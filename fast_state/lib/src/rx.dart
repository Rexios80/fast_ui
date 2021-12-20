import 'dart:async';

import 'package:fast_state/src/rx_notifier.dart';

/// Reactive object
class Rx<T> {
  T _value;

  final StreamController<T> _controller = StreamController<T>.broadcast();

  /// The current value
  ///
  /// Using this in a Widget will cause the Widget to rebuild when the value changes
  T get value {
    // If this is called in a Widget build method, this will add the stream to the widget's observer
    RxNotifier.addStream(_controller.stream);
    return _value;
  }

  /// Set the current value
  ///
  /// Will notify listeners if the value has changed
  set value(T value) {
    if (_value != value) {
      _value = value;
      _controller.add(value);
    }
  }

  /// Listen to value changes
  StreamSubscription<T> listen(void Function(T) onChanged) {
    return _controller.stream.listen(onChanged);
  }

  /// Create a reacive object
  Rx(this._value);
}

/// Extension to allow creating reactive objects for any type
extension RxObjectExtension<T> on T {
  /// Get an observable version of this object
  Rx<T> get rx => Rx<T>(this);
}
