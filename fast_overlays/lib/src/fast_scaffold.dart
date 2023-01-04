import 'package:fast_overlays/src/exceptions.dart';
import 'package:flutter/material.dart';

/// Contextless overlays for scaffolds
class FastScaffold {
  FastScaffold._(); // coverage:ignore-line

  static const _defaultScaffoldName = '_defaultScaffold';

  static final _scaffoldKeys = <String, GlobalKey<ScaffoldState>>{};

  /// Register a [Scaffold] with [FastOverlays]
  ///
  /// Must be called before using any other methods. If you wish to use
  /// multiple scaffolds on screen at once, you must specify a unique [name]
  /// for each scaffold.
  static GlobalKey<ScaffoldState> register({
    String name = _defaultScaffoldName,
    GlobalKey<ScaffoldState>? key,
  }) {
    return _scaffoldKeys[name] ??= key ?? GlobalKey<ScaffoldState>();
  }

  static ScaffoldState _getScaffoldState({
    required String scaffoldName,
  }) {
    final key = _scaffoldKeys[scaffoldName];

    if (key == null) {
      throw ScaffoldNotRegistered(
        scaffoldName:
            scaffoldName == _defaultScaffoldName ? null : scaffoldName,
      );
    }

    try {
      return key.currentState!;
    } catch (e) {
      throw InvalidScaffoldContext(
        scaffoldName:
            scaffoldName == _defaultScaffoldName ? null : scaffoldName,
      );
    }
  }

  /// Show a bottom sheet
  static PersistentBottomSheetController<T> showBottomSheet<T>(
    WidgetBuilder builder, {
    String scaffoldName = _defaultScaffoldName,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    bool? enableDrag,
    AnimationController? transitionAnimationController,
  }) {
    return _getScaffoldState(scaffoldName: scaffoldName).showBottomSheet(
      builder,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      constraints: constraints,
      enableDrag: enableDrag,
      transitionAnimationController: transitionAnimationController,
    );
  }

  /// Open a drawer
  static void openDrawer({
    String scaffoldName = _defaultScaffoldName,
  }) {
    _getScaffoldState(scaffoldName: scaffoldName).openDrawer();
  }

  /// Close a drawer
  static void closeDrawer({
    String scaffoldName = _defaultScaffoldName,
  }) {
    _getScaffoldState(scaffoldName: scaffoldName).closeDrawer();
  }

  /// Open an end drawer
  static void openEndDrawer({
    String scaffoldName = _defaultScaffoldName,
  }) {
    _getScaffoldState(scaffoldName: scaffoldName).openEndDrawer();
  }

  /// Close an end drawer
  static void closeEndDrawer({
    String scaffoldName = _defaultScaffoldName,
  }) {
    _getScaffoldState(scaffoldName: scaffoldName).closeEndDrawer();
  }
}
