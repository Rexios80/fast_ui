import 'package:fast_rx/fast_rx.dart';

/// A reactive [Duration]
class RxDuration extends RxPrimitive<Duration> implements Duration {
  /// Create a reactive [Duration]
  RxDuration(super.value);

  @override
  Duration operator *(num factor) => value * factor;

  @override
  Duration operator +(Duration other) => value + other;

  @override
  Duration operator -() => -value;

  @override
  Duration operator -(Duration other) => value - other;

  @override
  bool operator <(Duration other) => value < other;

  @override
  bool operator <=(Duration other) => value <= other;

  @override
  bool operator >(Duration other) => value > other;

  @override
  bool operator >=(Duration other) => value >= other;

  @override
  Duration abs() => value.abs();

  @override
  int compareTo(Duration other) => value.compareTo(other);

  @override
  int get inDays => value.inDays;

  @override
  int get inHours => value.inHours;

  @override
  int get inMicroseconds => value.inMicroseconds;

  @override
  int get inMilliseconds => value.inMilliseconds;

  @override
  int get inMinutes => value.inMinutes;

  @override
  int get inSeconds => value.inSeconds;

  @override
  bool get isNegative => value.isNegative;

  @override
  Duration operator ~/(int quotient) => value ~/ quotient;
}

/// Extension to allow creating reactive [Duration]s
extension RxDurationExtension on Duration {
  /// Create a reactive [DateTime]
  RxDuration get rx => RxDuration(this);
}
