import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'rx_tuple.dart';

void main() {
  final shouldNotify = <RxTest<RxTuple<int, int>>>[
    RxTest(Tuple(1, 2).rx, (rx) => rx.item1 = 3),
    RxTest(Tuple(1, 2).rx, (rx) => rx.item2 = 3),
  ];
  final shouldRegister = <RxTest<RxTuple<int, int>>>[
    RxTest(Tuple(1, 2).rx, (rx) => rx.item1),
    RxTest(Tuple(1, 2).rx, (rx) => rx.item2),
  ];
  final shouldNotNotifyOrRegister = <RxTest<RxTuple<int, int>>>[
    RxTest(Tuple(1, 2).rx, (rx) => rx.copyValue()),
    RxTest(Tuple(1, 2).rx, (rx) => rx.shouldNotify(Tuple(2, 2))),
    // ignore: invalid_use_of_protected_member
    RxTest(Tuple(1, 2).rx, (rx) => rx.internalSetValue(Tuple(1, 3))),
  ];

  test('RxObject notifications', () {
    expectRxNotification(
      shouldNotify: shouldNotify,
      shouldNotNotify: shouldRegister + shouldNotNotifyOrRegister,
    );
  });

  test('RxObject registration', () {
    expectRxRegistration(
      shouldRegister: shouldRegister,
      shouldNotRegister: shouldNotify + shouldNotNotifyOrRegister,
    );
  });
}
