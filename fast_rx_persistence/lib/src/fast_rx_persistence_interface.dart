/// Interface to get and set values from a key/value store
abstract class FastRxPersistenceInterface {
  /// Get a value from the key/value store
  Object? get(String key);

  /// Set a value in the key/value store
  void set(String key, Object? value);
}
