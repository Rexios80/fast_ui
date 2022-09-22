import 'dart:async';
import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx/src/rx_notifier.dart';
import 'package:flutter/foundation.dart';

/// Base class for reactives
abstract class Rx<T> {
  static const _zonedKey = '_fast_rx_zoned_key';
  static const _zonedObjectKey = '_fast_rx_zoned_object_key';

  bool get _zoned {
    final isThis = Zone.current[_zonedObjectKey] == this;
    final zoned = Zone.current[_zonedKey] ?? false;
    return isThis && zoned;
  }

  final StreamController<T> _controller = StreamController.broadcast();

  /// Stream of value changes
  Stream<T> get stream => _controller.stream;

  /// Close the [stream] for testing
  @visibleForTesting
  void close() {
    _controller.close();
  }

  /// Register with the [RxNotifier] for UI updates
  @protected
  void register() {
    if (_zoned) return;
    RxNotifier.instance.addStream(stream);
  }

  /// Run [action] with registration and notifications disabled
  @protected
  @visibleForTesting
  void run(VoidCallback action) {
    runZoned(
      () {
        final result = action() as dynamic;
        if (result is Future) {
          throw RxRunActionWasAsync();
        }
      },
      zoneValues: {
        _zonedKey: true,
        _zonedObjectKey: this,
      },
    );
  }

  /// Notify listeners with the current value
  ///
  /// Useful if using objects that are out of your control. Consider wrapping
  /// the object in an [RxObject] if used frequently.
  void notify();

  /// Notify listeners with the given value
  ///
  /// This is used so that object reference reactives can emit updates properly
  @protected
  void notifyWithValue(T value) {
    if (_zoned) return;
    _controller.add(value);
  }
}
