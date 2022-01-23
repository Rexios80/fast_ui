import 'package:fast_rx/fast_rx.dart';
import 'package:flutter_test/flutter_test.dart';
import 'rx_registration_test_utils.dart';

void main() {
  test('RxSet notifications', () {
    final set = {0, 1, 2, 3}.rx;

    expect(
      set.stream,
      emitsInOrder([
        {0, 1, 2, 3, 4},
        {0, 1, 3, 4},
        {0, 1, 3, 4},
      ]),
    );

    set.add(4);
    // Should not notify
    set.removeWhere((e) => false);
    set.remove(2);
    set.notify();
  });

  test('RxSet registration', () {
    final rx = {0, 1, 2, 3, 5, 6}.rx;
    testRegistration(rx, [
      () => rx.cast<int>(),
      () => rx.add(3),
      () => rx.addAll([0, 3]),
      () => rx.containsAll([0, 3]),
      () => rx.difference({0, 1, 4}),
      () => rx.intersection({0, 2, 5}),
      () => rx.lookup(4),
      () => rx.remove(1),
      () => rx.removeAll([3]),
      () => rx.removeWhere((e) => false),
      () => rx.retainAll([0, 1, 2]),
      () => rx.retainWhere((e) => true),
      () => rx.union({0, 1, 4, 6}),
      () => rx.clear(),
    ]);
  });
}
