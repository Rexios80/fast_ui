// This is a test
// ignore_for_file: invalid_use_of_protected_member

import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:test/test.dart';

void main() {
  final shouldRegister = <RxTest<RxDateTime>>[
    RxTest(
      () => DateTime.timestamp().rx,
      (rx) => rx.add(const Duration(seconds: 1)),
    ),
    RxTest(
      () => DateTime.timestamp().rx,
      (rx) => rx.compareTo(DateTime.timestamp()),
    ),
    RxTest(() => DateTime.timestamp().rx, (rx) => rx.day),
    RxTest(
      () => DateTime.timestamp().rx,
      (rx) => rx.difference(DateTime.timestamp()),
    ),
    RxTest(() => DateTime.timestamp().rx, (rx) => rx.hour),
    RxTest(
      () => DateTime.timestamp().rx,
      (rx) => rx.isAfter(DateTime.timestamp()),
    ),
    RxTest(
      () => DateTime.timestamp().rx,
      (rx) => rx.isAtSameMomentAs(DateTime.timestamp()),
    ),
    RxTest(
      () => DateTime.timestamp().rx,
      (rx) => rx.isBefore(DateTime.timestamp()),
    ),
    RxTest(() => DateTime.timestamp().rx, (rx) => rx.isUtc),
    RxTest(() => DateTime.timestamp().rx, (rx) => rx.microsecond),
    RxTest(() => DateTime.timestamp().rx, (rx) => rx.microsecondsSinceEpoch),
    RxTest(() => DateTime.timestamp().rx, (rx) => rx.millisecond),
    RxTest(() => DateTime.timestamp().rx, (rx) => rx.millisecondsSinceEpoch),
    RxTest(() => DateTime.timestamp().rx, (rx) => rx.minute),
    RxTest(() => DateTime.timestamp().rx, (rx) => rx.month),
    RxTest(() => DateTime.timestamp().rx, (rx) => rx.second),
    RxTest(
      () => DateTime.timestamp().rx,
      (rx) => rx.subtract(const Duration(seconds: 1)),
    ),
    RxTest(() => DateTime.timestamp().rx, (rx) => rx.timeZoneName),
    RxTest(() => DateTime.timestamp().rx, (rx) => rx.timeZoneOffset),
    RxTest(() => DateTime.timestamp().rx, (rx) => rx.toIso8601String()),
    RxTest(() => DateTime.timestamp().rx, (rx) => rx.toLocal()),
    RxTest(() => DateTime.timestamp().rx, (rx) => rx.toUtc()),
    RxTest(() => DateTime.timestamp().rx, (rx) => rx.weekday),
    RxTest(() => DateTime.timestamp().rx, (rx) => rx.year),
  ];

  test('RxDateTime registration and notifications', () {
    expectRx(shouldRegister: shouldRegister);
  });

  test('RxDateTime/DateTime equivalency', () {
    final now = DateTime.timestamp();
    final rx = now.rx;
    expect(
      rx.add(const Duration(seconds: 1)),
      rx.value.add(const Duration(seconds: 1)),
    );
    expect(rx.compareTo(now), rx.value.compareTo(now));
    expect(rx.day, rx.value.day);
    expect(rx.difference(now), rx.value.difference(now));
    expect(rx.hour, rx.value.hour);
    expect(rx.isAfter(now), rx.value.isAfter(now));
    expect(
      rx.isAtSameMomentAs(now),
      rx.value.isAtSameMomentAs(now),
    );
    expect(rx.isBefore(now), rx.value.isBefore(now));
    expect(rx.isUtc, rx.value.isUtc);
    expect(rx.microsecond, rx.value.microsecond);
    expect(rx.microsecondsSinceEpoch, rx.value.microsecondsSinceEpoch);
    expect(rx.millisecond, rx.value.millisecond);
    expect(rx.millisecondsSinceEpoch, rx.value.millisecondsSinceEpoch);
    expect(rx.minute, rx.value.minute);
    expect(rx.month, rx.value.month);
    expect(rx.second, rx.value.second);
    expect(
      rx.subtract(const Duration(seconds: 1)),
      rx.value.subtract(const Duration(seconds: 1)),
    );
    expect(rx.timeZoneName, rx.value.timeZoneName);
    expect(rx.timeZoneOffset, rx.value.timeZoneOffset);
    expect(rx.toIso8601String(), rx.value.toIso8601String());
    expect(rx.toLocal(), rx.value.toLocal());
    expect(rx.toUtc(), rx.value.toUtc());
    expect(rx.weekday, rx.value.weekday);
    expect(rx.year, rx.value.year);
  });
}
