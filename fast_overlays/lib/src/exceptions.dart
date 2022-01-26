/// An exception thrown by FastOverlays
abstract class FastOverlaysException implements Exception {}

/// Exception thrown when FastOverlays has not been initialized
class FastOverlaysNotInitializedException implements FastOverlaysException {
  @override
  String toString() => 'FastOverlays must be initialized before use.'
      ' Call FastOverlays.init() first.';
}
