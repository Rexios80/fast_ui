import 'package:fast_rx/fast_rx.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('RxSet', () {
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
}
