import 'package:fast_rx/fast_rx.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('RxObject', () {
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
    rx.value.count = 1;
    rx.notify();
    rx.value.count = 2;
    rx.notify();
    rx.value.count = 3;
    rx.notify();
  });
}

class TestObject extends RxObject<TestObject> {
  int count;

  TestObject(this.count);

  @override
  operator ==(Object other) => other is TestObject && other.count == count;

  @override
  int get hashCode => count.hashCode;

  @override
  TestObject copyValue() => TestObject(count);

  @override
  bool shouldNotify(TestObject otherValue) => count != otherValue.count;
}
