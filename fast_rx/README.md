An easy to understand implementation of reactive values and objects

Inspired by [GetX](https://pub.dev/packages/get), [observable_ish](https://pub.dev/packages/observable_ish), and similar packages

[![pub package](https://img.shields.io/pub/v/fast_rx)](https://pub.dev/packages/fast_rx)
[![codecov](https://img.shields.io/codecov/c/github/Rexios80/fast_ui/master?flag=fast_rx)](https://codecov.io/gh/Rexios80/fast_ui)
![checks](https://img.shields.io/github/checks-status/Rexios80/fast_ui/master)
[![popularity](https://img.shields.io/pub/popularity/fast_rx)](https://pub.dev/packages/fast_rx/score)
[![likes](https://img.shields.io/pub/likes/fast_rx)](https://pub.dev/packages/fast_rx/score)
[![pub points](https://img.shields.io/pub/points/fast_rx)](https://pub.dev/packages/fast_rx/score)

## Features
| Class           | Use-case                      |
| --------------- | ----------------------------- |
| RxBool          | A reactive bool               |
| RxDateTime      | A reactive DateTime           |
| RxDouble        | A reactive double             |
| RxDuration      | A reactive Duration           |
| RxInt           | A reactive int                |
| RxString        | A reactive string             |
| RxValue<T>      | A reactive value              |
| RxObject<T>     | A reactive object             |
| RxList<E>       | A reactive list               |
| RxMap<E>        | A reactive map                |
| RxSet<E>        | A reactive set                |
| RxComposite     | A composite of Rx objects     |
| RxCompositeList | A composite version of RxList |
| RxCompositeMap  | A composite version of RxMap  |
| RxCompositeSet  | A composite version of RxSet  |

NOTE: Because `int` cannot be extended, the type-checker will not be able to properly infer the return types of all methods

See [fast_rx_flutter](https://pub.dev/packages/fast_rx_flutter) for Flutter-specific components

## Usage
<!-- embedme readme/usage.dart -->
```dart
import 'package:fast_rx/fast_rx.dart';

void example() {
  // ...

  final count = 0.rx;

  // All primitive methods are available on their reactive versions
  // NOTE: The type checker cannot automatically infer the return type of all
  // methods
  count + 2; // This return a num
  count.value + 2; // This returns an int

  // ...

  // ignore: avoid_print
  count.stream.listen(print);

  // ...

  // Will print the value
  count.value = 1;

  final list = <int>[].rx;
  // Will only notify after the run block completes
  list.run(() {
    list.add(1);
    list.add(2);
  });
}

```

### RxObject
`RxObject` can be used to create reactive objects of classes outside of your control.
If an object is within your control, consider making fields reactive instead.

<!-- embedme test/rx/rx_tuple.dart -->
```dart
import 'package:fast_rx/fast_rx.dart';

class Tuple<T1, T2> {
  T1 item1;
  T2 item2;

  Tuple(this.item1, this.item2);

  Tuple.from(Tuple<T1, T2> other) : this(other.item1, other.item2);

  @override
  bool operator ==(Object other) =>
      other is Tuple<T1, T2> && other.item1 == item1 && other.item2 == item2;

  @override
  int get hashCode => Object.hash(item1, item2);
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
  Tuple<T1, T2> copyValue() => Tuple.from(unregisteredValue);

  @override
  bool shouldNotify(Tuple<T1, T2> oldValue) => oldValue != unregisteredValue;
}

extension RxTupleExtension<T1, T2> on Tuple<T1, T2> {
  RxTuple<T1, T2> get rx => RxTuple<T1, T2>(this);
}

```

### RxComposite
An `RxComposite` is an `Rx` that contains other `Rx` objects, and notifies with them.

Create and use composite versions of `RxIterable`s:
<!-- embedme readme/rx_composite.dart -->
```dart
import 'package:fast_rx/fast_rx.dart';

void example() {
  final compositeList = [0.rx].rx.composite;
  final compositeMap = {0: 1.rx}.rx.composite;
  final compositeSet = {0.rx}.rx.composite;

  // All of these will cause their parent to notify
  compositeList[0].value = 1;
  compositeMap[0]!.value = 1;
  compositeSet.first.value = 1;
}

```

Custom `RxComposite`:
<!-- embedme test/rx/composite/composite.dart -->
```dart
import 'package:fast_rx/fast_rx.dart';

class Composite extends RxComposite {
  final a = 1.rx;
  final b = 2.rx;
  final c = 3.rx;

  Composite() {
    // Register all rx fields so that this object notifies with them
    addRx(a);
    addRx(b);
    addRx(c);
  }
}

```

### Testing custom Rx
Custom Rx objects can be tested for valid registration and notifications using [fast_rx_test](https://pub.dev/packages/fast_rx_test).

## Additional information
See [fast_ui](https://pub.dev/packages/fast_ui) for more information