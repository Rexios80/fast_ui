import 'package:fast_extensions/fast_extensions.dart';
import 'package:flutter/material.dart';

void example(BuildContext context) {
  // FastLocale
  context.countryCode;
  context.languageCode;

  // FastMaterialColor
  final primarySwatch = FastMaterialColor.fromColor(const Color(0xFFBC52CC));
  ThemeData(primarySwatch: primarySwatch);

  // FastMaterialLocalizations
  context.backButtonTooltip;

  // FastWidgetStateProperty
  final wsp = FastWidgetStateProperty(
    {WidgetState.selected: Colors.white},
    defaultValue: Colors.black,
  );
  ThemeData(
    segmentedButtonTheme:
        SegmentedButtonThemeData(style: ButtonStyle(foregroundColor: wsp)),
  );

  // FastMediaQuery
  context.screenWidth;
  context.screenHeight;
  context.windowViewInsets;

  // FastTheme
  context.theme;
  context.textTheme;
  context.isDarkMode;
  // ...
}
