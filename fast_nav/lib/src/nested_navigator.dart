import 'package:fast_nav/fast_nav.dart';
import 'package:flutter/material.dart';

/// A simple nested navigator that is automatically registered with [FastNav]
class NestedNavigator extends StatelessWidget {
  /// The navigator key
  final GlobalKey<NavigatorState> navigatorKey;

  /// The name of the nested navigator
  final String name;

  /// [NavigatorObserver]s to be added to the nested navigator
  final Iterable<NavigatorObserver> observers;

  /// Called to generate a route for a given [RouteSettings].
  final RouteFactory? onGenerateRoute;

  /// The home page of the navigator
  final Widget? home;

  /// Create a nested navigator
  ///
  /// Automatically registered with [FastNav]
  NestedNavigator({
    super.key,
    GlobalKey<NavigatorState>? navigatorKey,
    required this.name,
    this.observers = const [],
    this.onGenerateRoute,
    this.home,
  }) : navigatorKey = navigatorKey ?? GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: FastNav.registerNavigator(name, key: navigatorKey),
      observers: [FastNavObserver(name), ...observers],
      onGenerateRoute: (settings) {
        final route = onGenerateRoute?.call(settings);
        if (route != null) {
          return route;
        } else if (home != null) {
          return FastNav.generateAnonymousRoute(
            settings: settings,
            page: home!,
          );
        } else {
          return null;
        }
      },
    );
  }
}
