import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:test/test.dart';

import 'composite.dart';

void main() {
  final shouldNotify = <RxTest<Composite>>[
    RxTest(() => Composite(), (rx) => rx.a.value = 2),
    RxTest(
      () => Composite(),
      (rx) => rx.run(() {
        rx.a.value = 2;
        rx.b.value = 3;
        rx.c.value = 4;
      }),
    ),
  ];

  final shouldRegister = <RxTest<Composite>>[
    RxTest(() => Composite(), (rx) => rx.a.value),
  ];

  test('RxComposite registration and notifications', () {
    expectRx(
      shouldRegister: shouldRegister,
      shouldNotRegister: shouldNotify,
      shouldNotify: shouldNotify,
      shouldNotNotify: shouldRegister,
    );
  });
}
