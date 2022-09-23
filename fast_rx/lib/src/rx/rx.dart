import 'dart:async';
import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx/src/rx/rx_zone_keys.dart';
import 'package:fast_rx/src/rx_notifier.dart';
import 'package:flutter/foundation.dart';

/// Base class for reactives
abstract class Rx<T> {
  bool get _zoned => Zone.current[RxZoneKeys.zonedKey] ?? false;

  final StreamController<T> _controller = StreamController.broadcast();

  /// Stream of value changes
  @nonVirtual
  Stream<T> get stream => _controller.stream;

  /// Register with the [RxNotifier] for UI updates
  @protected
  void register() {
    if (_zoned) return;
    RxNotifier.instance.addStream(stream);
  }

  /// Run [action] with registration and notifications disabled. Will notify
  /// after [action] is completed if [notify] is true and the child
  /// implementation decides a notification should be sent.
  ///
  /// Returns true if a notification was attempted during [action]
  @protected
  bool run(VoidCallback action, {bool notify = true}) {
    var notified = false;
    runZoned(
      () {
        final result = action() as dynamic;
        if (result is Future) {
          throw RxRunActionWasAsync();
        }
      },
      zoneValues: {
        RxZoneKeys.zonedKey: true,
        RxZoneKeys.notifierKey: () => notified = true,
      },
    );
    return notified;
  }

  /// Notify listeners with the current value
  ///
  /// Useful if using objects that are out of your control. Consider wrapping
  /// the object in an [RxObject] if used frequently.
  ///
  /// Child classes should implement a call to [notifyWithValue]
  void notify();

  /// Notify listeners with the given value
  @protected
  @nonVirtual
  void notifyWithValue(T value) {
    if (_zoned) {
      Zone.current[RxZoneKeys.notifierKey].call();
      return;
    }
    _controller.add(value);
  }
}

/// A reactive value
class RxValue<T> extends Rx<T> {
  T _value;

  /// Create a reactive value
  RxValue(this._value);

  /// The current value
  ///
  /// Using this in a FastBuilder will cause a rebuild when the value changes
  T get value {
    // If this is called in a FastBuilder, this will add the stream to the FastBuilder's observer
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

  /// Set the current value
  ///
  /// Will notify listeners if the value has changed
  set value(T value) {
    if (_value != value) {
      _value = value;
      notify();
    }
  }

  @override
  void notify() {
    notifyWithValue(_value);
  }

  // Override [Object] methods so that they call [register]
  @override
  bool operator ==(Object other) {
    return value == other;
  }

  @override
  int get hashCode {
    // This can't change, so we don't need to register here
    return unregisteredValue.hashCode;
  }

  @override
  String toString() {
    return value.toString();
  }

  @override
  Type get runtimeType {
    // This can't change, so we don't need to register here
    return unregisteredValue.runtimeType;
  }
}

/// Extension to allow creating reactive values
extension RxValueExtension<T> on T {
  /// Create a reactive value
  RxValue<T> get rx => RxValue<T>(this);
}

/// An object that will properly emit updates when calling notify
///
/// Useful for creating reactive versions of objects you don't control. If an
/// object is in your control, consider making fields that need to be updated
/// reactive instead.
abstract class RxObject<T> extends RxValue<T> {
  /// Create a reactive object
  RxObject(super.value);

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
    return super.value;
  }

  // coverage:ignore-start
  /// Unused for RxObject
  @override
  @protected
  @nonVirtual
  set value(T value) {
    throw RxObjectValueIsReadOnly();
  }
  // coverage:ignore-end

  /// Internal setter for [_value]. Should only be used in Rx extensions and
  /// never externally. Does not notify. If used properly, the warning for
  /// using a protected member can be safely ignored.
  ///
  /// Example: Used by fast_rx_persistence to set [_value] from a key/value
  /// store after initialization
  @protected
  @nonVirtual
  void internalSetValue(T value) {
    _value = value;
  }

  @override
  bool run(VoidCallback action, {bool notify = true}) {
    final bool notified;
    if (notify) {
      notified = notifyIfChanged(() => super.run(action, notify: notify));
    } else {
      notified = super.run(action);
    }
    return notified;
  }

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
