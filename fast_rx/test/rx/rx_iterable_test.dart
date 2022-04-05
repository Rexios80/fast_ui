import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx/src/rx/rx_iterable.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final shouldRegister = <RxTest<RxIterable<int>>>[
    RxTest([0, 1, 2].rx, (rx) => rx.any((e) => false)),
    RxTest([0, 1, 2].rx, (rx) => rx.contains(1)),
    RxTest([0, 1, 2].rx, (rx) => rx.elementAt(0)),
    RxTest([0, 1, 2].rx, (rx) => rx.every((i) => i > 0)),
    RxTest([0, 1, 2].rx, (rx) => rx.expand((i) => [i])),
    RxTest([0, 1, 2].rx, (rx) => rx.first),
    RxTest([0, 1, 2].rx, (rx) => rx.firstWhere((i) => i > 0)),
    RxTest([0, 1, 2].rx, (rx) => rx.fold<int>(0, (a, b) => a)),
    RxTest([0, 1, 2].rx, (rx) => rx.followedBy([6, 7, 8])),
    RxTest([0, 1, 2].rx, (rx) => rx.isEmpty),
    RxTest([0, 1, 2].rx, (rx) => rx.isNotEmpty),
    RxTest([0, 1, 2].rx, (rx) => rx.iterator),
    RxTest([0, 1, 2].rx, (rx) => rx.join(',')),
    RxTest([0, 1, 2].rx, (rx) => rx.last),
    RxTest([0, 1, 2].rx, (rx) => rx.lastWhere((i) => i > 0)),
    RxTest([0, 1, 2].rx, (rx) => rx.length),
    RxTest([0, 1, 2].rx, (rx) => rx.map((i) => i)),
    RxTest([0, 1, 2].rx, (rx) => rx.reduce((a, b) => a)),
    RxTest([0].rx, (rx) => rx.single),
    RxTest([0, 1, 2].rx, (rx) => rx.singleWhere((i) => i == 0)),
    RxTest([0, 1, 2].rx, (rx) => rx.skip(1)),
    RxTest([0, 1, 2].rx, (rx) => rx.skipWhile((i) => i > 0)),
    RxTest([0, 1, 2].rx, (rx) => rx.take(1)),
    RxTest([0, 1, 2].rx, (rx) => rx.takeWhile((i) => i > 0)),
    RxTest([0, 1, 2].rx, (rx) => rx.toList()),
    RxTest([0, 1, 2].rx, (rx) => rx.toSet()),
    RxTest([0, 1, 2].rx, (rx) => rx.where((i) => i > 0)),
    RxTest([0, 1, 2].rx, (rx) => rx.whereType<int>()),
  ];

  final shouldNotRegisterOrNotify = <RxTest<RxIterable<int>>>[
    // ignore: avoid_returning_null_for_void, avoid_function_literals_in_foreach_calls
    RxTest([0, 1, 2].rx, (rx) => rx.forEach((e) => null)),
  ];

  test('RxIterable notifications', () {
    expectRxNotification<RxIterable<int>>(
      shouldNotify: [],
      shouldNotNotify: shouldRegister + shouldNotRegisterOrNotify,
    );
  });

  test('RxIterable registration', () {
    expectRxRegistration<RxIterable<int>>(
      shouldRegister: shouldRegister,
      shouldNotRegister: shouldNotRegisterOrNotify,
    );
  });
}
