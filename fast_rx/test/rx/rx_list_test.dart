import 'package:fast_rx/fast_rx.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('RxList', () {
    final list = [0, 1, 2, 3].rx;

    expect(
      list.stream,
      emitsInOrder([
        [0, 1, 2, 3, 4],
        [0, 1, 2, 3],
        [1, 2, 3],
        [1, 2, 3],
      ]),
    );

    list.add(4);
    // Should not notify
    list.removeWhere((e) => false);
    list.removeLast();
    list.removeAt(0);
    list.notify();
  });
}
