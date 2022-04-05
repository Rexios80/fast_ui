import 'package:fast_rx/src/exceptions.dart';
import 'package:fast_rx/src/rx/rx.dart';
import 'package:flutter/foundation.dart';

/// An object that will properly emit updates when calling notify
///
/// Useful for creating reactive versions of objects you don't control. If an
/// object is in your control, consider making fields that need to be updated
/// reactive instead.
abstract class RxObject<T> with Rx<T> {
  final T _value;

  /// Create a reactive object
  RxObject(this._value);

  /// Get the current value and register with the RxNotifier
  ///
  /// Should only be used in methods that return a value.
  /// Otherwise, use [unregisteredValue].
  ///
  /// Overrides should be annotated with `@protected`
  @override
  @protected
  @mustCallSuper
  T get value {
    register();
    return _value;
  }

  /// Read the current value without calling [register]
  ///
  /// Used to prevent unnecessary calls to [register] in internal methods such
  /// as [copyValue], [shouldNotify], or methods that do not return a value
  ///
  /// Overrides should be annotated with `@protected`
  @protected
  T get unregisteredValue => _value;

  // coverage:ignore-start
  /// Unused for RxObject
  @override
  @nonVirtual
  set value(T value) {
    throw RxObjectValueIsReadOnly();
  }
  // coverage:ignore-end

  @override
  void notify() {
    notifyWithValue(copyValue());
  }

  /// Notify if [transform] changed the value such that [shouldNotify] returns true
  ///
  /// If the value is guaranteed to change, use [notify] instead
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
  ///
  /// Overrides should be annotated with `@protected`
  @protected
  @visibleForTesting
  T copyValue();

  /// Check if the value has changed
  ///
  /// Overrides should be annotated with `@protected`
  @protected
  @visibleForTesting
  bool shouldNotify(T oldValue);
}
