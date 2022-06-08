fast_rx_prefs is a fast_rx implementation of Shared Preferences

[![pub package](https://img.shields.io/pub/v/fast_rx_prefs.svg?label=fast_rx_prefs)](https://pub.dev/packages/fast_rx_prefs)
[![codecov](https://codecov.io/gh/Rexios80/fast_ui/branch/master/graph/badge.svg?flag=fast_rx_prefs)](https://codecov.io/gh/Rexios80/fast_ui)
![checks](https://img.shields.io/github/checks-status/Rexios80/fast_ui/master)
[![popularity](https://badges.bar/fast_rx_prefs/popularity)](https://pub.dev/packages/fast_rx_prefs/score)
[![likes](https://badges.bar/fast_rx_prefs/likes)](https://pub.dev/packages/fast_rx_prefs/score)
[![pub points](https://badges.bar/fast_rx_prefs/pub%20points)](https://pub.dev/packages/fast_rx_prefs/score)

## Features
| Class     | Use-case            |
| --------- | ------------------- |
| RxPref<T> | Reactive preference |

## Usage
<!-- embedme readme/usage.dart -->
```dart
import 'package:fast_rx_prefs/fast_rx_prefs.dart';
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

## Additional information
See [fast_ui](https://pub.dev/packages/fast_ui) for more information