import 'package:fast_rx/src/rx/rx.dart';
import 'package:flutter/foundation.dart';

/// An object that will properly emit updates when calling notify
abstract class RxObject<T> with Rx<T> {
  final T _value;

  /// Create a reactive object
  RxObject(this._value);

  @override
  @protected
  @mustCallSuper
  T get value {
    register();
    return _value;
  }

  /// Unused for RxObject
  @override
  @protected
  set value(T value) {
    throw UnimplementedError('RxObject.value is read only');
  }

  @override
  void notify() {
    notifyWithValue(copyValue());
  }

  /// Notify if [transform] changed the value such that [shouldNotify] returns true
  @protected
  U notifyIfChanged<U>(U Function() transform) {
    final old = copyValue();
    final result = transform();
    if (shouldNotify(old)) {
      notify();
    }
    return result;
  }

  /// Copy the value for update emission
  T copyValue();

  /// Check if the value has changed
  bool shouldNotify(T oldValue);
}
