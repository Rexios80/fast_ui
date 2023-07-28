import 'package:fast_rx/fast_rx.dart';

/// A reactive [double]
class RxDouble extends RxValue<double> {
  /// Create a reactive [double]
  RxDouble(super.value);

  /// See [double.remainder]
  double remainder(num other) => value.remainder(other);

  /// See the [double] documentation
  double operator +(num other) => value + other;

  /// See the [double] documentation
  double operator -(num other) => value - other;

  /// See the [double] documentation
  double operator *(num other) => value * other;

  /// See the [double] documentation
  double operator %(num other) => value % other;

  /// See the [double] documentation
  double operator /(num other) => value / other;

  /// See the [double] documentation
  int operator ~/(num other) => value ~/ other;

  /// See the [double] documentation
  double operator -() => -value;

  /// See [double.abs]
  double abs() => value.abs();

  /// See [double.sign]
  double get sign => value.sign;

  /// See [double.round]
  int round() => value.round();

  /// See [double.floor]
  int floor() => value.floor();

  /// See [double.ceil]
  int ceil() => value.ceil();

  /// See [double.truncate]
  int truncate() => value.truncate();

  /// See [double.roundToDouble]
  double roundToDouble() => value.roundToDouble();

  /// See [double.floorToDouble]
  double floorToDouble() => value.floorToDouble();

  /// See [double.ceilToDouble]
  double ceilToDouble() => value.ceilToDouble();

  /// See [double.truncateToDouble]
  double truncateToDouble() => value.truncateToDouble();

  @override
  String toString() => value.toString();
}

/// Extension to allow creating reactive [double]s
extension RxDoubleExtension on double {
  /// Create a reactive [double]
  RxDouble get rx => RxDouble(this);
}
