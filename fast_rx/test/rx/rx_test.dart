import 'package:fast_rx/fast_rx.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Rx', () {
    final rx = 0.rx;

    expect(rx.stream, emitsInOrder([0, 1, 2, 3]));

    // Notify of the initial value
    rx.notify();

    // Update the value
    rx.value = 1;
    rx.value = 2;
    rx.value = 3;
  });
}
