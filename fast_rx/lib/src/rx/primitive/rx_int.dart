import 'package:fast_rx/fast_rx.dart';

/// A reactive [int]
class RxInt extends RxValue<int> {
  /// Create a reactive [int]
  RxInt(super.value);

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
  int abs() => value.abs();

  /// See [int.sign]
  int get sign => value.sign;

  /// See [int.round]
  int round() => value.round();

  /// See [int.floor]
  int floor() => value.floor();

  /// See [int.ceil]
  int ceil() => value.ceil();

  /// See [int.truncate]
  int truncate() => value.truncate();

  /// See [int.roundToDouble]
  double roundToDouble() => value.roundToDouble();

  /// See [int.floorToDouble]
  double floorToDouble() => value.floorToDouble();

  /// See [int.ceilToDouble]
  double ceilToDouble() => value.ceilToDouble();

  /// See [int.truncateToDouble]
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
