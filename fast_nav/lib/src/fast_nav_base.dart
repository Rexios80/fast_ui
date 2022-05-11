import 'package:fast_nav/src/exceptions.dart';
import 'package:flutter/material.dart';

/// Contextless navigator
class FastNav {
  FastNav._(); // coverage:ignore-line

  static const _rootNavigatorName = '_rootNavigator';
  static final _navigatorKeys = <String, GlobalKey<NavigatorState>>{};
  static final _navigationStacks = <String, List<Route>>{};

  /// Register the root navigator with [FastNav]
  ///
  /// Call in the [MaterialApp] constructor
  static GlobalKey<NavigatorState> init([GlobalKey<NavigatorState>? key]) {
    return registerNavigator(_rootNavigatorName, key: key);
  }

  /// Register a nested navigator with [FastNav]
  ///
  /// Each navigator [name] can only be registered once. Subsequent
  /// registrations will return the existing [GlobalKey].
  static GlobalKey<NavigatorState> registerNavigator(
    String name, {
    GlobalKey<NavigatorState>? key,
  }) {
    return _navigatorKeys[name] ??= key ?? GlobalKey<NavigatorState>();
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
    // The navigation stack can be empty if the observer was added between hot
    // reloads
    if (preventDuplicates &&
        !(_navigationStacks.containsKey(navigatorName) &&
            _navigationStacks[navigatorName]!.isNotEmpty)) {
      throw NavigatorObserverNotRegistered(
        navigatorName:
            navigatorName == _rootNavigatorName ? null : navigatorName,
      );
    }
  }

  static void _anonymousRoutePatchCheck({
    required String navigatorName,
    required String? routeName,
  }) {
    if (routeName == null || routeName == '/') {
      throw AnonymousRouteNotPatched(
        navigatorName:
            navigatorName == _rootNavigatorName ? null : navigatorName,
      );
    }
  }

  static NavigatorState _getNavigatorState(String navigatorName) {
    return _navigatorKeys[navigatorName]!.currentState!;
  }

  /// Reset [FastNav] for testing
  @visibleForTesting
  static void reset() {
    _navigatorKeys.clear();
    _navigationStacks.clear();
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
  static Future<T?> push<T extends Object?>(
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
    settings = generateAnonymousRoute(settings: settings, page: page).settings;
    if (preventDuplicates &&
        _isDuplicatePage(
          navigatorName: navigatorName,
          routeName: settings.name,
          anonymous: true,
        )) {
      return Future.value();
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
  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
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
    settings = generateAnonymousRoute(settings: settings, page: page).settings;
    if (preventDuplicates &&
        _isDuplicatePage(
          navigatorName: navigatorName,
          routeName: settings.name,
          anonymous: true,
        )) {
      return Future.value();
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
  static Future<T?> pushAndRemoveUntil<T extends Object?>(
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
    settings = generateAnonymousRoute(settings: settings, page: page).settings;
    if (preventDuplicates &&
        _isDuplicatePage(
          navigatorName: navigatorName,
          routeName: settings.name,
          anonymous: true,
        )) {
      return Future.value();
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
  static Future<T?> pushAndRemoveAll<T extends Object?>(
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
    settings = generateAnonymousRoute(settings: settings, page: page).settings;
    if (preventDuplicates &&
        _isDuplicatePage(
          navigatorName: navigatorName,
          routeName: settings.name,
          anonymous: true,
        )) {
      return Future.value();
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
  static Future<T?> pushNamed<T extends Object?>(
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
        _isDuplicatePage(
          navigatorName: navigatorName,
          routeName: routeName,
        )) {
      return Future.value();
    }
    return _getNavigatorState(navigatorName).pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

  /// Replace the current page with a named page route
  static Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
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
        _isDuplicatePage(
          navigatorName: navigatorName,
          routeName: routeName,
        )) {
      return Future.value();
    }
    return _getNavigatorState(navigatorName).pushReplacementNamed<T, TO>(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  /// Remove pages until [predicate] returns true and push a named page route
  static Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
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
        _isDuplicatePage(
          navigatorName: navigatorName,
          routeName: newRouteName,
        )) {
      return Future.value();
    }
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
    bool preventDuplicates = false,
    Object? arguments,
  }) {
    _checkInit(
      navigatorName: navigatorName,
      preventDuplicates: preventDuplicates,
    );
    if (preventDuplicates &&
        _isDuplicatePage(
          navigatorName: navigatorName,
          routeName: newRouteName,
        )) {
      return Future.value();
    }
    return _getNavigatorState(navigatorName).pushNamedAndRemoveUntil<T>(
      newRouteName,
      (_) => false,
      arguments: arguments,
    );
  }

  //* Convenience methods

  /// Patch anonymous page [RouteSettings] to always have a name.
  /// Required for duplicate prevention to work for anonymous page routes.
  /// If using named routes, don't use this.
  static MaterialPageRoute generateAnonymousRoute({
    required RouteSettings settings,
    required Widget page,
  }) {
    if (settings.name == null || settings.name == '/') {
      settings = settings.copyWith(name: '/${page.runtimeType}');
    }

    return MaterialPageRoute(
      settings: settings,
      builder: (context) => page,
    );
  }

  //* Internal convenience methods

  /// Check if a page route is a duplicate
  static bool _isDuplicatePage({
    required String navigatorName,
    required String? routeName,
    bool anonymous = false,
  }) {
    final lastRouteName = _navigationStacks[navigatorName]!.last.settings.name;
    if (anonymous) {
      _anonymousRoutePatchCheck(
        navigatorName: navigatorName,
        routeName: lastRouteName,
      );
    }
    return lastRouteName == routeName;
  }
}

/// A [NavigatorObserver] that informs [FastNav] of navigation events
class FastNavObserver extends NavigatorObserver {
  /// The name of the navigator to observe
  final String navigatorName;

  /// Create a new [FastNavObserver] for the given [navigatorName]
  FastNavObserver([this.navigatorName = FastNav._rootNavigatorName]) {
    FastNav._navigationStacks[navigatorName] = [];
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    FastNav._navigationStacks[navigatorName]!.removeLast();
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    FastNav._navigationStacks[navigatorName]!.add(route);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    FastNav._navigationStacks[navigatorName]!.remove(route);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
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
  }
}
