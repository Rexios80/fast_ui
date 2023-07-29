import 'package:fast_rx/fast_rx.dart';

/// A reactive [DateTime]
class RxDateTime extends RxPrimitive<DateTime> implements DateTime {
  /// Create a reactive [DateTime]
  RxDateTime(super.value);

  @override
  DateTime add(Duration duration) => value.add(duration);

  @override
  int compareTo(DateTime other) => value.compareTo(other);

  @override
  int get day => value.day;

  @override
  Duration difference(DateTime other) => value.difference(other);

  @override
  int get hour => value.hour;

  @override
  bool isAfter(DateTime other) => value.isAfter(other);

  @override
  bool isAtSameMomentAs(DateTime other) => value.isAtSameMomentAs(other);

  @override
  bool isBefore(DateTime other) => value.isBefore(other);

  @override
  bool get isUtc => value.isUtc;

  @override
  int get microsecond => value.microsecond;

  @override
  int get microsecondsSinceEpoch => value.microsecondsSinceEpoch;

  @override
  int get millisecond => value.millisecond;

  @override
  int get millisecondsSinceEpoch => value.millisecondsSinceEpoch;

  @override
  int get minute => value.minute;

  @override
  int get month => value.month;

  @override
  int get second => value.second;

  @override
  DateTime subtract(Duration duration) => value.subtract(duration);

  @override
  String get timeZoneName => value.timeZoneName;

  @override
  Duration get timeZoneOffset => value.timeZoneOffset;

  @override
  String toIso8601String() => value.toIso8601String();

  @override
  DateTime toLocal() => value.toLocal();

  @override
  DateTime toUtc() => value.toUtc();

  @override
  int get weekday => value.weekday;

  @override
  int get year => value.year;
}

/// Extension to allow creating reactive [DateTime]s
extension RxDateTimeExtension on DateTime {
  /// Create a reactive [DateTime]
  RxDateTime get rx => RxDateTime(this);
}
