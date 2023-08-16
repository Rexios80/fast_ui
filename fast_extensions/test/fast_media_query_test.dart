import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fast_extensions/src/fast_media_query.dart';

import 'util.dart';

void main() {
  testWidgets(
    'FastLocale',
    (tester) => testContextExtensions(tester, (context) {
      final mediaQuery = MediaQuery.of(context);
      expect(context.mediaQuery, mediaQuery);
      expect(context.screenSize, mediaQuery.size);
      expect(context.screenWidth, mediaQuery.size.width);
      expect(context.screenHeight, mediaQuery.size.height);
      expect(context.screenAspectRatio, mediaQuery.size.aspectRatio);
      expect(context.screenShortestSide, mediaQuery.size.shortestSide);
      expect(context.screenLongestSide, mediaQuery.size.longestSide);
      expect(context.devicePixelRatio, mediaQuery.devicePixelRatio);
      expect(context.textScaleFactor, mediaQuery.textScaleFactor);
      expect(context.platformBrightness, mediaQuery.platformBrightness);
      expect(context.windowViewInsets, mediaQuery.viewInsets);
      expect(context.windowPadding, mediaQuery.padding);
      expect(context.windowViewPadding, mediaQuery.viewPadding);
      expect(context.windowSystemGestureInsets, mediaQuery.systemGestureInsets);
      expect(context.alwaysUse24HourFormat, mediaQuery.alwaysUse24HourFormat);
      expect(context.accessibleNavigation, mediaQuery.accessibleNavigation);
      expect(context.invertColors, mediaQuery.invertColors);
      expect(context.highContrast, mediaQuery.highContrast);
      expect(context.disableAnimations, mediaQuery.disableAnimations);
      expect(context.boldText, mediaQuery.boldText);
      expect(context.navigationMode, mediaQuery.navigationMode);
      expect(context.gestureSettings, mediaQuery.gestureSettings);
      expect(context.orientation, mediaQuery.orientation);
    }),
  );
}
