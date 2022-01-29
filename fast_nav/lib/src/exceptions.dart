/// An exception thrown by FastNav
abstract class FastNavException implements Exception {}

/// Exception thrown when navigation methods are called for a navigator that
/// has not been registered with FastNav
class NavigatorNotRegistered implements FastNavException {
  /// The name of the navigator that was not registered
  final String? navigatorName;

  /// Creates a [NavigatorNotRegistered] with the given [navigatorName]
  NavigatorNotRegistered({this.navigatorName});

  @override
  String toString() {
    if (navigatorName == null) {
      return 'Root navigator not registered. Call FastNav.init() first.';
    } else {
      return 'Navigator with name $navigatorName not registered.'
          ' Call FastNav.registerNavigator() first.';
    }
  }
}

/// Exception thrown when navigation history is required for a navigator that
/// that has not registered an observer with FastNav
class NavigatorObserverNotRegistered implements FastNavException {
  /// The name of the navigator without a registered observer
  final String? navigatorName;

  /// Creates a [NavigatorObserverNotRegistered] with the given [navigatorName]
  NavigatorObserverNotRegistered({this.navigatorName});

  @override
  String toString() {
    if (navigatorName == null) {
      return 'Root navigator has no registered observer.'
          ' Add a FastNavObserver to the root navigator first.';
    } else {
      return 'Navigator with name $navigatorName has no registered observer.'
          ' Add a FastNavObserver to the navigator first.';
    }
  }
}
