import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:test/test.dart';

void main() {
  final shouldRegister = <RxTest<RxDuration>>[
    RxTest(() => Duration.zero.rx, (rx) => rx * 1),
    RxTest(() => Duration.zero.rx, (rx) => rx + const Duration(seconds: 1)),
    RxTest(() => Duration.zero.rx, (rx) => -rx),
    RxTest(() => Duration.zero.rx, (rx) => rx - const Duration(seconds: 1)),
    RxTest(() => Duration.zero.rx, (rx) => rx < const Duration(seconds: 1)),
    RxTest(() => Duration.zero.rx, (rx) => rx <= const Duration(seconds: 1)),
    RxTest(() => Duration.zero.rx, (rx) => rx > const Duration(seconds: 1)),
    RxTest(() => Duration.zero.rx, (rx) => rx >= const Duration(seconds: 1)),
    RxTest(() => Duration.zero.rx, (rx) => rx.abs()),
    RxTest(
      () => Duration.zero.rx,
      (rx) => rx.compareTo(const Duration(seconds: 1)),
    ),
    RxTest(() => Duration.zero.rx, (rx) => rx.inDays),
    RxTest(() => Duration.zero.rx, (rx) => rx.inHours),
    RxTest(() => Duration.zero.rx, (rx) => rx.inMicroseconds),
    RxTest(() => Duration.zero.rx, (rx) => rx.inMilliseconds),
    RxTest(() => Duration.zero.rx, (rx) => rx.inMinutes),
    RxTest(() => Duration.zero.rx, (rx) => rx.inSeconds),
    RxTest(() => Duration.zero.rx, (rx) => rx.isNegative),
    RxTest(() => Duration.zero.rx, (rx) => rx ~/ 1),
  ];

  test('RxDuration registration and notifications', () {
    expectRx(shouldRegister: shouldRegister);
  });

  test('RxDuration/Duration equivalency', () {
    final rx = Duration.zero.rx;
    expect(rx * 1, rx.value * 1);
    expect(rx + const Duration(seconds: 1), rx.value + const Duration(seconds: 1));
    expect(-rx, -rx.value);
    expect(rx - const Duration(seconds: 1), rx.value - const Duration(seconds: 1));
    expect(rx < const Duration(seconds: 1), rx.value < const Duration(seconds: 1));
    expect(rx <= const Duration(seconds: 1), rx.value <= const Duration(seconds: 1));
    expect(rx > const Duration(seconds: 1), rx.value > const Duration(seconds: 1));
    expect(rx >= const Duration(seconds: 1), rx.value >= const Duration(seconds: 1));
    expect(rx.abs(), rx.value.abs());
    expect(rx.compareTo(const Duration(seconds: 1)), rx.value.compareTo(const Duration(seconds: 1)));
    expect(rx.inDays, rx.value.inDays);
    expect(rx.inHours, rx.value.inHours);
    expect(rx.inMicroseconds, rx.value.inMicroseconds);
    expect(rx.inMilliseconds, rx.value.inMilliseconds);
    expect(rx.inMinutes, rx.value.inMinutes);
    expect(rx.inSeconds, rx.value.inSeconds);
    expect(rx.isNegative, rx.value.isNegative);
    expect(rx ~/ 1, rx.value ~/ 1);
  });
}
