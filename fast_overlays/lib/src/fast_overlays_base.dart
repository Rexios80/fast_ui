import 'package:flutter/material.dart';

class FastOverlays {
  static late final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey;

  GlobalKey<ScaffoldMessengerState> init(
    GlobalKey<ScaffoldMessengerState> key,
  ) {
    return _scaffoldMessengerKey = key;
  }

  /// Check if [_scaffoldMessengerKey] has been initialized
  void _checkInit() {
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

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbar(
    SnackBar snackBar,
  ) {
    _checkInit();
    return _scaffoldMessengerKey.currentState!.showSnackBar(snackBar);
  }

  //* Material banners

  ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason>
      showMaterialBanner(
    MaterialBanner materialBanner,
  ) {
    _checkInit();
    return _scaffoldMessengerKey.currentState!
        .showMaterialBanner(materialBanner);
  }

  //* Dialogs

  Future<T?> dialog<T>({
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

  // TODO: Other dialogs
}
