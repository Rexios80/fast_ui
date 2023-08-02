import 'package:fast_nav/src/context_extension.dart';
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

  static BuildContext _getContext(String? navigator) {
    navigator ??= _rootNavigatorName;
    if (!_navigatorKeys.containsKey(navigator)) {
      throw NavigatorNotRegistered(
        navigator: navigator == _rootNavigatorName ? null : navigator,
      );
    }
    return _navigatorKeys[navigator]!.currentContext!;
  }

  /// Reset [FastNav] for testing
  @visibleForTesting
  static void reset() => _navigatorKeys.clear();

  //* Common navigation methods

  /// Pop the current page
  static void pop<T extends Object?>({String? navigator, T? result}) =>
      _getContext(navigator).pop<T>(result);

  /// Whether the navigator can be popped
  static bool canPop({String? navigator}) => _getContext(navigator).canPop();

  //* Anonymous navigation

  /// Navigate to an anonymous page route
  static Future<T?> push<T extends Object?>(
    Widget page, {
    String? navigator,
    RouteType? routeType,
    RouteSettings? settings,
    bool? maintainState,
    bool? fullscreenDialog,
    bool? allowSnapshotting,
  }) =>
      _getContext(navigator).push<T>(
        page,
        routeType: routeType,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        allowSnapshotting: allowSnapshotting,
      );

  /// Replace the current page with a new anonymous page route
  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Widget page, {
    String? navigator,
    RouteType? routeType,
    RouteSettings? settings,
    bool? maintainState,
    bool? fullscreenDialog,
    bool? allowSnapshotting,
    TO? result,
  }) =>
      _getContext(navigator).pushReplacement<T, TO>(
        page,
        routeType: routeType,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        allowSnapshotting: allowSnapshotting,
        result: result,
      );

  /// Remove pages until [predicate] returns true and push a new anonymous page route
  static Future<T?> pushAndRemoveUntil<T extends Object?>(
    Widget page,
    bool Function(Route<dynamic> route) predicate, {
    String? navigator,
    RouteType? routeType,
    RouteSettings? settings,
    bool? maintainState,
    bool? fullscreenDialog,
    bool? allowSnapshotting,
  }) =>
      _getContext(navigator).pushAndRemoveUntil<T>(
        page,
        routeType: routeType,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        allowSnapshotting: allowSnapshotting,
        predicate,
      );

  /// Remove all pages and push a new anonymous page route
  static Future<T?> pushAndRemoveAll<T extends Object?>(
    Widget page, {
    String? navigator,
    RouteType? routeType,
    RouteSettings? settings,
    bool? maintainState,
    bool? fullscreenDialog,
    bool? allowSnapshotting,
  }) =>
      _getContext(navigator).pushAndRemoveUntil<T>(
        page,
        routeType: routeType,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        allowSnapshotting: allowSnapshotting,
        (_) => false,
      );

  //* Named navigation

  /// Navigate to a named page route
  static Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    String navigator = _rootNavigatorName,
    Object? arguments,
  }) =>
      _getContext(navigator).pushNamed<T>(
        routeName,
        arguments: arguments,
      );

  /// Replace the current page with a named page route
  static Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    String navigator = _rootNavigatorName,
    TO? result,
    Object? arguments,
  }) =>
      _getContext(navigator).pushReplacementNamed<T, TO>(
        routeName,
        result: result,
        arguments: arguments,
      );

  /// Remove pages until [predicate] returns true and push a named page route
  static Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    bool Function(Route<dynamic> route) predicate, {
    String navigator = _rootNavigatorName,
    Object? arguments,
  }) =>
      _getContext(navigator).pushNamedAndRemoveUntil<T>(
        newRouteName,
        predicate,
        arguments: arguments,
      );

  /// Remove all pages and push a named page route
  static Future<T?> pushNamedAndRemoveAll<T extends Object?>(
    String newRouteName, {
    String navigator = _rootNavigatorName,
    Object? arguments,
  }) =>
      _getContext(navigator).pushNamedAndRemoveUntil<T>(
        newRouteName,
        (_) => false,
        arguments: arguments,
      );
}
