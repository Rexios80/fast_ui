/// An exception thrown by FastRxPersistence
abstract class FastRxPersistenceException implements Exception {}

/// Exception thrown when FastRxPersistence has not been initialized
class FastRxPersistenceNotInitialized implements FastRxPersistenceException {
  @override
  String toString() => 'FastRxPersistence must be initialized before use.'
      ' Call FastRxPersistence.init() first.';
}
