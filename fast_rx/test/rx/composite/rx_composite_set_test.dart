import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final shouldNotify = <RxTest<RxCompositeSet<RxInt>>>[
    RxTest(() => {1.rx}.rx.composite, (rx) {
      final other = 2.rx;
      rx.run(() => rx.add(other), notify: false);
      other.value = 4;
    }),
    RxTest(() => {1.rx}.rx.composite, (rx) {
      final other = 2.rx;
      rx.run(() => rx.addAll([other, 3.rx]), notify: false);
      other.value = 4;
    }),
  ];

  final shouldNotNotify = <RxTest<RxCompositeSet<RxInt>>>[
    RxTest(() => {1.rx}.rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () {
          rx.add(other);
          rx.clear();
        },
        notify: false,
      );
      other.value = 4;
    }),
    RxTest(() => {1.rx}.rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () {
          rx.add(other);
          rx.remove(other);
        },
        notify: false,
      );
      other.value = 4;
    }),
    RxTest(() => {1.rx}.rx.composite, (rx) {
      final other1 = 2.rx;
      final other2 = 3.rx;
      rx.run(
        () {
          rx.add(other1);
          rx.removeAll([other1, other2]);
        },
        notify: false,
      );
      other1.value = 4;
      other2.value = 5;
    }),
    RxTest(() => {1.rx}.rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () {
          rx.add(other);
          rx.removeWhere((_) => true);
        },
        notify: false,
      );
      other.value = 4;
    }),
    RxTest(() => {1.rx}.rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () {
          rx.add(other);
          rx.retainAll([]);
        },
        notify: false,
      );
      other.value = 4;
    }),
    RxTest(() => {1.rx}.rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () {
          rx.add(other);
          rx.retainWhere((_) => false);
        },
        notify: false,
      );
      other.value = 4;
    }),
  ];

  test('RxCompositeSet notifications', () {
    expectRxNotification(
      // shouldNotify: shouldNotify,
      shouldNotNotify: shouldNotNotify,
    );
  });
}
