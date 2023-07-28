import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:test/test.dart';

void main() {
  final shouldRegister = <RxTest<RxInt>>[
    RxTest(() => 0.rx, (rx) => rx & 0),
    RxTest(() => 0.rx, (rx) => rx | 0),
    RxTest(() => 0.rx, (rx) => rx ^ 0),
    RxTest(() => 0.rx, (rx) => ~rx),
    RxTest(() => 0.rx, (rx) => rx << 0),
    RxTest(() => 0.rx, (rx) => rx >> 0),
    RxTest(() => 0.rx, (rx) => rx >>> 0),
    RxTest(() => 0.rx, (rx) => rx.modPow(0, 1)),
    RxTest(() => 0.rx, (rx) => rx.modInverse(1)),
    RxTest(() => 0.rx, (rx) => rx.gcd(0)),
    RxTest(() => 0.rx, (rx) => rx.isEven),
    RxTest(() => 0.rx, (rx) => rx.isOdd),
    RxTest(() => 0.rx, (rx) => rx.bitLength),
    RxTest(() => 0.rx, (rx) => rx.toUnsigned(0)),
    RxTest(() => 0.rx, (rx) => rx.toSigned(1)),
    RxTest(() => 0.rx, (rx) => -rx),
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
    RxTest(() => 0.rx, (rx) => rx.toString()),
    RxTest(() => 0.rx, (rx) => rx.toRadixString(2)),
  ];

  test('RxInt registration and notifications', () {
    expectRx(shouldRegister: shouldRegister);
  });

  test('RxInt/int equivalency', () {
    final rx = 0.rx;
    expect(rx & 0, rx.value & 0);
    expect(rx | 0, rx.value | 0);
    expect(rx ^ 0, rx.value ^ 0);
    expect(~rx, ~rx.value);
    expect(rx << 0, rx.value << 0);
    expect(rx >> 0, rx.value >> 0);
    expect(rx >>> 0, rx.value >>> 0);
    expect(rx.modPow(0, 1), rx.value.modPow(0, 1));
    expect(rx.modInverse(1), rx.value.modInverse(1));
    expect(rx.gcd(0), rx.value.gcd(0));
    expect(rx.isEven, rx.value.isEven);
    expect(rx.isOdd, rx.value.isOdd);
    expect(rx.bitLength, rx.value.bitLength);
    expect(rx.toUnsigned(0), rx.value.toUnsigned(0));
    expect(rx.toSigned(1), rx.value.toSigned(1));
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
    expect(rx.toRadixString(2), rx.value.toRadixString(2));
  });
}
