import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Extension on [BuildContext] to read [MediaQueryData] information
extension FastMediaQuery on BuildContext {
  /// The [MediaQueryData] of the current [BuildContext]
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// The [MediaQueryData.size] of the current [BuildContext]
  Size get screenSize => mediaQuery.size;

  /// The [MediaQueryData.size.width] of the current [BuildContext]
  double get screenWidth => mediaQuery.size.width;

  /// The [MediaQueryData.size.height] of the current [BuildContext]
  double get screenHeight => mediaQuery.size.height;

  /// The [MediaQueryData.size.aspectRatio] of the current [BuildContext]
  double get screenAspectRatio => mediaQuery.size.aspectRatio;

  /// The [MediaQueryData.size.shortestSide] of the current [BuildContext]
  double get screenShortestSide => mediaQuery.size.shortestSide;

  /// The [MediaQueryData.size.longestSide] of the current [BuildContext]
  double get screenLongestSide => mediaQuery.size.longestSide;

  /// The [MediaQueryData.devicePixelRatio] of the current [BuildContext]
  double get devicePixelRatio => mediaQuery.devicePixelRatio;

  /// The [MediaQueryData.textScaleFactor] of the current [BuildContext]
  double get textScaleFactor => mediaQuery.textScaleFactor;

  /// The [MediaQueryData.platformBrightness] of the current [BuildContext]
  Brightness get platformBrightness => mediaQuery.platformBrightness;

  /// The [MediaQueryData.viewInsets] of the current [BuildContext]
  EdgeInsets get windowViewInsets => mediaQuery.viewInsets;

  /// The [MediaQueryData.padding] of the current [BuildContext]
  EdgeInsets get windowPadding => mediaQuery.padding;

  /// The [MediaQueryData.viewPadding] of the current [BuildContext]
  EdgeInsets get windowViewPadding => mediaQuery.viewPadding;

  /// The [MediaQueryData.systemGestureInsets] of the current [BuildContext]
  EdgeInsets get windowSystemGestureInsets => mediaQuery.systemGestureInsets;

  /// The [MediaQueryData.alwaysUse24HourFormat] of the current [BuildContext]
  bool get alwaysUse24HourFormat => mediaQuery.alwaysUse24HourFormat;

  /// The [MediaQueryData.accessibleNavigation] of the current [BuildContext]
  bool get accessibleNavigation => mediaQuery.accessibleNavigation;

  /// The [MediaQueryData.invertColors] of the current [BuildContext]
  bool get invertColors => mediaQuery.invertColors;

  /// The [MediaQueryData.highContrast] of the current [BuildContext]
  bool get highContrast => mediaQuery.highContrast;

  /// The [MediaQueryData.disableAnimations] of the current [BuildContext]
  bool get disableAnimations => mediaQuery.disableAnimations;

  /// The [MediaQueryData.boldText] of the current [BuildContext]
  bool get boldText => mediaQuery.boldText;

  /// The [MediaQueryData.navigationMode] of the current [BuildContext]
  NavigationMode get navigationMode => mediaQuery.navigationMode;

  /// The [MediaQueryData.gestureSettings] of the current [BuildContext]
  DeviceGestureSettings get gestureSettings => mediaQuery.gestureSettings;

  /// The [MediaQueryData.orientation] of the current [BuildContext]
  Orientation get orientation => mediaQuery.orientation;
}
