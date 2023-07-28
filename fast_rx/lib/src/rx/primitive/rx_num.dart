import 'package:fast_rx/fast_rx.dart';

/// A reactive [num]
abstract class RxNum extends RxValue<num> implements Comparable<num> {
  /// Create a reactive [num]
  RxNum(super.value);

  int compareTo(num other);

  num operator +(num other);
  num operator -(num other);

  num operator *(num other);

  num operator %(num other);

  double operator /(num other);

  int operator ~/(num other);

  num operator -();

  num remainder(num other);

  bool operator <(num other);

  bool operator <=(num other);

  bool operator >(num other);

  bool operator >=(num other);

  bool get isNaN;

  bool get isNegative;

  bool get isInfinite;

  bool get isFinite;

  num abs();

  num get sign;

  int round();

  int floor();

  int ceil();

  int truncate();

  double roundToDouble();

  double floorToDouble();

  double ceilToDouble();

  double truncateToDouble();

  num clamp(num lowerLimit, num upperLimit);

  int toInt();

  double toDouble();

  String toStringAsFixed(int fractionDigits);

  String toStringAsExponential([int? fractionDigits]);

  String toStringAsPrecision(int precision);

  String toString();
}
