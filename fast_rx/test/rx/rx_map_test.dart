import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx/testing.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('RxMap notifications', () {
    final map = {'a': 1, 'b': 2, 'c': 3}.rx;

    expect(
      map.stream,
      emitsInOrder([
        {'a': 10, 'b': 2, 'c': 3},
        {'a': 10, 'c': 3}
      ]),
    );

    map['a'] = 10;
    // Should not notify
    map.removeWhere((a, b) => false);
    map.remove('b');
  });

  test('RxMap registration', () {
    final rx = {'a': 1, 'b': 2, 'c': 3}.rx;
    expectRx(
      rx,
      shouldRegister: [
        () => rx['a'],
        () => rx['1'] = 2,
        () => rx.addAll({'d': 4, 'e': 5}),
        () => rx.addEntries(const [MapEntry('f', 6)]),
        () => rx.cast<String, int>(),
        () => rx.containsKey('a'),
        () => rx.containsValue(1),
        () => rx.entries,
        // ignore: avoid_returning_null_for_void
        () => rx.forEach((a, b) => null),
        () => rx.isEmpty,
        () => rx.isNotEmpty,
        () => rx.keys,
        () => rx.length,
        () => rx.map((a, b) => MapEntry(a, b)),
        () => rx.putIfAbsent('a', () => 4),
        () => rx.remove('a'),
        () => rx.removeWhere((a, b) => false),
        () => rx.update('a', (a) => a + 1, ifAbsent: () => 4),
        () => rx.updateAll((a, b) => b + 1),
        () => rx.values,
        () => rx.clear(),
      ],
    );
  });
}
