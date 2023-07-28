import 'package:fast_rx/fast_rx.dart';

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

  /// See the [int] documentation
  int operator -() => -value;

  /// See [int.abs]
  @override
  int abs() => value.abs();

  /// See [int.sign]
  @override
  int get sign => value.sign;

  /// See [int.round]
  @override
  int round() => value.round();

  /// See [int.floor]
  @override
  int floor() => value.floor();

  /// See [int.ceil]
  @override
  int ceil() => value.ceil();

  /// See [int.truncate]
  @override
  int truncate() => value.truncate();

  /// See [int.roundToDouble]
  @override
  double roundToDouble() => value.roundToDouble();

  /// See [int.floorToDouble]
  @override
  double floorToDouble() => value.floorToDouble();

  /// See [int.ceilToDouble]
  @override
  double ceilToDouble() => value.ceilToDouble();

  /// See [int.truncateToDouble]
  @override
  double truncateToDouble() => value.truncateToDouble();

  @override
  String toString();

  /// See [int.toRadixString]
  String toRadixString(int radix) => value.toRadixString(radix);
}

/// Extension to allow creating reactive [int]s
extension RxIntExtension on int {
  /// Create a reactive [int]
  RxInt get rx => RxInt(this);
}
