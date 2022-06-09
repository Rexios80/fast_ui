import 'package:fast_rx_persistence/src/exceptions.dart';
import 'package:fast_rx_persistence/src/fast_rx_persistence_interface.dart';
import 'package:fast_rx/fast_rx.dart';
import 'package:flutter/foundation.dart';

/// A fast_rx implementation of key/value store persistence
class FastRxPersistence {
  FastRxPersistence._(); // coverage:ignore-line

  static FastRxPersistenceInterface? _store;

  /// The [FastRxPersistenceInterface] instance
  ///
  /// Must call [init] before accessing
  static FastRxPersistenceInterface get store {
    _checkInit();
    return _store!;
  }

  /// Initialize the internal [store] instance. Must be called
  /// before using any other features. Subsequent calls will have no effect.
  static void init(FastRxPersistenceInterface store) async {
    _store ??= store;
  }

  /// Reset the [store] to null for testing
  @visibleForTesting
  static void reset() {
    _store = null;
  }

  static void _checkInit() {
    try {
      _store!;
    } catch (e) {
      throw FastRxPersistenceNotInitialized();
    }
  }
}

/// Extension on [Rx] to persist the value to a key/value store
extension RxPrefsExtension<T> on Rx<T> {
  /// Persist the value though the [store]
  /// - [I] - The internal type of the value stored in the store
  /// - [key] - The key used to store the value
  /// - [store] - An optional override of the default
  /// [FastRxPersistenceInterface] given with [FastRxPersistence.init]
  /// - [decode] - A function to transform the internal store value
  /// from type [I] to type [T]
  /// - [encode] - A function to transform the value from type [T] to type
  /// [I] for storage in the store
  ///
  /// On initialization, the store is asked for an existing value for the [key].
  /// If one exists, the current [value] is replaced and listeners are notified.
  /// If no value exists, then the given [value] is left as the default.
  ///
  /// The value is saved through the [store] when the notification [stream]
  /// emits an update
  void persist<I>(
    String key, {
    FastRxPersistenceInterface? store,
    T Function(I value)? decode,
    I Function(T value)? encode,
  }) {
    assert(
      (decode == null && encode == null) || (decode != null && encode != null),
    );

    FastRxPersistence._checkInit();

    final interface = store ?? FastRxPersistence.store;

    final prefValue = interface.get(key);
    if (prefValue != null) {
      value = decode?.call(prefValue as I) ?? prefValue as T;
    }

    stream.listen((value) {
      final prefValue = encode?.call(value) ?? value as I;
      interface.set(key, prefValue);
    });
  }
}
