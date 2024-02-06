An interface for implementing fast_rx key/value store persistence

[![pub package](https://img.shields.io/pub/v/fast_rx_persistence)](https://pub.dev/packages/fast_rx_persistence)
[![codecov](https://img.shields.io/codecov/c/github/Rexios80/fast_ui/master?flag=fast_rx_persistence)](https://codecov.io/gh/Rexios80/fast_ui)
![checks](https://img.shields.io/github/checks-status/Rexios80/fast_ui/master)
[![popularity](https://img.shields.io/pub/popularity/fast_rx_persistence)](https://pub.dev/packages/fast_rx_persistence/score)
[![likes](https://img.shields.io/pub/likes/fast_rx_persistence)](https://pub.dev/packages/fast_rx_persistence/score)
[![pub points](https://img.shields.io/pub/points/fast_rx_persistence)](https://pub.dev/packages/fast_rx_persistence/score)

## Features
| Class                      | Use-case                                                    |
| -------------------------- | ----------------------------------------------------------- |
| FastRxPersistenceInterface | Interface for getting/setting values in the key/value store |
| FastRxPersistenceConverter | Used to convert a value to/from a persistence store         |
| InlineConverter            | Convenience class to create a custom converter inline       |
| EnumStringConverter        | Convenience class to convert an enum to/from string         |
| EnumIntConverter           | Convenience class to convert an enum to/from int            |


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
    ..persist(
      'key',
      // The store can optionally be overridden on a per-value basis.
      // Otherwise the store passed into [FastRxPersistence.init] will be
      // used.
      store: Store(),
      converter: PersistenceConverter.inline(
        fromStore: int.parse,
        toStore: (value) => value.toString(),
      ),
    );

  // Saves the value to the store as a string
  rx2.value = 2;

  // An example of persistence with an enum
  final rx3 = TestEnum.one.rx
    ..persist(
      'key',
      converter: EnumPersistenceConverter.string(TestEnum.values),
    );

  // Saves the value to the store as a string
  rx3.value = TestEnum.two;
}

class Store extends FastRxPersistenceInterface {
  final _store = <String, dynamic>{};

  @override
  Object? get(String key) => _store[key];

  @override
  void set(String key, Object? value) => _store[key] = value;
}

enum TestEnum { one, two }

```

## Additional information
See [fast_ui](https://pub.dev/packages/fast_ui) for more information