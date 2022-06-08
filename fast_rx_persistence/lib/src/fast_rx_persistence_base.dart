import 'package:fast_rx_persistence/src/exceptions.dart';
import 'package:fast_rx_persistence/src/fast_rx_persistence_interface.dart';
import 'package:fast_rx/fast_rx.dart';
import 'package:flutter/foundation.dart';

/// A fast_rx implementation of key/value store persistence
class FastRxPersistence {
  FastRxPersistence._(); // coverage:ignore-line

  static FastRxPersistenceInterface? _interface;

  /// The [FastRxPersistenceInterface] instance
  ///
  /// Must call [init] before accessing
  static FastRxPersistenceInterface get interface {
    _checkInit();
    return _interface!;
  }

  /// Initialize the internal [interface] instance. Must be called
  /// before using any other features. Subsequent calls will have no effect.
  static void init(FastRxPersistenceInterface interface) async {
    _interface ??= interface;
  }

  /// Reset the [interface] to null for testing
  @visibleForTesting
  static void reset() {
    _interface = null;
  }

  static void _checkInit() {
    try {
      _interface!;
    } catch (e) {
      throw FastRxPersistenceNotInitialized();
    }
  }
}

/// Extension on [Rx] to persist the value to a key/value store
extension RxPrefsExtension<T> on Rx<T> {
  /// Persist the value though the [interface]
  /// - [I] - The internal type of the value stored in the store
  /// - [key] - The key used to store the value
  /// - [interface] - An optional override of the default
  /// [FastRxPersistenceInterface] given with [FastRxPersistence.init]
  /// - [decode] - A function to transform the internal store value
  /// from type [I] to type [T]
  /// - [encode] - A function to transform the value from type [T] to type
  /// [I] for storage in the store
  ///
  /// The value is saved through the [interface] when the notification [stream]
  /// emits an update
  void persist<I>(
    String key, {
    FastRxPersistenceInterface? interface,
    T Function(I value)? decode,
    I Function(T value)? encode,
  }) {
    FastRxPersistence._checkInit();

    final store = interface ?? FastRxPersistence.interface;

    final prefValue = store.get(key);
    if (prefValue != null) {
      value = decode?.call(prefValue as I) ?? prefValue as T;
    }

    stream.listen((value) {
      final prefValue = encode?.call(value) ?? value as I;
      store.set(key, prefValue);
    });
  }
}
