// ignore_for_file: avoid_print

import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx/src/rx_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../rx_notifier_test.mocks.dart';

void main() {
  test('RxIterable registration', () {
    final notifier = MockRxNotifier();
    RxNotifier.instance = notifier;

    final rx = [1].rx;
    final calls = [
      () => rx.any((e) => false),
      // Can't actually call this on the Iterable class because it's abstract
      // () => rx.cast<int>(),
      () => rx.contains(1),
      () => rx.elementAt(0),
      () => rx.every((i) => i > 0),
      () => rx.expand((i) => [i]),
      () => rx.first,
      () => rx.firstWhere((i) => i > 0),
      () => rx.fold(0, (a, b) => a),
      () => rx.followedBy([6, 7, 8]),
      () => rx.forEach(print),
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
    ];

    for (final call in calls) {
      call();
    }

    verify(notifier.addStream(rx.stream)).called(calls.length);
  });
}
