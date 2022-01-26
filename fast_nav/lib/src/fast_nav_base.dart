import 'package:fast_nav/src/exceptions.dart';
import 'package:flutter/material.dart';

/// Contextless navigator
class FastNav {
  FastNav._();

  static const _rootNavigatorName = '_rootNavigator';
  static final _navigatorKeys = <String, GlobalKey<NavigatorState>>{};

  /// Register the root navigator with [FastNav]
  ///
  /// Call in the [MaterialApp] constructor
  static GlobalKey<NavigatorState> init(GlobalKey<NavigatorState> key) {
    return registerNavigator(key: key, name: _rootNavigatorName);
  }

  /// Register a nested navigator with [FastNav]
  static GlobalKey<NavigatorState> registerNavigator({
    required GlobalKey<NavigatorState> key,
    required String name,
  }) {
    return _navigatorKeys[name] = key;
  }

  static void _checkInit(String navigatorName) {
    if (!_navigatorKeys.containsKey(navigatorName)) {
      if (navigatorName == _rootNavigatorName) {
        throw RootNavigatorNotRegisteredException();
      } else {
        throw NamedNavigatorNotRegisteredException(navigatorName);
      }
    }
  }

  static NavigatorState _getNavigatorState(String navigatorName) {
    return _navigatorKeys[navigatorName]!.currentState!;
  }

  //* Common navigation methods

  /// Pop the current page
  static void pop<T extends Object?>({
    String navigatorName = _rootNavigatorName,
    T? result,
  }) {
    _checkInit(navigatorName);
    return _getNavigatorState(navigatorName).pop<T>(result);
  }

  /// Whether the navigator can be popped
  static bool canPop({String navigatorName = _rootNavigatorName}) {
    _checkInit(navigatorName);
    return _getNavigatorState(navigatorName).canPop();
  }

  //* Anonymous navigation

  /// Navigate to an anonymous page route
  static Future<T?> push<T extends Object?>(
    Widget page, {
    String navigatorName = _rootNavigatorName,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    _checkInit(navigatorName);
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
    String navigatorName = _rootNavigatorName,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    TO? result,
  }) {
    _checkInit(navigatorName);
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
    String navigatorName = _rootNavigatorName,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    _checkInit(navigatorName);
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
    String navigatorName = _rootNavigatorName,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    _checkInit(navigatorName);
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
    String navigatorName = _rootNavigatorName,
    Object? arguments,
  }) {
    _checkInit(navigatorName);
    return _getNavigatorState(navigatorName).pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

  /// Replace the current page with a named page route
  static Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    String navigatorName = _rootNavigatorName,
    TO? result,
    Object? arguments,
  }) {
    _checkInit(navigatorName);
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
    String navigatorName = _rootNavigatorName,
    Object? arguments,
  }) {
    _checkInit(navigatorName);
    return _getNavigatorState(navigatorName).pushNamedAndRemoveUntil<T>(
      newRouteName,
      predicate,
      arguments: arguments,
    );
  }

  /// Remove all pages and push a named page route
  static Future<T?> pushNamedAndRemoveAll<T extends Object?>(
    String newRouteName, {
    String navigatorName = _rootNavigatorName,
    Object? arguments,
  }) {
    _checkInit(navigatorName);
    return _getNavigatorState(navigatorName).pushNamedAndRemoveUntil<T>(
      newRouteName,
      (_) => false,
      arguments: arguments,
    );
  }
}
