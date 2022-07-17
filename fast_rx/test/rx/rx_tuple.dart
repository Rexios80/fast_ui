import 'package:fast_rx/fast_rx.dart';
import 'package:flutter/material.dart';

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
  RxTuple(super.value);

  @override
  T1 get item1 => value.item1;

  @override
  set item1(T1 value) => notifyIfChanged(() => unregisteredValue.item1 = value);

  @override
  T2 get item2 => value.item2;

  @override
  set item2(T2 value) => notifyIfChanged(() => unregisteredValue.item2 = value);

  @override
  @protected
  @visibleForTesting
  Tuple<T1, T2> copyValue() => Tuple.from(unregisteredValue);

  @override
  @protected
  @visibleForTesting
  bool shouldNotify(Tuple<T1, T2> oldValue) =>
      oldValue.item1 != unregisteredValue.item1 ||
      oldValue.item2 != unregisteredValue.item2;
}

extension RxTupleExtension<T1, T2> on Tuple<T1, T2> {
  RxTuple<T1, T2> get rx => RxTuple<T1, T2>(this);
}
