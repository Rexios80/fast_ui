fast_rx is a reactive state management solution for Flutter

Inspired by [GetX](https://pub.dev/packages/get), [observable_ish](https://pub.dev/packages/observable_ish), and similar packages

[![pub package](https://img.shields.io/pub/v/fast_rx.svg?label=fast_rx)](https://pub.dev/packages/fast_rx)
[![codecov](https://codecov.io/gh/Rexios80/fast_ui/branch/master/graph/badge.svg?flag=fast_rx)](https://codecov.io/gh/Rexios80/fast_ui)
![checks](https://img.shields.io/github/checks-status/Rexios80/fast_ui/master)
[![popularity](https://badges.bar/fast_rx/popularity)](https://pub.dev/packages/fast_rx/score)
[![likes](https://badges.bar/fast_rx/likes)](https://pub.dev/packages/fast_rx/score)
[![pub points](https://badges.bar/fast_rx/pub%20points)](https://pub.dev/packages/fast_rx/score)

## Features
| Class       | Use-case                                    |
| ----------- | ------------------------------------------- |
| FastBuilder | Rebuilds when reactive values within change |
| RxValue<T>  | A reactive value                            |
| RxObject<T> | A reactive object                           |
| RxList<E>   | A reactive list                             |
| RxMap<E>    | A reactive map                              |
| RxSet<E>    | A reactive set                              |

There are convenience typedefs for RxBool, RxInt, RxDouble, and RxString

## Usage
<!-- embedme readme/usage.dart -->
```dart
import 'package:fast_rx/fast_rx.dart';
import 'package:flutter/material.dart';

void example() {
  // ...

  final count = 0.rx;

  // ...

  // ignore: avoid_print
  count.stream.listen(print);

  // ...

  FastBuilder(() => Text('$count'));
  FastBuilder(
    () => Text('$count'),
    condition: () => true,
  );

  // ...

  // Will print the value and trigger a rebuild of FastBuilders
  count.value = 1;
}

```

### Custom RxObjects
RxObject can be used to create reactive objects of classes outside of your control.
If an object is within your control, consider making fields reactive instead.

<!-- embedme test/rx/rx_tuple.dart -->
```dart
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
  RxTuple(Tuple<T1, T2> value) : super(value);

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
  bool shouldNotify(Tuple<T1, T2> oldValue) =>
      oldValue.item1 != unregisteredValue.item1 ||
      oldValue.item2 != unregisteredValue.item2;
}

extension RxTupleExtension<T1, T2> on Tuple<T1, T2> {
  RxTuple<T1, T2> get rx => RxTuple<T1, T2>(this);
}

```

### Testing custom RxObjects
Custom RxObjects can be tested for valid registration and notifications

<!-- embedme test/rx/rx_object_test.dart -->
```dart
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
    // ignore: invalid_use_of_protected_member
    expect(() => rx.value = Tuple(0, 0), throwsUnimplementedError);
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

```

## Additional information
See [fast_ui](https://pub.dev/packages/fast_ui) for more information