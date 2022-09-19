import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final shouldNotify = <RxTest<RxMap<String, int>>>[
    RxTest(() => {'a': 0, 'b': 1, 'c': 2}.rx, (rx) => rx.replaceAll({'z': 7})),
    RxTest(() => {'a': 1, 'b': 2, 'c': 3}.rx, (rx) => rx['1'] = 2),
    RxTest(
      () => {'a': 1, 'b': 2, 'c': 3}.rx,
      (rx) => rx.addAll({'d': 4, 'e': 5}),
    ),
    RxTest(() => {'a': 1}.rx, (rx) => rx.addEntries(const [MapEntry('f', 6)])),
    RxTest(() => {'a': 1, 'b': 2, 'c': 3}.rx, (rx) => rx.clear()),
    RxTest(
      () => {'a': 1, 'b': 2, 'c': 3}.rx,
      (rx) => rx.removeWhere((a, b) => true),
    ),
    RxTest(
      () => {'a': 1, 'b': 2, 'c': 3}.rx,
      (rx) => rx.updateAll((a, b) => b + 1),
    ),
  ];
  final shouldRegister = <RxTest<RxMap<String, int>>>[
    RxTest(() => {'a': 1, 'b': 2, 'c': 3}.rx, (rx) => rx['a']),
    RxTest(() => {'a': 1, 'b': 2, 'c': 3}.rx, (rx) => rx.cast<String, int>()),
    RxTest(() => {'a': 1, 'b': 2, 'c': 3}.rx, (rx) => rx.containsKey('a')),
    RxTest(() => {'a': 1, 'b': 2, 'c': 3}.rx, (rx) => rx.containsValue(1)),
    RxTest(() => {'a': 1, 'b': 2, 'c': 3}.rx, (rx) => rx.entries),
    RxTest(() => {'a': 1, 'b': 2, 'c': 3}.rx, (rx) => rx.isEmpty),
    RxTest(() => {'a': 1, 'b': 2, 'c': 3}.rx, (rx) => rx.isNotEmpty),
    RxTest(() => {'a': 1, 'b': 2, 'c': 3}.rx, (rx) => rx.keys),
    RxTest(() => {'a': 1, 'b': 2, 'c': 3}.rx, (rx) => rx.length),
    RxTest(() => {'a': 1, 'b': 2}.rx, (rx) => rx.map((a, b) => MapEntry(a, b))),
    RxTest(() => {'a': 1, 'b': 2, 'c': 3}.rx, (rx) => rx.values),
  ];
  final shouldNotifyAndRegister = <RxTest<RxMap<String, int>>>[
    RxTest(() => {'a': 1, 'b': 2}.rx, (rx) => rx.putIfAbsent('f', () => 4)),
    RxTest(() => {'a': 1, 'b': 2, 'c': 3}.rx, (rx) => rx.remove('a')),
    RxTest(() => {'a': 1, 'b': 2, 'c': 3}.rx, (rx) => rx.update('a', (a) => 3)),
  ];
  final shouldNotNotifyOrRegister = <RxTest<RxMap<String, int>>>[
    RxTest(() => {'a': 0, 'b': 1, 'c': 2}.rx, (rx) => rx.copyValue()),
    RxTest(() => {'a': 1, 'b': 2, 'c': 3}.rx, (rx) => rx.shouldNotify({})),
    RxTest(
      () => {'a': 1, 'b': 2, 'c': 3}.rx,
      // ignore: avoid_returning_null_for_void
      (rx) => rx.forEach((a, b) => null),
    ),
  ];

  test('RxMap notifications', () {
    expectRxNotification(
      shouldNotify: shouldNotify + shouldNotifyAndRegister,
      shouldNotNotify: shouldRegister + shouldNotNotifyOrRegister,
    );
  });

  test('RxMap registration', () {
    expectRxRegistration(
      shouldRegister: shouldRegister + shouldNotifyAndRegister,
      shouldNotRegister: shouldNotify + shouldNotNotifyOrRegister,
    );
  });
}
