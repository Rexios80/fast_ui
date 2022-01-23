import 'package:fast_rx/fast_rx.dart';
import 'package:flutter_test/flutter_test.dart';
import 'rx_registration_test_utils.dart';

void main() {
  test('RxIterable registration', () {
    final rx = [1].rx;
    testRegistration(rx, [
      () => rx.any((e) => false),
      // Can't actually call this on the Iterable class because it's abstract
      // () => rx.cast<int>(),
      () => rx.contains(1),
      () => rx.elementAt(0),
      () => rx.every((i) => i > 0),
      () => rx.expand((i) => [i]),
      () => rx.first,
      () => rx.firstWhere((i) => i > 0),
      () => rx.fold<int>(0, (a, b) => a),
      () => rx.followedBy([6, 7, 8]),
      // ignore: avoid_returning_null_for_void, avoid_function_literals_in_foreach_calls
      () => rx.forEach((e) => null),
      () => rx.isEmpty,
      () => rx.isNotEmpty,
      () => rx.iterator,
      () => rx.join(','),
      () => rx.last,
      () => rx.lastWhere((i) => i > 0),
      () => rx.length,
      () => rx.map((i) => i),
      () => rx.reduce((a, b) => a),
      () => rx.single,
      () => rx.singleWhere((i) => i > 0),
      () => rx.skip(1),
      () => rx.skipWhile((i) => i > 0),
      () => rx.take(1),
      () => rx.takeWhile((i) => i > 0),
      () => rx.toList(),
      () => rx.toSet(),
      () => rx.where((i) => i > 0),
      () => rx.whereType<int>(),
    ]);
  });
}
