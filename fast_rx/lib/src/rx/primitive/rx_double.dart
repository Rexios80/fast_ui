import 'package:fast_rx/fast_rx.dart';

/// A reactive [double]
class RxDouble extends RxNum {
  /// Create a reactive [double]
  RxDouble(super.value);

  @override
  double get value => super.value as double;

  /// See [double.remainder]
  @override
  double remainder(num other) => value.remainder(other);

  /// See the [double] documentation
  @override
  double operator +(num other) => value + other;

  /// See the [double] documentation
  @override
  double operator -(num other) => value - other;

  /// See the [double] documentation
  @override
  double operator *(num other) => value * other;

  /// See the [double] documentation
  @override
  double operator %(num other) => value % other;

  /// See the [double] documentation
  @override
  double operator /(num other) => value / other;

  /// See the [double] documentation
  @override
  int operator ~/(num other) => value ~/ other;

  /// See the [double] documentation
  @override
  double operator -() => -value;

  /// See [double.abs]
  @override
  double abs() => value.abs();

  /// See [double.sign]
  @override
  double get sign => value.sign;

  /// See [double.round]
  @override
  int round() => value.round();

  /// See [double.floor]
  @override
  int floor() => value.floor();

  /// See [double.ceil]
  @override
  int ceil() => value.ceil();

  /// See [double.truncate]
  @override
  int truncate() => value.truncate();

  /// See [double.roundToDouble]
  @override
  double roundToDouble() => value.roundToDouble();

  /// See [double.floorToDouble]
  @override
  double floorToDouble() => value.floorToDouble();

  /// See [double.ceilToDouble]
  @override
  double ceilToDouble() => value.ceilToDouble();

  /// See [double.truncateToDouble]
  @override
  double truncateToDouble() => value.truncateToDouble();

  @override
  String toString() => value.toString();
}

/// Extension to allow creating reactive [double]s
extension RxDoubleExtension on double {
  /// Create a reactive [double]
  RxDouble get rx => RxDouble(this);
}
