/// An exception thrown by FastNav
abstract class FastNavException implements Exception {}

/// Exception thrown when navigation methods are called for a navigator that
/// has not been registered with FastNav
class NavigatorNotRegisteredException implements FastNavException {
  /// The name of the navigator that was not registered
  final String? navigatorName;

  /// Creates a NavigatorNotRegisteredException with the given [navigatorName]
  NavigatorNotRegisteredException({this.navigatorName});

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

/// Exception thrown when navigation methods are called and the root navigator
/// has not been registered with FastNav
class RootNavigatorNotRegisteredException
    implements NavigatorNotRegisteredException {
  @override
  String toString() => 'Root navigator not registered.'
      ' Call FastNav.init() first.';
}
