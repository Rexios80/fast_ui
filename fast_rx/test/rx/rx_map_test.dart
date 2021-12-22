import 'package:fast_rx/fast_rx.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('RxMap', () {
    final map = {'a': 1, 'b': 2, 'c': 3}.rx;

    expect(
      map.stream,
      emitsInOrder([
        {'a': 10, 'b': 2, 'c': 3},
        {'a': 10, 'c': 3}
      ]),
    );

    map['a'] = 10;
    map.remove('b');
  });
}
