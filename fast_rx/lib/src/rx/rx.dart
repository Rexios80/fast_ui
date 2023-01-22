import 'dart:async';
import 'package:fast_rx/fast_rx.dart';

/// Base class for reactives
abstract class Rx<T> {
  final StreamController<T> _controller = StreamController.broadcast();

  /// Stream of value changes
  Stream<T> get stream => _controller.stream;

  /// Register with the current zone's [RxRegistrar] if it exists
  ///
  /// Should not be called directly
  void register() {
    RxZone.current.registrar?.call(stream);
  }

  /// Run [action] with registration and notifications disabled. Will notify
  /// after [action] is completed if [notify] is true and the child
  /// implementation decides a notification should be sent.
  ///
  /// Returns true if a notification was attempted during [action]
  bool run(RxAction action, {bool notify = true}) {
    var notified = false;
    runRxZoned(
      () {
        final result = action() as dynamic;
        if (result is Future) {
          throw RxRunActionWasAsync();
        }
      },
      notifier: (id) => notified = true,
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
  ///
  /// Should not be called directly
  void notifyWithValue(T value) {
    final notifier = RxZone.current.notifier;
    if (notifier != null) {
      notifier(identityHashCode(this));
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
  /// Should not be called directly
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

  /// Returns true if both [RxValue] [value]s are equal
  ///
  /// Will register both objects
  @override
  bool operator ==(Object other) {
    return other is RxValue && value == other.value;
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

  /// Get the current value and register with the current zone's [RxRegistrar]
  ///
  /// Should only be used in methods that return a value.
  /// Otherwise, use [unregisteredValue].
  ///
  /// Should not be called directly
  @override
  T get value {
    return super.value;
  }

  // coverage:ignore-start
  /// Unused for RxObject
  @override
  set value(T value) {
    throw RxObjectValueIsReadOnly();
  }
  // coverage:ignore-end

  /// Internal setter for [_value]. Should only be used in Rx extensions and
  /// never externally. Does not notify.
  ///
  /// Example: Used by fast_rx_persistence to set [_value] from a key/value
  /// store after initialization
  ///
  /// Should not be called directly
  void internalSetValue(T value) {
    _value = value;
  }

  @override
  bool run(RxAction action, {bool notify = true}) {
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
  ///
  /// Should not be called directly
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
  /// Should not be called directly
  T copyValue();

  /// Check if the value has changed
  ///
  /// Should not be called directly
  bool shouldNotify(T oldValue);
}
