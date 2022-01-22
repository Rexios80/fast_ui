import 'package:fast_rx/fast_rx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('RxObject', () {
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
    // ignore: invalid_use_of_protected_member
    expect(() => rx.value = Tuple(0, 0), throwsUnimplementedError);
  });
}

class Tuple<T1, T2> {
  T1 item1;
  T2 item2;

  Tuple(this.item1, this.item2);

  Tuple.from(Tuple<T1, T2> other) : this(other.item1, other.item2);

  @override
  operator ==(Object other) =>
      other is Tuple<T1, T2> && other.item1 == item1 && other.item2 == item2;

  @override
  int get hashCode => hashValues(item1, item2);
}

class RxTuple<T1, T2> extends RxObject<Tuple<T1, T2>> implements Tuple<T1, T2> {
  RxTuple(Tuple<T1, T2> value) : super(value);

  @override
  T1 get item1 => value.item1;

  @override
  set item1(T1 value) => notifyIfChanged(() => this.value.item1 = value);

  @override
  T2 get item2 => value.item2;

  @override
  set item2(T2 value) => notifyIfChanged(() => this.value.item2 = value);

  @override
  Tuple<T1, T2> copyValue() => Tuple.from(value);

  @override
  bool shouldNotify(Tuple<T1, T2> oldValue) =>
      oldValue.item1 != value.item1 || oldValue.item2 != value.item2;
}

extension RxTupleExtension<T1, T2> on Tuple<T1, T2> {
  RxTuple<T1, T2> get rx => RxTuple<T1, T2>(this);
}
