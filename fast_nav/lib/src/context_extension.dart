import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// The type of route to generate
enum RouteType {
  /// A material route
  material,

  /// A cupertino route
  cupertino,
}

/// Extension on [BuildContext] for navigation
extension FastNavigationExtension on BuildContext {
  Route<T> _createRoute<T>(
    Widget page, {
    required RouteType? routeType,
    required RouteSettings? settings,
    required bool? maintainState,
    required bool? fullscreenDialog,
    required bool? allowSnapshotting,
  }) {
    routeType ??= RouteType.material;
    maintainState ??= true;
    fullscreenDialog ??= false;
    allowSnapshotting ??= true;

    switch (routeType) {
      case RouteType.material:
        return MaterialPageRoute<T>(
          builder: (_) => page,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          allowSnapshotting: allowSnapshotting,
        );
      case RouteType.cupertino:
        return CupertinoPageRoute(
          builder: (_) => page,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          allowSnapshotting: allowSnapshotting,
        );
    }
  }

  //* Common navigation methods

  /// Pop the current page
  void pop<T extends Object?>(T? result) => Navigator.of(this).pop(result);

  /// Whether the navigator can be popped
  bool canPop() => Navigator.of(this).canPop();

  //* Anonymous navigation

  /// Navigate to an anonymous page route
  Future<T?> push<T extends Object?>(
    Widget page, {
    RouteType? routeType,
    RouteSettings? settings,
    bool? maintainState,
    bool? fullscreenDialog,
    bool? allowSnapshotting,
  }) =>
      Navigator.of(this).push<T>(
        _createRoute<T>(
          page,
          routeType: routeType,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          allowSnapshotting: allowSnapshotting,
        ),
      );

  /// Replace the current page with a new anonymous page route
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Widget page, {
    RouteType? routeType,
    RouteSettings? settings,
    bool? maintainState,
    bool? fullscreenDialog,
    bool? allowSnapshotting,
    TO? result,
  }) =>
      Navigator.of(this).pushReplacement<T, TO>(
        _createRoute<T>(
          page,
          routeType: routeType,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          allowSnapshotting: allowSnapshotting,
        ),
        result: result,
      );

  /// Remove pages until [predicate] returns true and push a new anonymous page route
  Future<T?> pushAndRemoveUntil<T extends Object?>(
    Widget page,
    bool Function(Route<dynamic> route) predicate, {
    RouteType? routeType,
    RouteSettings? settings,
    bool? maintainState,
    bool? fullscreenDialog,
    bool? allowSnapshotting,
  }) =>
      Navigator.of(this).pushAndRemoveUntil<T>(
        _createRoute<T>(
          page,
          routeType: routeType,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          allowSnapshotting: allowSnapshotting,
        ),
        predicate,
      );

  /// Remove all pages and push a new anonymous page route
  Future<T?> pushAndRemoveAll<T extends Object?>(
    Widget page, {
    RouteType? routeType,
    RouteSettings? settings,
    bool? maintainState,
    bool? fullscreenDialog,
    bool? allowSnapshotting,
  }) =>
      Navigator.of(this).pushAndRemoveUntil<T>(
        _createRoute<T>(
          page,
          routeType: routeType,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          allowSnapshotting: allowSnapshotting,
        ),
        (_) => false,
      );

  //* Named navigation

  /// Navigate to a named page route
  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) =>
      Navigator.of(this).pushNamed<T>(
        routeName,
        arguments: arguments,
      );

  /// Replace the current page with a named page route
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) =>
      Navigator.of(this).pushReplacementNamed<T, TO>(
        routeName,
        result: result,
        arguments: arguments,
      );

  /// Remove pages until [predicate] returns true and push a named page route
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    bool Function(Route<dynamic> route) predicate, {
    Object? arguments,
  }) =>
      Navigator.of(this).pushNamedAndRemoveUntil<T>(
        newRouteName,
        predicate,
        arguments: arguments,
      );

  /// Remove all pages and push a named page route
  Future<T?> pushNamedAndRemoveAll<T extends Object?>(
    String newRouteName, {
    Object? arguments,
  }) =>
      Navigator.of(this).pushNamedAndRemoveUntil<T>(
        newRouteName,
        (_) => false,
        arguments: arguments,
      );
}
