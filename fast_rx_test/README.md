Testing utilities for [fast_rx](https://pub.dev/packages/fast_rx)

[![pub package](https://img.shields.io/pub/v/fast_rx_test.svg?label=fast_rx_test)](https://pub.dev/packages/fast_rx_test)
![checks](https://img.shields.io/github/checks-status/Rexios80/fast_ui/master)
[![popularity](https://badges.bar/fast_rx_test/popularity)](https://pub.dev/packages/fast_rx_test/score)
[![likes](https://badges.bar/fast_rx_test/likes)](https://pub.dev/packages/fast_rx_test/score)
[![pub points](https://badges.bar/fast_rx_test/pub%20points)](https://pub.dev/packages/fast_rx_test/score)

## Features

| Method               | Use-case                                         |
| -------------------- | ------------------------------------------------ |
| expectRxRegistration | Check for valid registration with the RxNotifier |

## Getting started

See [fast_rx](https://pub.dev/packages/fast_rx)

## Usage

<!-- embedme ../fast_rx/test/rx/rx_object_test.dart -->
```dart
import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
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

```

## Additional information

See [fast_ui](https://pub.dev/packages/fast_ui) for more information