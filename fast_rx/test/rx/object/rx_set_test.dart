import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:test/test.dart';

void main() {
  final shouldNotify = <RxTest<RxSet<int>>>[
    RxTest(() => {0, 1, 2, 3, 5, 6}.rx, (rx) => rx.replaceAll({9, 8, 7})),
    RxTest(() => {0, 1, 2, 3, 5, 6}.rx, (rx) => rx.addAll([0, 4])),
    RxTest(() => {0, 1, 2, 3, 5, 6}.rx, (rx) => rx.clear()),
    RxTest(() => {0, 1, 2, 3, 5, 6}.rx, (rx) => rx.removeAll([3])),
    RxTest(() => {0, 1, 2, 3, 5, 6}.rx, (rx) => rx.removeWhere((e) => true)),
    RxTest(() => {0, 1, 2, 3, 5, 6}.rx, (rx) => rx.retainAll([0, 1, 2])),
    RxTest(() => {0, 1, 2, 3, 5, 6}.rx, (rx) => rx.retainWhere((e) => false)),
  ];
  final shouldRegister = <RxTest<RxSet<int>>>[
    RxTest(() => {0, 1, 2, 3, 5, 6}.rx, (rx) => rx.cast<int>()),
    RxTest(() => {0, 1, 2, 3, 5, 6}.rx, (rx) => rx.containsAll([0, 3])),
    RxTest(() => {0, 1, 2, 3, 5, 6}.rx, (rx) => rx.difference({0, 1, 4})),
    RxTest(() => {0, 1, 2, 3, 5, 6}.rx, (rx) => rx.intersection({0, 2, 5})),
    RxTest(() => {0, 1, 2, 3, 5, 6}.rx, (rx) => rx.lookup(4)),
    RxTest(() => {0, 1, 2, 3, 5, 6}.rx, (rx) => rx.union({0, 1, 4, 6})),
  ];
  final shouldNotifyAndRegister = <RxTest<RxSet<int>>>[
    RxTest(() => {0, 1, 2, 3, 5, 6}.rx, (rx) => rx.add(4)),
    RxTest(() => {0, 1, 2, 3, 5, 6}.rx, (rx) => rx.remove(1)),
  ];
  final shouldNotNotifyOrRegister = <RxTest<RxSet<int>>>[
    RxTest(() => {0, 1, 2, 3, 5, 6}.rx, (rx) => rx.copyValue()),
    RxTest(() => {0, 1, 2, 3, 5, 6}.rx, (rx) => rx.shouldNotify({})),
  ];

  test('RxSet registration and notifications', () {
    expectRx(
      shouldRegister: shouldRegister + shouldNotifyAndRegister,
      shouldNotRegister: shouldNotify + shouldNotNotifyOrRegister,
      shouldNotify: shouldNotify + shouldNotifyAndRegister,
      shouldNotNotify: shouldRegister + shouldNotNotifyOrRegister,
    );
  });
}
