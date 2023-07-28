import 'package:fast_rx/src/rx/primitive/rx_num.dart';

/// A reactive [int]
class RxInt extends RxNum {
  /// Create a reactive [int]
  RxInt(super.value);

  @override
  int get value => super.value as int;

  /// See the [int] documentation
  int operator &(int other) => other & value;

  /// See the [int] documentation
  int operator |(int other) => other | value;

  /// See the [int] documentation
  int operator ^(int other) => other ^ value;

  /// See the [int] documentation
  int operator ~() => ~value;

  /// See the [int] documentation
  int operator <<(int shiftAmount) => value << shiftAmount;

  /// See the [int] documentation
  int operator >>(int shiftAmount) => value >> shiftAmount;

  /// See the [int] documentation
  int operator >>>(int shiftAmount) => value >>> shiftAmount;

  /// See [int.modPow]
  int modPow(int exponent, int modulus) => value.modPow(exponent, modulus);

  /// See [int.modInverse]
  int modInverse(int modulus) => value.modInverse(modulus);

  /// See [int.gcd]
  int gcd(int other) => value.gcd(other);

  /// See [int.isEven]
  bool get isEven => value.isEven;

  /// See [int.isOdd]
  bool get isOdd => value.isOdd;

  /// See [int.bitLength]
  int get bitLength => value.bitLength;

  /// See [int.toUnsigned]
  int toUnsigned(int width) => value.toUnsigned(width);

  /// See [int.toSigned]
  int toSigned(int width) => value.toSigned(width);

  @override
  int operator -() => -value;

  @override
  int abs() => value.abs();

  @override
  int get sign => value.sign;

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

  /// See [int.toRadixString]
  String toRadixString(int radix) => value.toRadixString(radix);

  @override
  num operator %(num other) => value % other;

  @override
  num operator *(num other) => value * other;

  @override
  num operator +(num other) => value + other;

  @override
  num operator -(num other) => value - other;

  @override
  num clamp(num lowerLimit, num upperLimit) =>
      value.clamp(lowerLimit, upperLimit);

  @override
  num remainder(num other) => value.remainder(other);
}

/// Extension to allow creating reactive [int]s
extension RxIntExtension on int {
  /// Create a reactive [int]
  RxInt get rx => RxInt(this);
}
