/// An exception thrown by FastRxPrefs
abstract class FastRxPrefsException implements Exception {}

/// Exception thrown when FastRxPrefs has not been initialized
class FastRxPrefsNotInitialized implements FastRxPrefsException {
  @override
  String toString() => 'FastRxPrefs must be initialized before use.'
      ' Call FastRxPrefs.init() first.';
}
