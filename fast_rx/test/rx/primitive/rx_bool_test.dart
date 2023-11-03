import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:test/test.dart';

void main() {
  final shouldRegister = <RxTest<RxBool>>[
    RxTest(() => true.rx, (rx) => rx & false),
    RxTest(() => true.rx, (rx) => rx | false),
    RxTest(() => true.rx, (rx) => rx ^ false),
    RxTest(() => true.rx, (rx) => rx.toString()),
  ];

  test('RxBool registration and notifications', () {
    expectRx(shouldRegister: shouldRegister);
  });

  test('RxBool/bool equivalency', () {
    final rx = true.rx;
    expect(rx & true, rx.value & true);
    expect(rx | true, rx.value | true);
    expect(rx ^ true, rx.value ^ true);
    expect(rx.toString(), rx.value.toString());
  });
}
