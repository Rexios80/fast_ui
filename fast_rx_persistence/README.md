An interface for implementing fast_rx key/value store persistence

[![pub package](https://img.shields.io/pub/v/fast_rx_persistence.svg?label=fast_rx_persistence)](https://pub.dev/packages/fast_rx_persistence)
[![codecov](https://codecov.io/gh/Rexios80/fast_ui/branch/master/graph/badge.svg?flag=fast_rx_persistence)](https://codecov.io/gh/Rexios80/fast_ui)
![checks](https://img.shields.io/github/checks-status/Rexios80/fast_ui/master)
[![popularity](https://badges.bar/fast_rx_persistence/popularity)](https://pub.dev/packages/fast_rx_persistence/score)
[![likes](https://badges.bar/fast_rx_persistence/likes)](https://pub.dev/packages/fast_rx_persistence/score)
[![pub points](https://badges.bar/fast_rx_persistence/pub%20points)](https://pub.dev/packages/fast_rx_persistence/score)

## Features
| Class                      | Use-case                                                    |
| -------------------------- | ----------------------------------------------------------- |
| FastRxPersistenceInterface | Interface for getting/setting values in the key/value store |

## Usage
A Shared Preferences implementation is provided by [fast_rx_shared_preferences](https://pub.dev/packages/fast_rx_shared_preferences)

Simply call `.persist()` on any Rx value to persist it to the key/value store
<!-- embedme readme/usage.dart -->
```dart
import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_persistence/fast_rx_persistence.dart';

void example() {
  FastRxPersistence.init(Store());

  // Simple example of persistence
  // Here 0 is the default value. If a value exists in the store for the given
  // key, the given value will be replaced by the value in the store.
  final rx = 0.rx..persist('key');

  // Saves the value to the store and notifies listeners
  rx.value = 1;

  // An example of persistence with value transformation
  final rx2 = 0.rx
    // The type here is [String] since that is the type stored in the store
    ..persist<String>(
      'key',
      // The store can optionally be overridden on a per-value basis.
      // Otherwise the store passed into [FastRxPersistence.init] will be
      // used.
      store: Store(),
      decode: int.parse,
      encode: (value) => value.toString(),
    );

  // Saves the value to the store as a string
  rx2.value = 2;
}

class Store extends FastRxPersistenceInterface {
  final _store = <String, dynamic>{};

  @override
  Object? get(String key) => _store[key];

  @override
  void set(String key, Object? value) => _store[key] = value;
}

```

## Additional information
See [fast_ui](https://pub.dev/packages/fast_ui) for more information