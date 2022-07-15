/// An exception thrown by FastRxSharedPreferences
abstract class FastRxSharedPreferencesException implements Exception {}

/// Exception thrown when FastRxSharedPreferences has not been initialized
class FastRxSharedPreferencesNotInitialized
    implements FastRxSharedPreferencesException {
  @override
  String toString() => 'FastRxSharedPreferences must be initialized before use.'
      ' Call FastRxSharedPreferences.init() first.';
}
