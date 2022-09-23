import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:flutter_test/flutter_test.dart';

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

  test('RxComposite notifications', () {
    expectRxNotification(
      shouldNotify: shouldNotify,
      shouldNotNotify: shouldRegister,
    );
  });

  test('RxComposite registration', () {
    expectRxRegistration(
      shouldRegister: shouldRegister,
      shouldNotRegister: shouldNotify,
    );
  });
}

class Composite extends RxComposite {
  final a = 1.rx;
  final b = 2.rx;
  final c = 3.rx;

  Composite() {
    addRx(a);
    addRx(b);
    addRx(c);
  }
}
