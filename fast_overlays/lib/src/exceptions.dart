/// An exception thrown by FastOverlays
abstract class FastOverlaysException implements Exception {}

/// Exception thrown when FastOverlays has not been initialized
class FastOverlaysNotInitialized implements FastOverlaysException {
  @override
  String toString() => 'FastOverlays must be initialized before use.'
      ' Call FastOverlays.init() first.';
}

/// Exception thrown when overlay methods are called for a scaffold that
/// has not been registered with FastOverlays
class ScaffoldNotRegistered implements FastOverlaysException {
  /// The name of the scaffold that was not registered
  final String? scaffoldName;

  /// Creates a [ScaffoldNotRegistered] with the given [scaffoldName]
  ScaffoldNotRegistered({this.scaffoldName});

  @override
  String toString() {
    if (scaffoldName == null) {
      return 'No scaffolds registered. Call FastOverlays.registerScaffold() first.';
    } else {
      return 'Scaffold with name $scaffoldName not registered.'
          ' Call FastOverlays.registerScaffold() first.';
    }
  }
}

/// Exception thrown when overlay methods are called for an invalid scaffold
/// context
class InvalidScaffoldContext implements FastOverlaysException {
  /// The name of the scaffold with invalid context
  final String? scaffoldName;

  /// Creates a [InvalidScaffoldContext] with the given [scaffoldName]
  InvalidScaffoldContext({this.scaffoldName});

  @override
  String toString() {
    if (scaffoldName == null) {
      return 'Scaffold context is invalid.'
          ' Make sure the most recently registered scaffold is in the widget tree.';
    } else {
      return 'Scaffold context is invalid.'
          ' Make sure the scaffold with name $scaffoldName is in the widget tree.';
    }
  }
}
