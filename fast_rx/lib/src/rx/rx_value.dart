import 'package:fast_rx/src/rx/rx.dart';

/// A reactive value
class RxValue<T> with Rx<T> {
  T _value;

  /// Create a reactive value
  RxValue(this._value);

  @override
  T get value {
    // If this is called in a Widget build method, this will add the stream to the widget's observer
    register();
    return _value;
  }

  @override
  set value(T value) {
    if (_value != value) {
      _value = value;
      notify();
    }
  }
}

/// Extension to allow creating reactive values
extension RxExtension<T> on T {
  /// Create a reactive value
  RxValue<T> get rx => RxValue<T>(this);
}
