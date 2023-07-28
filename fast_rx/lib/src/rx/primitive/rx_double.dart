import 'package:fast_rx/src/rx/primitive/rx_num.dart';

/// A reactive [double]
class RxDouble extends RxNum {
  /// Create a reactive [double]
  RxDouble(super.value);

  @override
  double get value => super.value as double;

  @override
  double remainder(num other) => value.remainder(other);

  @override
  double operator +(num other) => value + other;

  @override
  double operator -(num other) => value - other;

  @override
  double operator *(num other) => value * other;

  @override
  double operator %(num other) => value % other;

  @override
  double operator /(num other) => value / other;

  @override
  int operator ~/(num other) => value ~/ other;

  @override
  double operator -() => -value;

  @override
  double abs() => value.abs();

  @override
  double get sign => value.sign;

  @override
  int round() => value.round();

  @override
  int floor() => value.floor();

  @override
  int ceil() => value.ceil();

  @override
  int truncate() => value.truncate();

  @override
  double roundToDouble() => value.roundToDouble();

  @override
  double floorToDouble() => value.floorToDouble();

  @override
  double ceilToDouble() => value.ceilToDouble();

  @override
  double truncateToDouble() => value.truncateToDouble();

  @override
  num clamp(num lowerLimit, num upperLimit) =>
      value.clamp(lowerLimit, upperLimit);
}

/// Extension to allow creating reactive [double]s
extension RxDoubleExtension on double {
  /// Create a reactive [double]
  RxDouble get rx => RxDouble(this);
}
