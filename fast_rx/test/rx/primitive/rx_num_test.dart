import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx/src/rx/primitive/rx_num.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:test/test.dart';

void main() {
  final shouldRegister = <RxTest<RxNum>>[
    RxTest(() => 0.rx, (rx) => rx.compareTo(0)),
    RxTest(() => 0.rx, (rx) => rx + 0),
    RxTest(() => 0.rx, (rx) => rx - 0),
    RxTest(() => 0.rx, (rx) => rx * 0),
    RxTest(() => 0.rx, (rx) => rx % 1),
    RxTest(() => 0.rx, (rx) => rx / 1),
    RxTest(() => 0.rx, (rx) => rx ~/ 1),
    RxTest(() => 0.rx, (rx) => -rx),
    RxTest(() => 0.rx, (rx) => rx.remainder(1)),
    RxTest(() => 0.rx, (rx) => rx < 0),
    RxTest(() => 0.rx, (rx) => rx <= 0),
    RxTest(() => 0.rx, (rx) => rx > 0),
    RxTest(() => 0.rx, (rx) => rx >= 0),
    RxTest(() => 0.rx, (rx) => rx.isNaN),
    RxTest(() => 0.rx, (rx) => rx.isNegative),
    RxTest(() => 0.rx, (rx) => rx.isInfinite),
    RxTest(() => 0.rx, (rx) => rx.isFinite),
    RxTest(() => 0.rx, (rx) => rx.abs()),
    RxTest(() => 0.rx, (rx) => rx.sign),
    RxTest(() => 0.rx, (rx) => rx.round()),
    RxTest(() => 0.rx, (rx) => rx.floor()),
    RxTest(() => 0.rx, (rx) => rx.ceil()),
    RxTest(() => 0.rx, (rx) => rx.truncate()),
    RxTest(() => 0.rx, (rx) => rx.roundToDouble()),
    RxTest(() => 0.rx, (rx) => rx.floorToDouble()),
    RxTest(() => 0.rx, (rx) => rx.ceilToDouble()),
    RxTest(() => 0.rx, (rx) => rx.truncateToDouble()),
    RxTest(() => 0.rx, (rx) => rx.clamp(0, 5)),
    RxTest(() => 0.rx, (rx) => rx.toInt()),
    RxTest(() => 0.rx, (rx) => rx.toDouble()),
    RxTest(() => 0.rx, (rx) => rx.toStringAsFixed(0)),
    RxTest(() => 0.rx, (rx) => rx.toStringAsExponential()),
    RxTest(() => 0.rx, (rx) => rx.toStringAsPrecision(1)),
  ];

  test('RxNum registration and notifications', () {
    expectRx(shouldRegister: shouldRegister);
  });

  test('RxNum/num equivalency', () {
    final rx = 0.rx;
    expect(rx.compareTo(0), rx.value.compareTo(0));
    expect(rx + 0, rx.value + 0);
    expect(rx - 0, rx.value - 0);
    expect(rx * 0, rx.value * 0);
    expect(rx % 1, rx.value % 1);
    expect(rx / 1, rx.value / 1);
    expect(rx ~/ 1, rx.value ~/ 1);
    expect(-rx, -rx.value);
    expect(rx.remainder(1), rx.value.remainder(1));
    expect(rx < 0, rx.value < 0);
    expect(rx <= 0, rx.value <= 0);
    expect(rx > 0, rx.value > 0);
    expect(rx >= 0, rx.value >= 0);
    expect(rx.isNaN, rx.value.isNaN);
    expect(rx.isNegative, rx.value.isNegative);
    expect(rx.isInfinite, rx.value.isInfinite);
    expect(rx.isFinite, rx.value.isFinite);
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
    expect(rx.clamp(0, 5), rx.value.clamp(0, 5));
    expect(rx.toInt(), rx.value.toInt());
    expect(rx.toDouble(), rx.value.toDouble());
    expect(rx.toStringAsFixed(0), rx.value.toStringAsFixed(0));
    expect(rx.toStringAsExponential(), rx.value.toStringAsExponential());
    expect(rx.toStringAsPrecision(1), rx.value.toStringAsPrecision(1));
  });
}
