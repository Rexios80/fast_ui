/// An exception thrown by FastNav
abstract class FastNavException implements Exception {}

/// Exception thrown when navigation methods are called for a navigator that
/// has not been registered with FastNav
class NavigatorNotRegistered implements FastNavException {
  /// The name of the navigator that was not registered
  final String? navigator;

  /// Creates a [NavigatorNotRegistered] with the given [navigator]
  NavigatorNotRegistered({this.navigator});

  @override
  String toString() {
    if (navigator == null) {
      return 'Root navigator not registered. Call FastNav.init() first.';
    } else {
      return 'Navigator with name $navigator not registered.'
          ' Call FastNav.registerNavigator() first.';
    }
  }
}
