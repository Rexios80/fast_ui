import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('RxList notifications', () {
    final rx = [0, 1, 2, 3, 5, 6, 3].rx;
    expectRxNotification(
      rx,
      shouldNotify: [
        () => rx[1] = 2,
        () => rx.add(5),
        () => rx.addAll([6, 7, 8]),
        () => rx.fillRange(0, 3, 9),
        () => rx.first = -1,
        () => rx.insert(4, 2),
        () => rx.insertAll(0, [3, 4]),
        () => rx.last = 4,
        () => rx.length = 8,
        () => rx.remove(4),
        () => rx.removeAt(0),
        () => rx.removeLast(),
        () => rx.removeRange(0, 1),
        () => rx.removeWhere((e) => e == 9),
        () => rx.replaceRange(0, 0, [1, 2, 3, 4]),
        () => rx.retainWhere((e) => e != 2),
        () => rx.setAll(0, [1, 2]),
        () => rx.setRange(0, 4, [1, 2, 3, 4]),
        () => rx.shuffle(),
        () => rx.sort(),
        () => rx.clear(),
        () => rx.replaceAll([0, 1, 2, 3, 4, 5, 6, 7, 8]),
      ],
      shouldNotNotify: [
        () => rx.cast<int>(),
        () => rx + [4],
        () => rx[0],
        () => rx.asMap(),
        () => rx.getRange(0, 4),
        () => rx.indexOf(1),
        () => rx.indexWhere((e) => true),
        () => rx.lastIndexOf(4),
        () => rx.lastIndexWhere((e) => true),
        () => rx.reversed,
        () => rx.sublist(0, 4),
      ],
    );
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
        () => rx.replaceAll([0, 1, 2, 3, 4, 5, 6, 7, 8]),
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
