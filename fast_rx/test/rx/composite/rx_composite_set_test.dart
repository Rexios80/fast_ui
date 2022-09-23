import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final shouldNotify = <RxTest<RxCompositeSet<RxInt>>>[
    RxTest(
      () => {1.rx}.rx.composite,
      (rx) {
        rx.run(() => rx.add(2.rx), notify: false);
        rx.last.value = 4;
      },
    ),
    RxTest(
      () => {1.rx}.rx.composite,
      (rx) {
        rx.run(() => rx.addAll([2.rx, 3.rx]), notify: false);
        rx.last.value = 4;
      },
    ),
  ];

  final shouldNotNotify = <RxTest<RxCompositeSet<RxInt>>>[];

  test('RxCompositeSet notifications', () {
    expectRxNotification(
      shouldNotify: shouldNotify,
      shouldNotNotify: shouldNotNotify,
    );
  });
}
