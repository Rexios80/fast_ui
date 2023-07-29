// ignore_for_file: invalid_use_of_protected_member

import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:test/test.dart';

void main() {
  final shouldRegister = <RxTest<RxDateTime>>[
    RxTest(() => DateTime.now().rx, (rx) => rx.add(const Duration(seconds: 1))),
    RxTest(() => DateTime.now().rx, (rx) => rx.compareTo(DateTime.now())),
    RxTest(() => DateTime.now().rx, (rx) => rx.day),
    RxTest(() => DateTime.now().rx, (rx) => rx.difference(DateTime.now())),
    RxTest(() => DateTime.now().rx, (rx) => rx.hour),
    RxTest(() => DateTime.now().rx, (rx) => rx.isAfter(DateTime.now())),
    RxTest(
      () => DateTime.now().rx,
      (rx) => rx.isAtSameMomentAs(DateTime.now()),
    ),
    RxTest(() => DateTime.now().rx, (rx) => rx.isBefore(DateTime.now())),
    RxTest(() => DateTime.now().rx, (rx) => rx.isUtc),
    RxTest(() => DateTime.now().rx, (rx) => rx.microsecond),
    RxTest(() => DateTime.now().rx, (rx) => rx.microsecondsSinceEpoch),
    RxTest(() => DateTime.now().rx, (rx) => rx.millisecond),
    RxTest(() => DateTime.now().rx, (rx) => rx.millisecondsSinceEpoch),
    RxTest(() => DateTime.now().rx, (rx) => rx.minute),
    RxTest(() => DateTime.now().rx, (rx) => rx.month),
    RxTest(() => DateTime.now().rx, (rx) => rx.second),
    RxTest(
      () => DateTime.now().rx,
      (rx) => rx.subtract(const Duration(seconds: 1)),
    ),
    RxTest(() => DateTime.now().rx, (rx) => rx.timeZoneName),
    RxTest(() => DateTime.now().rx, (rx) => rx.timeZoneOffset),
    RxTest(() => DateTime.now().rx, (rx) => rx.toIso8601String()),
    RxTest(() => DateTime.now().rx, (rx) => rx.toLocal()),
    RxTest(() => DateTime.now().rx, (rx) => rx.toUtc()),
    RxTest(() => DateTime.now().rx, (rx) => rx.weekday),
    RxTest(() => DateTime.now().rx, (rx) => rx.year),
  ];

  test('RxDateTime registration and notifications', () {
    expectRx(shouldRegister: shouldRegister);
  });

  test('RxDateTime/DateTime equivalency', () {
    final now = DateTime.now();
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
