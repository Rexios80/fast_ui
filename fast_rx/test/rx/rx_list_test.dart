import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('RxList notifications', () {
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

  test('RxList registration', () {
    final rx = [0, 1, 2, 3, 5, 6, 3].rx;
    expectRxRegistration(
      rx,
      shouldRegister: [
        () => rx.cast<int>(),
        () => rx + [4],
        () => rx[0],
        () => rx.asMap(),
        () => rx.getRange(0, 4),
        () => rx.indexOf(1),
        () => rx.indexWhere((e) => true),
        () => rx.lastIndexOf(4),
        () => rx.lastIndexWhere((e) => true),
        () => rx.remove(0),
        () => rx.removeAt(0),
        () => rx.removeLast(),
        () => rx.reversed,
        () => rx.sublist(0, 4),
      ],
      shouldNotRegister: [
        () => rx[1] = 2,
        () => rx.add(5),
        () => rx.addAll([6, 7, 8]),
        () => rx.fillRange(0, 3, 9),
        () => rx.first = -1,
        () => rx.insert(4, 2),
        () => rx.insertAll(0, [3, 4]),
        () => rx.last = 4,
        () => rx.length = 4,
        () => rx.removeRange(0, 0),
        () => rx.removeWhere((e) => true),
        () => rx.replaceRange(0, 0, [1, 2, 3, 4]),
        () => rx.retainWhere((e) => true),
        () => rx.setAll(0, [1, 2]),
        () => rx.setRange(0, 4, [1, 2, 3, 4]),
        () => rx.shuffle(),
        () => rx.sort(),
        () => rx.clear(),
      ],
    );
  });
}
