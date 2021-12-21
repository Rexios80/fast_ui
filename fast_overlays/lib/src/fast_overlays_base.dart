import 'package:flutter/material.dart';

/// Contextless overlays
class FastOverlays {
  static late final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey;

  /// Initialize [FastOverlays] with a [ScaffoldMessengerState] key
  static GlobalKey<ScaffoldMessengerState> init(
    GlobalKey<ScaffoldMessengerState> key,
  ) {
    return _scaffoldMessengerKey = key;
  }

  /// Check if [_scaffoldMessengerKey] has been initialized
  static void _checkInit() {
    try {
      _scaffoldMessengerKey.currentState;
    } catch (e) {
      throw Exception(
        'FastOverlays must be initialized before use.'
        ' Call FastOverlays.init() first.',
      );
    }
  }

  //* Snackbars

  /// Show a [SnackBar]
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbar(
    SnackBar snackBar,
  ) {
    _checkInit();
    return _scaffoldMessengerKey.currentState!.showSnackBar(snackBar);
  }

  //* Material banners

  /// Show a [MaterialBanner]
  static ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason>
      showMaterialBanner(
    MaterialBanner materialBanner,
  ) {
    _checkInit();
    return _scaffoldMessengerKey.currentState!
        .showMaterialBanner(materialBanner);
  }

  //* Dialogs

  /// Show a dialog
  static Future<T?> dialog<T>({
    required WidgetBuilder builder,
    bool barrierDismissible = true,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
  }) {
    _checkInit();
    return showDialog<T>(
      context: _scaffoldMessengerKey.currentContext!,
      builder: builder,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
    );
  }

  /// Show an about dialog
  static void aboutDialog({
    String? applicationName,
    String? applicationVersion,
    Widget? applicationIcon,
    String? applicationLegalese,
    List<Widget>? children,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
  }) {
    _checkInit();
    showAboutDialog(
      context: _scaffoldMessengerKey.currentContext!,
      applicationName: applicationName,
      applicationVersion: applicationVersion,
      applicationIcon: applicationIcon,
      applicationLegalese: applicationLegalese,
      children: children,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
    );
  }

  /// Show a general dialog
  static Future<T?> generalDialog<T>({
    required RoutePageBuilder pageBuilder,
    bool barrierDismissible = false,
    String? barrierLabel,
    Color barrierColor = const Color(0x80000000),
    Duration transitionDuration = const Duration(milliseconds: 200),
    RouteTransitionsBuilder? transitionBuilder,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
  }) {
    _checkInit();
    return showGeneralDialog<T>(
      context: _scaffoldMessengerKey.currentContext!,
      pageBuilder: pageBuilder,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      barrierColor: barrierColor,
      transitionDuration: transitionDuration,
      transitionBuilder: transitionBuilder,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
    );
  }
}
