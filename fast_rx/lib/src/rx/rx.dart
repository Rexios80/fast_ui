import 'dart:async';
import 'package:fast_rx/src/rx_notifier.dart';
import 'package:flutter/foundation.dart';

/// Reactive object
abstract class Rx<T> {
  /// The stream controller
  @protected
  @visibleForTesting
  final StreamController<T> controller = StreamController.broadcast();

  /// Register with the [RxNotifier]
  @protected
  void register() {
    RxNotifier.addStream(controller.stream);
  }

  /// The current value
  ///
  /// Using this in a Widget will cause the Widget to rebuild when the value changes
  T get value;

  /// Set the current value
  ///
  /// Will notify listeners if the value has changed
  set value(T value);

  /// Listen to value changes
  StreamSubscription<T> listen(void Function(T) onChanged) {
    return controller.stream.listen(onChanged);
  }

  /// Notify listeners with the current value
  ///
  /// Useful if using custom objects
  void notify() {
    controller.add(value);
  }

  /// Notify if the value has changed
  @protected
  void notifyIfChanged(T old) {
    if (old != value) {
      notify();
    }
  }
}
