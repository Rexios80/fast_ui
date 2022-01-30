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

  /// [NavigatorObserver]s to be added to the nested navigator
  final Iterable<NavigatorObserver> observers;

  /// Called to generate a route for a given [RouteSettings].
  final RouteFactory? onGenerateRoute;

  /// Create a nested navigator
  ///
  /// Automatically registered with [FastNav]
  NestedNavigator({
    Key? key,
    GlobalKey<NavigatorState>? navigatorKey,
    required this.name,
    required this.home,
    this.observers = const [],
    this.onGenerateRoute,
  })  : navigatorKey = navigatorKey ?? GlobalKey<NavigatorState>(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: FastNav.registerNavigator(name, key: navigatorKey),
      observers: [FastNavObserver(name), ...observers],
      onGenerateRoute: (settings) =>
          onGenerateRoute?.call(settings) ??
          FastNav.generateAnonymousRoute(settings: settings, page: home),
    );
  }
}
