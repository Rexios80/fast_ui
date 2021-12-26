import 'package:flutter/material.dart';

/// Extensions on [BuildContext] to read [Theme] information
extension FastThemeExtension on BuildContext {
  /// Returns the [ThemeData] of the current [BuildContext]
  ThemeData get theme => Theme.of(this);

  /// Returns the [ButtonThemeData] of the current [BuildContext]
  ButtonThemeData get buttonTheme => theme.buttonTheme;

  /// Returns the [ToggleButtonsThemeData] of the current [BuildContext]
  ToggleButtonsThemeData get toggleButtonsTheme => theme.toggleButtonsTheme;

  /// Returns the [ThemeData.textTheme] of the current [BuildContext]
  TextTheme get textTheme => theme.textTheme;

  /// Returns the [ThemeData.primaryTextTheme] of the current [BuildContext]
  TextTheme get primaryTextTheme => theme.primaryTextTheme;

  /// Returns the [InputDecorationTheme] of the current [BuildContext]
  InputDecorationTheme get inputDecorationTheme => theme.inputDecorationTheme;

  /// Returns the [ThemeData.iconTheme] of the current [BuildContext]
  IconThemeData get iconTheme => theme.iconTheme;

  /// Returns the [ThemeData.primaryIconTheme] of the current [BuildContext]
  IconThemeData get primaryIconTheme => theme.primaryIconTheme;

  /// Returns the [SliderThemeData] of the current [BuildContext]
  SliderThemeData get sliderTheme => theme.sliderTheme;

  /// Returns the [TabBarTheme] of the current [BuildContext]
  TabBarTheme get tabBarTheme => theme.tabBarTheme;

  /// Returns the [CardTheme] of the current [BuildContext]
  CardTheme get cardTheme => theme.cardTheme;

  /// Returns the [ChipThemeData] of the current [BuildContext]
  ChipThemeData get chipTheme => theme.chipTheme;

  /// Returns the [PageTransitionsTheme] of the current [BuildContext]
  PageTransitionsTheme get pageTransitionsTheme => theme.pageTransitionsTheme;

  /// Returns the [AppBarTheme] of the current [BuildContext]
  AppBarTheme get appBarTheme => theme.appBarTheme;

  /// Returns the [ScrollbarThemeData] of the current [BuildContext]
  ScrollbarThemeData get scrollbarTheme => theme.scrollbarTheme;

  /// Returns the [BottomAppBarTheme] of the current [BuildContext]
  BottomAppBarTheme get bottomAppBarTheme => theme.bottomAppBarTheme;

  /// Returns the [ColorScheme] of the current [BuildContext]
  ColorScheme get colorScheme => theme.colorScheme;

  /// Returns the [DialogTheme] of the current [BuildContext]
  DialogTheme get dialogTheme => theme.dialogTheme;

  /// Returns the [FloatingActionButtonThemeData] of the current [BuildContext]
  FloatingActionButtonThemeData get floatingActionButtonTheme =>
      theme.floatingActionButtonTheme;

  /// Returns the [NavigationBarThemeData] of the current [BuildContext]
  NavigationBarThemeData get navigationBarTheme => theme.navigationBarTheme;

  /// Returns the [NavigationRailThemeData] of the current [BuildContext]
  NavigationRailThemeData get navigationRailTheme => theme.navigationRailTheme;

  /// Returns the [SnackBarThemeData] of the current [BuildContext]
  SnackBarThemeData get snackBarTheme => theme.snackBarTheme;

  /// Returns the [BottomSheetThemeData] of the current [BuildContext]
  BottomSheetThemeData get bottomSheetTheme => theme.bottomSheetTheme;

  /// Returns the [PopupMenuThemeData] of the current [BuildContext]
  PopupMenuThemeData get popupMenuTheme => theme.popupMenuTheme;

  /// Returns the [MaterialBannerThemeData] of the current [BuildContext]
  MaterialBannerThemeData get bannerTheme => theme.bannerTheme;

  /// Returns the [DividerThemeData] of the current [BuildContext]
  DividerThemeData get dividerTheme => theme.dividerTheme;

  /// Returns the [ButtonBarThemeData] of the current [BuildContext]
  ButtonBarThemeData get buttonBarTheme => theme.buttonBarTheme;

  /// Returns the [BottomNavigationBarThemeData] of the current [BuildContext]
  BottomNavigationBarThemeData get bottomNavigationBarTheme =>
      theme.bottomNavigationBarTheme;

  /// Returns the [TimePickerThemeData] of the current [BuildContext]
  TimePickerThemeData get timePickerTheme => theme.timePickerTheme;

  /// Returns the [TextButtonThemeData] of the current [BuildContext]
  TextButtonThemeData get textButtonTheme => theme.textButtonTheme;

  /// Returns the [ElevatedButtonThemeData] of the current [BuildContext]
  ElevatedButtonThemeData get elevatedButtonTheme => theme.elevatedButtonTheme;

  /// Returns the [OutlinedButtonThemeData] of the current [BuildContext]
  OutlinedButtonThemeData get outlinedButtonTheme => theme.outlinedButtonTheme;

  /// Returns the [TextSelectionThemeData] of the current [BuildContext]
  TextSelectionThemeData get textSelectionTheme => theme.textSelectionTheme;

  /// Returns the [DataTableThemeData] of the current [BuildContext]
  DataTableThemeData get dataTableTheme => theme.dataTableTheme;

  /// Returns the [RadioThemeData] of the current [BuildContext]
  RadioThemeData get radioTheme => theme.radioTheme;

  /// Returns the [SwitchThemeData] of the current [BuildContext]
  SwitchThemeData get switchTheme => theme.switchTheme;

  /// Returns the [ProgressIndicatorThemeData] of the current [BuildContext]
  ProgressIndicatorThemeData get progressIndicatorTheme =>
      theme.progressIndicatorTheme;

  /// Returns the [DrawerThemeData] of the current [BuildContext]
  DrawerThemeData get drawerTheme => theme.drawerTheme;

  /// Returns the [ListTileThemeData] of the current [BuildContext]
  ListTileThemeData get listTileTheme => theme.listTileTheme;
}
