A Shared Preferences implementation of fast_rx_persistence storage

[![pub package](https://img.shields.io/pub/v/fast_rx_shared_preferences)](https://pub.dev/packages/fast_rx_shared_preferences)
[![codecov](https://img.shields.io/codecov/c/github/Rexios80/fast_ui/master?flag=fast_rx_shared_preferences)](https://codecov.io/gh/Rexios80/fast_ui)
![checks](https://img.shields.io/github/checks-status/Rexios80/fast_ui/master)
[![popularity](https://img.shields.io/pub/popularity/fast_rx_shared_preferences)](https://pub.dev/packages/fast_rx_shared_preferences/score)
[![likes](https://img.shields.io/pub/likes/fast_rx_shared_preferences)](https://pub.dev/packages/fast_rx_shared_preferences/score)
[![pub points](https://img.shields.io/pub/points/fast_rx_shared_preferences)](https://pub.dev/packages/fast_rx_shared_preferences/score)

## Usage
See [fast_rx_persistence](https://pub.dev/packages/fast_rx_persistence) for detailed usage information.

<!-- embedme readme/usage.dart -->
```dart
import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_persistence/fast_rx_persistence.dart';
import 'package:fast_rx_shared_preferences/fast_rx_shared_preferences.dart';

void example() async {
  await FastRxSharedPreferences.init();

  // Will read the value of the key from Shared Preferences
  final rx = 0.rx..persist('key');

  // Will write the value to Shared Preferences
  rx.value = 1;
}

```

## Additional information
See [fast_ui](https://pub.dev/packages/fast_ui) for more information