import 'package:fast_nav/fast_nav.dart';
import 'package:flutter/material.dart';

/// A simple nested navigator that is automatically registered with [FastNav]
class NestedNavigator extends StatelessWidget {
  /// The navigator key
  final GlobalKey<NavigatorState> navigatorKey;

  /// The name of the nested navigator
  final String name;

  /// The home page of the navigator
  final Widget home;

  /// Create a nested navigator
  ///
  /// Automatically registered with [FastNav]
  const NestedNavigator({
    Key? key,
    required this.navigatorKey,
    required this.name,
    required this.home,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: FastNav.registerNavigator(key: navigatorKey, name: name),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings, builder: (context) => home);
      },
    );
  }
}
