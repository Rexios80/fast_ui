import 'package:fast_rx/src/rx/rx.dart';

/// Base class for [RxValue] and [RxObject]
abstract class RxValueBase<T> extends Rx<T> {
  /// The current value
  ///
  /// Using this in a FastBuilder will cause a rebuild when the value changes
  T get value;

  /// Set the current value
  ///
  /// Will notify listeners if the value has changed
  set value(T value);

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
