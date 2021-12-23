import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;

/// Contextless overlays
class FastOverlays {
  FastOverlays._();

  static late GlobalKey<NavigatorState> _navigatorKey;

  /// Initialize [FastOverlays] with a [NavigatorState] key
  ///
  /// Call in the [MaterialApp] constructor
  static GlobalKey<NavigatorState> init(
    GlobalKey<NavigatorState> key,
  ) {
    return _navigatorKey = key;
  }

  /// Check if [_navigatorKey] has been initialized
  static void _checkInit() {
    try {
      _navigatorKey.currentState!;
    } catch (e) {
      throw Exception(
        'FastOverlays must be initialized before use.'
        ' Call FastOverlays.init() first.',
      );
    }
  }

  static ScaffoldMessengerState get _scaffoldMessenger {
    return ScaffoldMessenger.of(_navigatorKey.currentContext!);
  }

  //* SnackBars

  /// Show a [SnackBar]
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    SnackBar snackBar,
  ) {
    _checkInit();
    return _scaffoldMessenger.showSnackBar(snackBar);
  }

  /// Hide the current snackbar
  static void hideCurrentSnackBar() {
    _checkInit();
    _scaffoldMessenger.hideCurrentSnackBar();
  }

  /// Remove the current snackbar
  static void removeCurrentSnackBar() {
    _checkInit();
    _scaffoldMessenger.removeCurrentSnackBar();
  }

  /// Clear all snackbars
  static void clearSnackBars() {
    _checkInit();
    _scaffoldMessenger.clearSnackBars();
  }

  //* Material banners

  /// Show a [MaterialBanner]
  static ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason>
      showMaterialBanner(
    MaterialBanner materialBanner,
  ) {
    _checkInit();
    return _scaffoldMessenger.showMaterialBanner(materialBanner);
  }

  /// Hide the current material banner
  static void hideCurrentMaterialBanner() {
    _checkInit();
    _scaffoldMessenger.hideCurrentMaterialBanner();
  }

  /// Remove the current material banner
  static void removeCurrentMaterialBanner() {
    _checkInit();
    _scaffoldMessenger.removeCurrentMaterialBanner();
  }

  /// Clear all material banners
  static void clearMaterialBanners() {
    _checkInit();
    _scaffoldMessenger.clearMaterialBanners();
  }

  //* Bottom sheets

  /// Show a bottom sheet
  //! Requires a scaffold context
  // static PersistentBottomSheetController<T> showBottomSheet<T>({
  //   required WidgetBuilder builder,
  //   Color? backgroundColor,
  //   double? elevation,
  //   ShapeBorder? shape,
  //   Clip? clipBehavior,
  //   BoxConstraints? constraints,
  //   AnimationController? transitionAnimationController,
  // }) {
  //   _checkInit();
  //   return material.showBottomSheet(
  //     context: _navigatorKey.currentContext!,
  //     builder: builder,
  //     backgroundColor: backgroundColor,
  //     elevation: elevation,
  //     shape: shape,
  //     clipBehavior: clipBehavior,
  //     constraints: constraints,
  //     transitionAnimationController: transitionAnimationController,
  //   );
  // }

  /// Show a modal bottom sheet
  static Future<T?> showModalBottomSheet<T>({
    required WidgetBuilder builder,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
  }) {
    _checkInit();
    return material.showModalBottomSheet(
      context: _navigatorKey.currentContext!,
      builder: builder,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      constraints: constraints,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      routeSettings: routeSettings,
      transitionAnimationController: transitionAnimationController,
    );
  }

  //* Date and time pickers

  /// Show a date picker
  static Future<DateTime?> showDatePicker({
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    DateTime? currentDate,
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
    SelectableDayPredicate? selectableDayPredicate,
    String? helpText,
    String? cancelText,
    String? confirmText,
    Locale? locale,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    TextDirection? textDirection,
    TransitionBuilder? builder,
    DatePickerMode initialDatePickerMode = DatePickerMode.day,
    String? errorFormatText,
    String? errorInvalidText,
    String? fieldHintText,
    String? fieldLabelText,
  }) {
    _checkInit();
    return material.showDatePicker(
      context: _navigatorKey.currentContext!,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      currentDate: currentDate,
      initialEntryMode: initialEntryMode,
      selectableDayPredicate: selectableDayPredicate,
      helpText: helpText,
      cancelText: cancelText,
      confirmText: confirmText,
      locale: locale,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      textDirection: textDirection,
      builder: builder,
      initialDatePickerMode: initialDatePickerMode,
      errorFormatText: errorFormatText,
      errorInvalidText: errorInvalidText,
      fieldHintText: fieldHintText,
      fieldLabelText: fieldLabelText,
    );
  }

  /// Show a date range picker
  static Future<DateTimeRange?> showDateRangePicker({
    DateTimeRange? initialDateRange,
    required DateTime firstDate,
    required DateTime lastDate,
    DateTime? currentDate,
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
    String? helpText,
    String? cancelText,
    String? confirmText,
    String? saveText,
    String? errorFormatText,
    String? errorInvalidText,
    String? errorInvalidRangeText,
    String? fieldStartHintText,
    String? fieldEndHintText,
    String? fieldStartLabelText,
    String? fieldEndLabelText,
    Locale? locale,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    TextDirection? textDirection,
    TransitionBuilder? builder,
  }) {
    _checkInit();
    return material.showDateRangePicker(
      context: _navigatorKey.currentContext!,
      initialDateRange: initialDateRange,
      firstDate: firstDate,
      lastDate: lastDate,
      currentDate: currentDate,
      initialEntryMode: initialEntryMode,
      helpText: helpText,
      cancelText: cancelText,
      confirmText: confirmText,
      saveText: saveText,
      errorFormatText: errorFormatText,
      errorInvalidText: errorInvalidText,
      errorInvalidRangeText: errorInvalidRangeText,
      fieldStartHintText: fieldStartHintText,
      fieldEndHintText: fieldEndHintText,
      fieldStartLabelText: fieldStartLabelText,
      fieldEndLabelText: fieldEndLabelText,
      locale: locale,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      textDirection: textDirection,
      builder: builder,
    );
  }

  /// Show a time picker
  static Future<TimeOfDay?> showTimePicker({
    required TimeOfDay initialTime,
    TransitionBuilder? builder,
    bool useRootNavigator = true,
    TimePickerEntryMode initialEntryMode = TimePickerEntryMode.dial,
    String? cancelText,
    String? confirmText,
    String? helpText,
    String? errorInvalidText,
    String? hourLabelText,
    String? minuteLabelText,
    RouteSettings? routeSettings,
    EntryModeChangeCallback? onEntryModeChanged,
  }) {
    _checkInit();
    return material.showTimePicker(
      context: _navigatorKey.currentContext!,
      initialTime: initialTime,
      builder: builder,
      useRootNavigator: useRootNavigator,
      initialEntryMode: initialEntryMode,
      cancelText: cancelText,
      confirmText: confirmText,
      helpText: helpText,
      errorInvalidText: errorInvalidText,
      hourLabelText: hourLabelText,
      minuteLabelText: minuteLabelText,
      routeSettings: routeSettings,
      onEntryModeChanged: onEntryModeChanged,
    );
  }

  //* Pages

  /// Show the license page
  static void showLicensePage({
    String? applicationName,
    String? applicationVersion,
    Widget? applicationIcon,
    String? applicationLegalese,
    bool useRootNavigator = false,
  }) {
    _checkInit();
    material.showLicensePage(
      context: _navigatorKey.currentContext!,
      applicationName: applicationName,
      applicationVersion: applicationVersion,
      applicationIcon: applicationIcon,
      applicationLegalese: applicationLegalese,
      useRootNavigator: useRootNavigator,
    );
  }

  /// Show a search page
  static Future<T?> showSearch<T>({
    required SearchDelegate<T> delegate,
    String? query = '',
    bool useRootNavigator = false,
  }) {
    _checkInit();
    return material.showSearch(
      context: _navigatorKey.currentContext!,
      delegate: delegate,
      query: query,
      useRootNavigator: useRootNavigator,
    );
  }

  //* Menu

  /// Show a menu
  static Future<T?> showMenu<T>({
    required RelativeRect position,
    required List<PopupMenuEntry<T>> items,
    T? initialValue,
    double? elevation,
    String? semanticLabel,
    ShapeBorder? shape,
    Color? color,
    bool useRootNavigator = false,
  }) {
    _checkInit();
    return material.showMenu(
      context: _navigatorKey.currentContext!,
      position: position,
      items: items,
      initialValue: initialValue,
      elevation: elevation,
      semanticLabel: semanticLabel,
      shape: shape,
      color: color,
      useRootNavigator: useRootNavigator,
    );
  }

  //* Dialogs

  /// Show a dialog
  static Future<T?> showDialog<T>({
    required WidgetBuilder builder,
    bool barrierDismissible = true,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
  }) {
    _checkInit();
    return material.showDialog<T>(
      context: _navigatorKey.currentContext!,
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
  static void showAboutDialog({
    String? applicationName,
    String? applicationVersion,
    Widget? applicationIcon,
    String? applicationLegalese,
    List<Widget>? children,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
  }) {
    _checkInit();
    material.showAboutDialog(
      context: _navigatorKey.currentContext!,
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
  static Future<T?> showGeneralDialog<T>({
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
    return material.showGeneralDialog<T>(
      context: _navigatorKey.currentContext!,
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
