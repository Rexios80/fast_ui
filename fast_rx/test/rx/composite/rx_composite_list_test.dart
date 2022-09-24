import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final shouldNotify = <RxTest<RxCompositeList<RxInt>>>[
    RxTest(() => [1.rx].rx.composite, (rx) {
      final other = 2.rx;
      rx.run(() => rx.replaceAll([other]), notify: false);
      other.value = 4;
    }),
    RxTest(() => [1.rx].rx.composite, (rx) {
      final other = 2.rx;
      rx.run(() => rx[0] = other, notify: false);
      other.value = 4;
    }),
    RxTest(() => [1.rx].rx.composite, (rx) {
      final other = 2.rx;
      rx.run(() => rx.add(other), notify: false);
      other.value = 4;
    }),
    RxTest(() => [1.rx].rx.composite, (rx) {
      final other = 2.rx;
      rx.run(() => rx.addAll([other, 3.rx]), notify: false);
      other.value = 4;
    }),
    RxTest(() => [1.rx].rx.composite, (rx) {
      final other = 2.rx;
      rx.run(() => rx.fillRange(0, rx.length, other), notify: false);
      other.value = 4;
    }),
    RxTest(() => [1.rx].rx.composite, (rx) {
      final other = 2.rx;
      rx.run(() => rx.insert(0, other), notify: false);
      other.value = 4;
    }),
    RxTest(() => [1.rx].rx.composite, (rx) {
      final other = 2.rx;
      rx.run(() => rx.insertAll(0, [other]), notify: false);
      other.value = 4;
    }),
    RxTest(() => [1.rx].rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () => rx.replaceRange(0, rx.length, [other]),
        notify: false,
      );
      other.value = 4;
    }),
    RxTest(() => [1.rx].rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () => rx.setAll(0, [other]),
        notify: false,
      );
      other.value = 4;
    }),
    RxTest(() => [1.rx].rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () => rx.setRange(0, rx.length, [other]),
        notify: false,
      );
      other.value = 4;
    }),
  ];

  final shouldNotNotify = <RxTest<RxCompositeList<RxInt>>>[
    RxTest(() => [1.rx].rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () {
          rx.add(other);
          rx.replaceAll([]);
        },
        notify: false,
      );
      other.value = 4;
    }),
    RxTest(() => [1.rx].rx.composite, (rx) {
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
    RxTest(() => [1.rx].rx.composite, (rx) {
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
    RxTest(() => [1.rx].rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () {
          rx.fillRange(0, rx.length, other);
          rx.fillRange(0, rx.length, 3.rx);
        },
        notify: false,
      );
      other.value = 4;
    }),
    RxTest(() => [1.rx].rx.composite, (rx) {
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
    RxTest(() => [1.rx].rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () {
          rx[0] = other;
          rx.removeAt(0);
        },
        notify: false,
      );
      other.value = 4;
    }),
    RxTest(() => [1.rx].rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () {
          rx.add(other);
          rx.removeLast();
        },
        notify: false,
      );
      other.value = 4;
    }),
    RxTest(() => [1.rx].rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () {
          rx.add(other);
          rx.removeRange(0, rx.length);
        },
        notify: false,
      );
      other.value = 4;
    }),
    RxTest(() => [1.rx].rx.composite, (rx) {
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
    RxTest(() => [1.rx].rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () {
          rx.add(other);
          rx.replaceRange(0, rx.length, []);
        },
        notify: false,
      );
      other.value = 4;
    }),
    RxTest(() => [1.rx].rx.composite, (rx) {
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
    RxTest(() => [1.rx].rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () {
          rx.add(other);
          rx.setAll(0, [1.rx, 2.rx]);
        },
        notify: false,
      );
      other.value = 4;
    }),
    RxTest(() => [1.rx].rx.composite, (rx) {
      final other = 2.rx;
      rx.run(
        () {
          rx.add(other);
          rx.setRange(0, rx.length, [1.rx, 2.rx]);
        },
        notify: false,
      );
      other.value = 4;
    }),
  ];

  test('RxCompositeList notifications', () {
    expectRxNotification(
      shouldNotify: shouldNotify,
      shouldNotNotify: shouldNotNotify,
    );
  });
}
