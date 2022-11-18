import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final shouldNotify = <RxTest<RxList<int>>>[
    RxTest(() => [0, 1, 2].rx, (rx) => rx.replaceAll([0, 1, 2, 3])),
    RxTest(() => [0, 1, 2].rx, (rx) => rx[1] = 2),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.add(5)),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.addAll([6, 7, 8])),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.clear()),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.fillRange(0, 3, 9)),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.first = -1),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.insert(2, 2)),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.insertAll(0, [3, 4])),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.last = 4),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.length = 2),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.removeRange(0, 1)),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.removeWhere((e) => e == 1)),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.replaceRange(0, 1, [1, 2, 3, 4])),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.retainWhere((e) => e != 2)),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.setAll(0, [1, 2])),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.setRange(0, 2, [1, 2, 3])),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.shuffle()),
    RxTest(() => [0, 2, 1].rx, (rx) => rx.sort()),
  ];

  final shouldRegister = <RxTest<RxList<int>>>[
    RxTest(() => [0, 1, 2].rx, (rx) => rx.cast<int>()),
    RxTest(() => [0, 1, 2].rx, (rx) => rx + [4]),
    RxTest(() => [0, 1, 2].rx, (rx) => rx[0]),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.asMap()),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.getRange(0, 1)),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.indexOf(1)),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.indexWhere((e) => true)),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.lastIndexOf(4)),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.lastIndexWhere((e) => true)),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.reversed),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.sublist(0, 1)),
  ];

  final shouldNotifyAndRegister = <RxTest<RxList<int>>>[
    RxTest(() => [0, 1, 2].rx, (rx) => rx.remove(1)),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.removeAt(0)),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.removeLast()),
  ];

  final shouldNotNotifyOrRegister = <RxTest<RxList<int>>>[
    RxTest(() => [0, 1, 2].rx, (rx) => rx.copyValue()),
    RxTest(() => [0, 1, 2].rx, (rx) => rx.shouldNotify([0, 1, 2, 3])),
  ];

  test('RxList registration and notifications', () {
    expectRx(
      shouldRegister: shouldRegister + shouldNotifyAndRegister,
      shouldNotRegister: shouldNotify + shouldNotNotifyOrRegister,
      shouldNotify: shouldNotify + shouldNotifyAndRegister,
      shouldNotNotify: shouldRegister + shouldNotNotifyOrRegister,
    );
  });
}
