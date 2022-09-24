import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final shouldNotify = <RxTest<RxCompositeMap<int, RxInt>>>[
    RxTest(() => {0: 1.rx}.rx.composite, (rx) {
      final other = 2.rx;
      rx.run(() => rx.replaceAll({1: other}), notify: false);
      other.value = 4;
    }),
    RxTest(() => {0: 1.rx}.rx.composite, (rx) {
      final other = 2.rx;
      rx.run(() => rx[0] = other, notify: false);
      other.value = 4;
    }),
    RxTest(() => {0: 1.rx}.rx.composite, (rx) {
      final other = 2.rx;
      rx.run(() => rx.addAll({2: other}), notify: false);
      other.value = 4;
    }),
    RxTest(() => {0: 1.rx}.rx.composite, (rx) {
      final other = 2.rx;
      rx.run(() => rx.putIfAbsent(1, () => other), notify: false);
      other.value = 4;
    }),
    RxTest(() => {0: 1.rx}.rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () => rx.update(1, (v) => v, ifAbsent: () => other),
        notify: false,
      );
      other.value = 4;
    }),
    RxTest(() => {0: 1.rx}.rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () => rx.updateAll((k, v) => other),
        notify: false,
      );
      other.value = 4;
    }),
  ];

  final shouldNotNotify = <RxTest<RxCompositeMap<int, RxInt>>>[
    RxTest(() => {0: 1.rx}.rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () {
          rx[0] = other;
          rx.replaceAll({});
        },
        notify: false,
      );
      other.value = 4;
    }),
    RxTest(() => {0: 1.rx}.rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () {
          rx[0] = other;
          rx[0] = 3.rx;
        },
        notify: false,
      );
      other.value = 4;
    }),
    RxTest(() => {0: 1.rx}.rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () {
          rx[0] = other;
          rx.clear();
        },
        notify: false,
      );
      other.value = 4;
    }),
    RxTest(() => {0: 1.rx}.rx.composite, (rx) {
      final other = 2.rx;
      rx.run(() => rx.putIfAbsent(0, () => other), notify: false);
      other.value = 4;
    }),
    RxTest(() => {0: 1.rx}.rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () {
          rx[0] = other;
          rx.remove(0);
        },
        notify: false,
      );
      other.value = 4;
    }),
    RxTest(() => {0: 1.rx}.rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () {
          rx[0] = other;
          rx.removeWhere((k, v) => true);
        },
        notify: false,
      );
      other.value = 4;
    }),
    RxTest(() => {0: 1.rx}.rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () => rx.update(0, (v) => v, ifAbsent: () => other),
        notify: false,
      );
      other.value = 4;
    }),
    RxTest(() => {0: 1.rx}.rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () => rx.updateAll((k, v) => v),
        notify: false,
      );
      other.value = 4;
    }),
  ];

  test('RxCompositeMap notifications', () {
    expectRxNotification(
      shouldNotify: shouldNotify,
      shouldNotNotify: shouldNotNotify,
    );
  });
}
