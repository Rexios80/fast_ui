import 'package:fast_rx/fast_rx.dart';

/// A reactive [num]
abstract class RxNum extends RxValue<num> implements Comparable<num> {
  /// Create a reactive [num]
  RxNum(super.value);

  @override
  int compareTo(num other) => value.compareTo(other);

  /// See the [num] documentation
  num operator +(num other);

  /// See the [num] documentation
  num operator -(num other);

  /// See the [num] documentation
  num operator *(num other);

  /// See the [num] documentation
  num operator %(num other);

  /// See the [num] documentation
  double operator /(num other) => value / other;

  /// See the [num] documentation
  int operator ~/(num other) => value ~/ other;

  /// See the [num] documentation
  num operator -();

  /// See [num.remainder]
  num remainder(num other);

  /// See the [num] documentation
  bool operator <(num other) => value < other;

  /// See the [num] documentation
  bool operator <=(num other) => value <= other;

  /// See the [num] documentation
  bool operator >(num other) => value > other;

  /// See the [num] documentation
  bool operator >=(num other) => value >= other;

  /// See [num.isNan]
  bool get isNaN => value.isNaN;

  /// See [num.isNegative]
  bool get isNegative => value.isNegative;

  /// See [num.isInfinite]
  bool get isInfinite => value.isInfinite;

  /// See [num.isFinite]
  bool get isFinite => value.isFinite;

  /// See [num.abs]
  num abs();

  /// See [num.sign]
  num get sign;

  /// See [num.round]
  int round() => value.round();

  /// See [num.floor]
  int floor() => value.floor();

  /// See [num.ceil]
  int ceil() => value.ceil();

  /// See [num.truncate]
  int truncate() => value.truncate();

  /// See [num.roundToDouble]
  double roundToDouble() => value.roundToDouble();

  /// See [num.floorToDouble]
  double floorToDouble() => value.floorToDouble();

  /// See [num.ceilToDouble]
  double ceilToDouble() => value.ceilToDouble();

  /// See [num.truncateToDouble]
  double truncateToDouble() => value.truncateToDouble();

  /// See [num.clamp]
  num clamp(num lowerLimit, num upperLimit) =>
      value.clamp(lowerLimit, upperLimit);

  /// See [num.compareTo]
  int toInt() => value.toInt();

  /// See [num.toDouble]
  double toDouble() => value.toDouble();

  /// See [num.toStringAsFixed]
  String toStringAsFixed(int fractionDigits) =>
      value.toStringAsFixed(fractionDigits);

  /// See [num.toStringAsExponential]
  String toStringAsExponential([int? fractionDigits]) =>
      value.toStringAsExponential(fractionDigits);

  /// See [num.toStringAsPrecision]
  String toStringAsPrecision(int precision) =>
      value.toStringAsPrecision(precision);
}
