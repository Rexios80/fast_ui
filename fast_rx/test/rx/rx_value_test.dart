import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:test/test.dart';

void main() {
  test('RxValue registration', () {
    expectRx<RxString>(
      shouldRegister: [
        RxTest(() => ''.rx, (rx) => rx.value),
      ],
    );
  });

  test('RxValue<int> notifications', () {
    final rx = 0.rx;

    expect(rx.stream, emitsInOrder([0, 1, 2, 3]));

    // Notify of the initial value
    rx.notify();

    // Update the value
    rx.value = 1;
    // Should not notify
    rx.value = 1;
    rx.value = 2;
    rx.value = 3;
  });

  test('RxValue<Object> notifications', () {
    final rx = TestObject(0).rx;

    expect(
      rx.stream,
      emitsInOrder(
        [
          TestObject(0),
          TestObject(1),
          TestObject(2),
          TestObject(3),
        ],
      ),
    );

    // Notify of the initial value
    rx.notify();

    // Update the value
    rx.value = TestObject(1);
    // Should not notify
    rx.value = TestObject(1);
    rx.value = TestObject(2);
    rx.value = TestObject(3);
  });
}

class TestObject {
  final int count;

  TestObject(this.count);

  @override
  operator ==(Object other) => other is TestObject && other.count == count;

  @override
  int get hashCode => count.hashCode;
}
