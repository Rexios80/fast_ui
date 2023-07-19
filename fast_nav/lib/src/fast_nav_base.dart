import 'package:fast_nav/src/exceptions.dart';
import 'package:flutter/material.dart';

/// Contextless navigator
class FastNav {
  FastNav._(); // coverage:ignore-line

  static const _rootNavigatorName = '_rootNavigator';
  static final _navigatorKeys = <String, GlobalKey<NavigatorState>>{};

  /// Register the root navigator with [FastNav]
  ///
  /// Call in the [MaterialApp] constructor
  static GlobalKey<NavigatorState> init([GlobalKey<NavigatorState>? key]) =>
      registerNavigator(_rootNavigatorName, key: key);

  /// Register a nested navigator with [FastNav]
  ///
  /// Each navigator [name] can only be registered once. Subsequent
  /// registrations will return the existing [GlobalKey].
  static GlobalKey<NavigatorState> registerNavigator(
    String name, {
    GlobalKey<NavigatorState>? key,
  }) =>
      _navigatorKeys[name] ??= key ?? GlobalKey<NavigatorState>();

  static NavigatorState _getNavigatorState(String navigatorName) {
    if (!_navigatorKeys.containsKey(navigatorName)) {
      throw NavigatorNotRegistered(
        navigatorName:
            navigatorName == _rootNavigatorName ? null : navigatorName,
      );
    }
    return _navigatorKeys[navigatorName]!.currentState!;
  }

  /// Reset [FastNav] for testing
  @visibleForTesting
  static void reset() => _navigatorKeys.clear();

  //* Common navigation methods

  /// Pop the current page
  static void pop<T extends Object?>({
    String navigatorName = _rootNavigatorName,
    T? result,
  }) =>
      _getNavigatorState(navigatorName).pop<T>(result);

  /// Whether the navigator can be popped
  static bool canPop({String navigatorName = _rootNavigatorName}) =>
      _getNavigatorState(navigatorName).canPop();

  //* Anonymous navigation

  /// Navigate to an anonymous page route
  static Future<T?> push<T extends Object?>(
    Widget page, {
    String navigatorName = _rootNavigatorName,
    RouteSettings settings = const RouteSettings(),
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) =>
      _getNavigatorState(navigatorName).push<T>(
        MaterialPageRoute<T>(
          builder: (_) => page,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        ),
      );

  /// Replace the current page with a new anonymous page route
  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Widget page, {
    String navigatorName = _rootNavigatorName,
    RouteSettings settings = const RouteSettings(),
    bool maintainState = true,
    bool fullscreenDialog = false,
    TO? result,
  }) =>
      _getNavigatorState(navigatorName).pushReplacement<T, TO>(
        MaterialPageRoute<T>(
          builder: (_) => page,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        ),
        result: result,
      );

  /// Remove pages until [predicate] returns true and push a new anonymous page route
  static Future<T?> pushAndRemoveUntil<T extends Object?>(
    Widget page,
    bool Function(Route<dynamic> route) predicate, {
    String navigatorName = _rootNavigatorName,
    RouteSettings settings = const RouteSettings(),
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) =>
      _getNavigatorState(navigatorName).pushAndRemoveUntil<T>(
        MaterialPageRoute<T>(
          builder: (_) => page,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        ),
        predicate,
      );

  /// Remove all pages and push a new anonymous page route
  static Future<T?> pushAndRemoveAll<T extends Object?>(
    Widget page, {
    String navigatorName = _rootNavigatorName,
    RouteSettings settings = const RouteSettings(),
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) =>
      _getNavigatorState(navigatorName).pushAndRemoveUntil<T>(
        MaterialPageRoute<T>(
          builder: (_) => page,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        ),
        (_) => false,
      );

  //* Named navigation

  /// Navigate to a named page route
  static Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    String navigatorName = _rootNavigatorName,
    Object? arguments,
  }) =>
      _getNavigatorState(navigatorName).pushNamed<T>(
        routeName,
        arguments: arguments,
      );

  /// Replace the current page with a named page route
  static Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    String navigatorName = _rootNavigatorName,
    TO? result,
    Object? arguments,
  }) =>
      _getNavigatorState(navigatorName).pushReplacementNamed<T, TO>(
        routeName,
        result: result,
        arguments: arguments,
      );

  /// Remove pages until [predicate] returns true and push a named page route
  static Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    bool Function(Route<dynamic> route) predicate, {
    String navigatorName = _rootNavigatorName,
    Object? arguments,
  }) =>
      _getNavigatorState(navigatorName).pushNamedAndRemoveUntil<T>(
        newRouteName,
        predicate,
        arguments: arguments,
      );

  /// Remove all pages and push a named page route
  static Future<T?> pushNamedAndRemoveAll<T extends Object?>(
    String newRouteName, {
    String navigatorName = _rootNavigatorName,
    Object? arguments,
  }) =>
      _getNavigatorState(navigatorName).pushNamedAndRemoveUntil<T>(
        newRouteName,
        (_) => false,
        arguments: arguments,
      );
}
