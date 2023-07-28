import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:test/test.dart';

void main() {
  final shouldRegister = <RxTest<RxDouble>>[
    RxTest(() => 0.0.rx, (rx) => rx.remainder(1)),
    RxTest(() => 0.0.rx, (rx) => rx + 0),
    RxTest(() => 0.0.rx, (rx) => rx - 0),
    RxTest(() => 0.0.rx, (rx) => rx * 0),
    RxTest(() => 0.0.rx, (rx) => rx % 1),
    RxTest(() => 0.0.rx, (rx) => rx / 1),
    RxTest(() => 0.0.rx, (rx) => rx ~/ 1),
    RxTest(() => 0.0.rx, (rx) => -rx),
    RxTest(() => 0.0.rx, (rx) => rx.abs()),
    RxTest(() => 0.0.rx, (rx) => rx.sign),
    RxTest(() => 0.0.rx, (rx) => rx.round()),
    RxTest(() => 0.0.rx, (rx) => rx.floor()),
    RxTest(() => 0.0.rx, (rx) => rx.ceil()),
    RxTest(() => 0.0.rx, (rx) => rx.truncate()),
    RxTest(() => 0.0.rx, (rx) => rx.roundToDouble()),
    RxTest(() => 0.0.rx, (rx) => rx.floorToDouble()),
    RxTest(() => 0.0.rx, (rx) => rx.ceilToDouble()),
    RxTest(() => 0.0.rx, (rx) => rx.truncateToDouble()),
    RxTest(() => 0.0.rx, (rx) => rx.toString()),
    RxTest(() => 0.0.rx, (rx) => rx.clamp(0, 5)),
  ];

  test('RxDouble registration and notifications', () {
    expectRx(shouldRegister: shouldRegister);
  });

  test('RxDouble/double equivalency', () {
    final rx = 0.5.rx;
    expect(rx.remainder(1), rx.value.remainder(1));
    expect(rx + 0, rx.value + 0);
    expect(rx - 0, rx.value - 0);
    expect(rx * 0, rx.value * 0);
    expect(rx % 1, rx.value % 1);
    expect(rx / 1, rx.value / 1);
    expect(rx ~/ 1, rx.value ~/ 1);
    expect(-rx, -rx.value);
    expect(rx.abs(), rx.value.abs());
    expect(rx.sign, rx.value.sign);
    expect(rx.round(), rx.value.round());
    expect(rx.floor(), rx.value.floor());
    expect(rx.ceil(), rx.value.ceil());
    expect(rx.truncate(), rx.value.truncate());
    expect(rx.roundToDouble(), rx.value.roundToDouble());
    expect(rx.floorToDouble(), rx.value.floorToDouble());
    expect(rx.ceilToDouble(), rx.value.ceilToDouble());
    expect(rx.truncateToDouble(), rx.value.truncateToDouble());
    expect(rx.toString(), rx.value.toString());
    expect(rx.clamp(0, 5), rx.value.clamp(0, 5));
  });
}
