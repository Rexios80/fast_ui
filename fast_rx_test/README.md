Testing utilities for [fast_rx](https://pub.dev/packages/fast_rx)

[![pub package](https://img.shields.io/pub/v/fast_rx_test.svg?label=fast_rx_test)](https://pub.dev/packages/fast_rx_test)
![checks](https://img.shields.io/github/checks-status/Rexios80/fast_ui/master)
[![popularity](https://badges.bar/fast_rx_test/popularity)](https://pub.dev/packages/fast_rx_test/score)
[![likes](https://badges.bar/fast_rx_test/likes)](https://pub.dev/packages/fast_rx_test/score)
[![pub points](https://badges.bar/fast_rx_test/pub%20points)](https://pub.dev/packages/fast_rx_test/score)

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
    RxTest(Tuple(1, 2).rx, (rx) => rx.item1 = 3),
    RxTest(Tuple(1, 2).rx, (rx) => rx.item2 = 3),
  ];
  final shouldRegister = <RxTest<RxTuple<int, int>>>[
    RxTest(Tuple(1, 2).rx, (rx) => rx.item1),
    RxTest(Tuple(1, 2).rx, (rx) => rx.item2),
  ];
  final shouldNotNotifyOrRegister = <RxTest<RxTuple<int, int>>>[
    RxTest(Tuple(1, 2).rx, (rx) => rx.copyValue()),
    RxTest(Tuple(1, 2).rx, (rx) => rx.shouldNotify(Tuple(2, 2))),
  ];

  test('RxObject notifications', () {
    expectRxNotification(
      shouldNotify: shouldNotify,
      shouldNotNotify: shouldRegister + shouldNotNotifyOrRegister,
    );
  });

  test('RxObject registration', () {
    expectRxRegistration(
      shouldRegister: shouldRegister,
      shouldNotRegister: shouldNotify + shouldNotNotifyOrRegister,
    );
  });
}

```

## Additional information

See [fast_ui](https://pub.dev/packages/fast_ui) for more information