/// An exception thrown by FastNav
abstract class FastNavException implements Exception {}

/// Exception thrown when navigation methods are called for a navigator that
/// has not been registered with FastNav
abstract class NavigatorNotRegisteredException implements FastNavException {}

/// Exception thrown when navigation methods are called for a named navigator
/// that has not been registered with FastNav
class NamedNavigatorNotRegisteredException
    implements NavigatorNotRegisteredException {
  /// The name of the navigator that was not registered
  final String navigatorName;

  /// Creates a NamedNavigatorNotRegisteredException with the
  /// given [navigatorName]
  NamedNavigatorNotRegisteredException(this.navigatorName);

  @override
  String toString() => 'Navigator with name $navigatorName not registered.'
      ' Call FastNav.registerNavigator() first.';
}

/// Exception thrown when navigation methods are called and the root navigator
/// has not been registered with FastNav
class RootNavigatorNotRegisteredException
    implements NavigatorNotRegisteredException {
  @override
  String toString() => 'Root navigator not registered.'
      ' Call FastNav.init() first.';
}
