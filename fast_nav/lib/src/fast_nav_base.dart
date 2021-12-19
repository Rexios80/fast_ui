import 'package:flutter/material.dart';

/// Contextless navigator
class FastNav {
  static const _rootNavigatorName = '_rootNavigator';
  static final _navigatorKeys = <String, GlobalKey<NavigatorState>>{};

  /// Register the default navigator with [FastNav]
  ///
  /// Must be called before calling any navigation methods
  static GlobalKey<NavigatorState> setRootNavigator(
    GlobalKey<NavigatorState> key,
  ) {
    return _navigatorKeys[_rootNavigatorName] = key;
  }

  /// Register a nested navigator with [FastNav]
  static GlobalKey<NavigatorState> addNavigator(
    String name,
    GlobalKey<NavigatorState> key,
  ) {
    return _navigatorKeys[name] = key;
  }

  static NavigatorState _getNavigatorState(String? navigatorName) {
    final navigatorKey = _navigatorKeys[navigatorName ?? _rootNavigatorName];
    if (navigatorKey == null) {
      if (navigatorName == null) {
        throw Exception(
          'Root navigator not registered.'
          ' Call FastNav.setRootNavigator() first.',
        );
      } else {
        throw Exception(
          'Navigator with name $navigatorName not registered.'
          ' Call FastNav.addNavigator() first.',
        );
      }
    }
    return navigatorKey.currentState!;
  }

  //* Common navigation methods

  /// Pop the current page
  static void pop<T extends Object?>({String? navigatorName, T? result}) {
    return _getNavigatorState(navigatorName).pop<T>(result);
  }

  //* Anonymous navigation

  /// Navigate to an anonymous page route
  static Future<T?> push<T extends Object?>(
    Widget page, {
    String? navigatorName,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    return _getNavigatorState(navigatorName).push<T>(
      MaterialPageRoute<T>(
        builder: (_) => page,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  /// Replace the current page with a new anonymous page route
  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Widget page, {
    String? navigatorName,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    TO? result,
  }) {
    return _getNavigatorState(navigatorName).pushReplacement<T, TO>(
      MaterialPageRoute<T>(
        builder: (_) => page,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
      ),
      result: result,
    );
  }

  /// Remove pages unitl [predicate] returns true and push a new anonymous page route
  static Future<T?> pushAndRemoveUntil<T extends Object?>(
    Widget page,
    bool Function(Route<dynamic> route) predicate, {
    String? navigatorName,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    return _getNavigatorState(navigatorName).pushAndRemoveUntil<T>(
      MaterialPageRoute<T>(
        builder: (_) => page,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
      ),
      predicate,
    );
  }

  /// Remove all pages and push a new anonymous page route
  static Future<T?> pushAndRemoveAll<T extends Object?>(
    Widget page, {
    String? navigatorName,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    return _getNavigatorState(navigatorName).pushAndRemoveUntil<T>(
      MaterialPageRoute<T>(
        builder: (_) => page,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
      ),
      (_) => false,
    );
  }

  //* Named navigation

  /// Navigate to a named page route
  static Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    String? navigatorName,
    Object? arguments,
  }) {
    return _getNavigatorState(navigatorName).pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

  /// Replace the current page with a named page route
  static Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    String? navigatorName,
    TO? result,
    Object? arguments,
  }) {
    return _getNavigatorState(navigatorName).pushReplacementNamed<T, TO>(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  /// Remove pages unitl [predicate] returns true and push a named page route
  static Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    bool Function(Route<dynamic> route) predicate, {
    String? navigatorName,
    Object? arguments,
  }) {
    return _getNavigatorState(navigatorName).pushNamedAndRemoveUntil<T>(
      newRouteName,
      predicate,
      arguments: arguments,
    );
  }

  /// Remove all pages and push a named page route
  static Future<T?> pushNamedAndRemoveAll<T extends Object?>(
    String newRouteName, {
    String? navigatorName,
    Object? arguments,
  }) {
    return _getNavigatorState(navigatorName).pushNamedAndRemoveUntil<T>(
      newRouteName,
      (_) => false,
      arguments: arguments,
    );
  }
}
