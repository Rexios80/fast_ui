Testing utilities for [fast_rx](https://pub.dev/packages/fast_rx)

[![pub package](https://img.shields.io/pub/v/fast_rx_test)](https://pub.dev/packages/fast_rx_test)
![checks](https://img.shields.io/github/checks-status/Rexios80/fast_ui/master)
[![popularity](https://img.shields.io/pub/popularity/fast_rx_test)](https://pub.dev/packages/fast_rx_test/score)
[![likes](https://img.shields.io/pub/likes/fast_rx_test)](https://pub.dev/packages/fast_rx_test/score)
[![pub points](https://img.shields.io/pub/points/fast_rx_test)](https://pub.dev/packages/fast_rx_test/score)

## Features

| Method               | Use-case                                         |
| -------------------- | ------------------------------------------------ |
| expectRxNotification | Check for valid rx stream notifications          |
| expectRxRegistration | Check for valid registration with the RxNotifier |

## Getting started

See [fast_rx](https://pub.dev/packages/fast_rx)

## Usage

<!-- embedme ../fast_rx/test/rx/rx_object_test.dart -->
```dart
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'rx_tuple.dart';

void main() {
  final shouldNotify = <RxTest<RxTuple<int, int>>>[
    RxTest(() => Tuple(1, 2).rx, (rx) => rx.item1 = 3),
    RxTest(() => Tuple(1, 2).rx, (rx) => rx.item2 = 3),
    RxTest(
      () => Tuple(1, 2).rx,
      (rx) => rx.run(() {
        rx.item1 = 3;
        rx.item2 = 3;
      }),
    ),
  ];
  final shouldRegister = <RxTest<RxTuple<int, int>>>[
    RxTest(() => Tuple(1, 2).rx, (rx) => rx.item1),
    RxTest(() => Tuple(1, 2).rx, (rx) => rx.item2),
  ];
  final shouldNotNotifyOrRegister = <RxTest<RxTuple<int, int>>>[
    RxTest(() => Tuple(1, 2).rx, (rx) => rx.copyValue()),
    RxTest(() => Tuple(1, 2).rx, (rx) => rx.shouldNotify(Tuple(2, 2))),
    // ignore: invalid_use_of_protected_member
    RxTest(() => Tuple(1, 2).rx, (rx) => rx.internalSetValue(Tuple(1, 3))),
  ];

  test('RxObject registration and notifications', () {
    expectRx(
      shouldRegister: shouldRegister,
      shouldNotRegister: shouldNotify + shouldNotNotifyOrRegister,
      shouldNotify: shouldNotify,
      shouldNotNotify: shouldRegister + shouldNotNotifyOrRegister,
    );
  });
}

```

## Additional information

See [fast_ui](https://pub.dev/packages/fast_ui) for more information