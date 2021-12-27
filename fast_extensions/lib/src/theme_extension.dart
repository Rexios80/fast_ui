import 'package:flutter/material.dart';

/// Extension on [BuildContext] to read [ThemeData] information
extension FastThemeExtension on BuildContext {
  /// The [ThemeData] of the current [BuildContext]
  ThemeData get theme => Theme.of(this);

  /// If the [ThemeData] of the current [BuildContext] is dark
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// The [ButtonThemeData] of the current [BuildContext]
  ButtonThemeData get buttonTheme => theme.buttonTheme;

  /// The [ToggleButtonsThemeData] of the current [BuildContext]
  ToggleButtonsThemeData get toggleButtonsTheme => theme.toggleButtonsTheme;

  /// The [ThemeData.textTheme] of the current [BuildContext]
  TextTheme get textTheme => theme.textTheme;

  /// The [ThemeData.primaryTextTheme] of the current [BuildContext]
  TextTheme get primaryTextTheme => theme.primaryTextTheme;

  /// The [InputDecorationTheme] of the current [BuildContext]
  InputDecorationTheme get inputDecorationTheme => theme.inputDecorationTheme;

  /// The [ThemeData.iconTheme] of the current [BuildContext]
  IconThemeData get iconTheme => theme.iconTheme;

  /// The [ThemeData.primaryIconTheme] of the current [BuildContext]
  IconThemeData get primaryIconTheme => theme.primaryIconTheme;

  /// The [SliderThemeData] of the current [BuildContext]
  SliderThemeData get sliderTheme => theme.sliderTheme;

  /// The [TabBarTheme] of the current [BuildContext]
  TabBarTheme get tabBarTheme => theme.tabBarTheme;

  /// The [CardTheme] of the current [BuildContext]
  CardTheme get cardTheme => theme.cardTheme;

  /// The [ChipThemeData] of the current [BuildContext]
  ChipThemeData get chipTheme => theme.chipTheme;

  /// The [PageTransitionsTheme] of the current [BuildContext]
  PageTransitionsTheme get pageTransitionsTheme => theme.pageTransitionsTheme;

  /// The [AppBarTheme] of the current [BuildContext]
  AppBarTheme get appBarTheme => theme.appBarTheme;

  /// The [ScrollbarThemeData] of the current [BuildContext]
  ScrollbarThemeData get scrollbarTheme => theme.scrollbarTheme;

  /// The [BottomAppBarTheme] of the current [BuildContext]
  BottomAppBarTheme get bottomAppBarTheme => theme.bottomAppBarTheme;

  /// The [ColorScheme] of the current [BuildContext]
  ColorScheme get colorScheme => theme.colorScheme;

  /// The [DialogTheme] of the current [BuildContext]
  DialogTheme get dialogTheme => theme.dialogTheme;

  /// The [FloatingActionButtonThemeData] of the current [BuildContext]
  FloatingActionButtonThemeData get floatingActionButtonTheme =>
      theme.floatingActionButtonTheme;

  /// The [NavigationBarThemeData] of the current [BuildContext]
  NavigationBarThemeData get navigationBarTheme => theme.navigationBarTheme;

  /// The [NavigationRailThemeData] of the current [BuildContext]
  NavigationRailThemeData get navigationRailTheme => theme.navigationRailTheme;

  /// The [SnackBarThemeData] of the current [BuildContext]
  SnackBarThemeData get snackBarTheme => theme.snackBarTheme;

  /// The [BottomSheetThemeData] of the current [BuildContext]
  BottomSheetThemeData get bottomSheetTheme => theme.bottomSheetTheme;

  /// The [PopupMenuThemeData] of the current [BuildContext]
  PopupMenuThemeData get popupMenuTheme => theme.popupMenuTheme;

  /// The [MaterialBannerThemeData] of the current [BuildContext]
  MaterialBannerThemeData get bannerTheme => theme.bannerTheme;

  /// The [DividerThemeData] of the current [BuildContext]
  DividerThemeData get dividerTheme => theme.dividerTheme;

  /// The [ButtonBarThemeData] of the current [BuildContext]
  ButtonBarThemeData get buttonBarTheme => theme.buttonBarTheme;

  /// The [BottomNavigationBarThemeData] of the current [BuildContext]
  BottomNavigationBarThemeData get bottomNavigationBarTheme =>
      theme.bottomNavigationBarTheme;

  /// The [TimePickerThemeData] of the current [BuildContext]
  TimePickerThemeData get timePickerTheme => theme.timePickerTheme;

  /// The [TextButtonThemeData] of the current [BuildContext]
  TextButtonThemeData get textButtonTheme => theme.textButtonTheme;

  /// The [ElevatedButtonThemeData] of the current [BuildContext]
  ElevatedButtonThemeData get elevatedButtonTheme => theme.elevatedButtonTheme;

  /// The [OutlinedButtonThemeData] of the current [BuildContext]
  OutlinedButtonThemeData get outlinedButtonTheme => theme.outlinedButtonTheme;

  /// The [TextSelectionThemeData] of the current [BuildContext]
  TextSelectionThemeData get textSelectionTheme => theme.textSelectionTheme;

  /// The [DataTableThemeData] of the current [BuildContext]
  DataTableThemeData get dataTableTheme => theme.dataTableTheme;

  /// The [RadioThemeData] of the current [BuildContext]
  RadioThemeData get radioTheme => theme.radioTheme;

  /// The [SwitchThemeData] of the current [BuildContext]
  SwitchThemeData get switchTheme => theme.switchTheme;

  /// The [ProgressIndicatorThemeData] of the current [BuildContext]
  ProgressIndicatorThemeData get progressIndicatorTheme =>
      theme.progressIndicatorTheme;

  /// The [DrawerThemeData] of the current [BuildContext]
  DrawerThemeData get drawerTheme => theme.drawerTheme;

  /// The [ListTileThemeData] of the current [BuildContext]
  ListTileThemeData get listTileTheme => theme.listTileTheme;
}
