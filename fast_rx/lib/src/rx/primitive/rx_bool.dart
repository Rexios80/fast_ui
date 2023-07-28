import 'package:fast_rx/fast_rx.dart';

/// A reactive [bool]
class RxBool extends RxValue<bool> {
  /// Create a reactive [bool]
  RxBool(super.value);

  /// See the [bool] documentation
  bool operator &(bool other) => other & value;

  /// See the [bool] documentation
  bool operator |(bool other) => other | value;

  /// See the [bool] documentation
  bool operator ^(bool other) => other ^ value;

  @override
  String toString() => value ? 'true' : 'false';
}

/// Extension to allow creating reactive [bool]s
extension RxBoolExtension on bool {
  /// Create a reactive [bool]
  RxBool get rx => RxBool(this);
}
