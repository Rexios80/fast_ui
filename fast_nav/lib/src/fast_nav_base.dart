import 'dart:async';

import 'package:fast_nav/src/exceptions.dart';
import 'package:flutter/material.dart';

/// Contextless navigator
class FastNav {
  FastNav._();

  static const _rootNavigatorName = '_rootNavigator';
  static final _navigatorKeys = <String, GlobalKey<NavigatorState>>{};
  static final _navigationStacks = <String, List<Route>>{};

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

  static void _checkInit({
    required String navigatorName,
    required bool preventDuplicates,
  }) {
    if (!_navigatorKeys.containsKey(navigatorName)) {
      throw NavigatorNotRegistered(
        navigatorName:
            navigatorName == _rootNavigatorName ? null : navigatorName,
      );
    }
    if (preventDuplicates && !_navigationStacks.containsKey(navigatorName)) {
      throw NavigatorObserverNotRegistered(
        navigatorName:
            navigatorName == _rootNavigatorName ? null : navigatorName,
      );
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
    _checkInit(navigatorName: navigatorName, preventDuplicates: false);
    return _getNavigatorState(navigatorName).pop<T>(result);
  }

  /// Whether the navigator can be popped
  static bool canPop({String navigatorName = _rootNavigatorName}) {
    _checkInit(navigatorName: navigatorName, preventDuplicates: false);
    return _getNavigatorState(navigatorName).canPop();
  }

  //* Anonymous navigation

  /// Navigate to an anonymous page route
  static FutureOr<T?> push<T extends Object?>(
    Widget page, {
    String navigatorName = _rootNavigatorName,
    bool preventDuplicates = false,
    RouteSettings settings = const RouteSettings(),
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    _checkInit(
      navigatorName: navigatorName,
      preventDuplicates: preventDuplicates,
    );
    settings = _patchRouteSettings(settings, page);
    if (preventDuplicates &&
        _navigationStacks[navigatorName]!.last.settings.name == settings.name) {
      return null;
    }
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
  static FutureOr<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Widget page, {
    String navigatorName = _rootNavigatorName,
    bool preventDuplicates = false,
    RouteSettings settings = const RouteSettings(),
    bool maintainState = true,
    bool fullscreenDialog = false,
    TO? result,
  }) {
    _checkInit(
      navigatorName: navigatorName,
      preventDuplicates: preventDuplicates,
    );
    settings = _patchRouteSettings(settings, page);
    if (preventDuplicates &&
        _navigationStacks[navigatorName]!.last.settings.name == settings.name) {
      return null;
    }
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

  /// Remove pages until [predicate] returns true and push a new anonymous page route
  static FutureOr<T?> pushAndRemoveUntil<T extends Object?>(
    Widget page,
    bool Function(Route<dynamic> route) predicate, {
    String navigatorName = _rootNavigatorName,
    bool preventDuplicates = false,
    RouteSettings settings = const RouteSettings(),
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    _checkInit(
      navigatorName: navigatorName,
      preventDuplicates: preventDuplicates,
    );
    settings = _patchRouteSettings(settings, page);
    if (preventDuplicates &&
        _navigationStacks[navigatorName]!.last.settings.name == settings.name) {
      return null;
    }
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
  static FutureOr<T?> pushAndRemoveAll<T extends Object?>(
    Widget page, {
    String navigatorName = _rootNavigatorName,
    bool preventDuplicates = false,
    RouteSettings settings = const RouteSettings(),
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    _checkInit(
      navigatorName: navigatorName,
      preventDuplicates: preventDuplicates,
    );
    settings = _patchRouteSettings(settings, page);
    if (preventDuplicates &&
        _navigationStacks[navigatorName]!.last.settings.name == settings.name) {
      return null;
    }
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
  static FutureOr<T?> pushNamed<T extends Object?>(
    String routeName, {
    String navigatorName = _rootNavigatorName,
    bool preventDuplicates = false,
    Object? arguments,
  }) {
    _checkInit(
      navigatorName: navigatorName,
      preventDuplicates: preventDuplicates,
    );
    if (preventDuplicates &&
        _navigationStacks[navigatorName]!.last.settings.name == routeName) {
      return null;
    }
    return _getNavigatorState(navigatorName).pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

  /// Replace the current page with a named page route
  static FutureOr<T?>
      pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    String navigatorName = _rootNavigatorName,
    bool preventDuplicates = false,
    TO? result,
    Object? arguments,
  }) {
    _checkInit(
      navigatorName: navigatorName,
      preventDuplicates: preventDuplicates,
    );
    if (preventDuplicates &&
        _navigationStacks[navigatorName]!.last.settings.name == routeName) {
      return null;
    }
    return _getNavigatorState(navigatorName).pushReplacementNamed<T, TO>(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  /// Remove pages until [predicate] returns true and push a named page route
  static FutureOr<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    bool Function(Route<dynamic> route) predicate, {
    String navigatorName = _rootNavigatorName,
    bool preventDuplicates = false,
    Object? arguments,
  }) {
    _checkInit(
      navigatorName: navigatorName,
      preventDuplicates: preventDuplicates,
    );
    if (preventDuplicates &&
        _navigationStacks[navigatorName]!.last.settings.name == newRouteName) {
      return null;
    }
    return _getNavigatorState(navigatorName).pushNamedAndRemoveUntil<T>(
      newRouteName,
      predicate,
      arguments: arguments,
    );
  }

  /// Remove all pages and push a named page route
  static FutureOr<T?> pushNamedAndRemoveAll<T extends Object?>(
    String newRouteName, {
    String navigatorName = _rootNavigatorName,
    bool preventDuplicates = false,
    Object? arguments,
  }) {
    _checkInit(
      navigatorName: navigatorName,
      preventDuplicates: preventDuplicates,
    );
    if (preventDuplicates &&
        _navigationStacks[navigatorName]!.last.settings.name == newRouteName) {
      return null;
    }
    return _getNavigatorState(navigatorName).pushNamedAndRemoveUntil<T>(
      newRouteName,
      (_) => false,
      arguments: arguments,
    );
  }

  //* Internal convenience methods

  /// Patch anonymous page [RouteSettings] to always have a name
  static RouteSettings _patchRouteSettings(
    RouteSettings settings,
    Widget page,
  ) {
    if (settings.name == null) {
      return settings.copyWith(name: page.runtimeType.toString());
    } else {
      return settings;
    }
  }
}

/// A [NavigatorObserver] that informs [FastNav] of navigation events
class FastNavObserver extends NavigatorObserver {
  /// The name of the navigator to observe
  final String navigatorName;

  /// Create a new [FastNavObserver] for the given [navigatorName]
  FastNavObserver({this.navigatorName = FastNav._rootNavigatorName}) {
    FastNav._navigationStacks[navigatorName] = [];
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    print('$navigatorName didPop: $route');
    FastNav._navigationStacks[navigatorName]!.removeLast();
    print(FastNav._navigationStacks.toString());
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    print('$navigatorName didPush: $route');
    FastNav._navigationStacks[navigatorName]!.add(route);
    print(FastNav._navigationStacks.toString());
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    print('$navigatorName didRemove: $route');
    FastNav._navigationStacks[navigatorName]!.remove(route);
    print(FastNav._navigationStacks.toString());
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    print('$navigatorName didReplace: $oldRoute with $newRoute');
    if (oldRoute != null) {
      final index = FastNav._navigationStacks[navigatorName]!.indexOf(oldRoute);
      if (newRoute != null) {
        FastNav._navigationStacks[navigatorName]![index] = newRoute;
      } else {
        FastNav._navigationStacks[navigatorName]!.removeAt(index);
      }
    } else if (newRoute != null) {
      FastNav._navigationStacks[navigatorName]!.add(newRoute);
    }
    print(FastNav._navigationStacks.toString());
  }
}
