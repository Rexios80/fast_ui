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
      converter: EnumPersistenceConverter.string(),
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
