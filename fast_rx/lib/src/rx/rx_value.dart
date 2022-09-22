import 'package:fast_rx/src/rx/rx_value_base.dart';

/// A reactive value
class RxValue<T> extends RxValueBase<T> {
  T _value;

  /// Create a reactive value
  RxValue(this._value);

  @override
  T get value {
    // If this is called in a FastBuilder, this will add the stream to the FastBuilder's observer
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

  @override
  void notify() {
    notifyWithValue(_value);
  }
}

/// Extension to allow creating reactive values
extension RxValueExtension<T> on T {
  /// Create a reactive value
  RxValue<T> get rx => RxValue<T>(this);
}
