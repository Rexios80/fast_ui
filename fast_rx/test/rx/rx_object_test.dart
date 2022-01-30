import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx/testing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'rx_tuple.dart';

void main() {
  test('RxObject notifications', () {
    final rx = Tuple(1, 2).rx;

    expect(
      rx.stream,
      emitsInOrder(
        [
          Tuple(1, 2),
          Tuple(2, 2),
          Tuple(2, 3),
        ],
      ),
    );

    // Notify of the initial value
    rx.notify();

    // Update the value
    rx.item1 = 2;
    // Should not notify
    rx.item2 = 2;
    rx.item2 = 3;

    // RxObject.value setter should throw if used
    expect(
      // ignore: invalid_use_of_protected_member
      () => rx.value = Tuple(0, 0),
      throwsA(isA<RxObjectValueIsReadOnly>()),
    );
  });

  test('RxObject registration', () {
    final rx = Tuple(1, 2).rx;
    expectRxRegistration(
      rx,
      shouldRegister: [
        () => rx.item1,
        () => rx.item2,
      ],
      shouldNotRegister: [
        () => rx.item1 = 3,
        () => rx.item2 = 3,
      ],
    );
  });
}
