Convenience extensions to make common Flutter tasks less annoying

[![pub package](https://img.shields.io/pub/v/fast_extensions)](https://pub.dev/packages/fast_extensions)
[![codecov](https://img.shields.io/codecov/c/github/Rexios80/fast_ui/master?flag=fast_extensions)](https://codecov.io/gh/Rexios80/fast_ui)
![checks](https://img.shields.io/github/checks-status/Rexios80/fast_ui/master)
[![popularity](https://img.shields.io/pub/popularity/fast_extensions)](https://pub.dev/packages/fast_extensions/score)
[![likes](https://img.shields.io/pub/likes/fast_extensions)](https://pub.dev/packages/fast_extensions/score)
[![pub points](https://img.shields.io/pub/points/fast_extensions)](https://pub.dev/packages/fast_extensions/score)

## Features
| Extension                 | Use-case                                 |
| ------------------------- | ---------------------------------------- |
| FastNavigation            | Navigator.of(context)                    |
| FastLocale                | Localizations.localeOf(context)          |
| FastMaterialColor         | FastMaterialColor.fromColor(color)       |
| FastMaterialLocalizations | MaterialLocalizations.of(context)        |
| FastMaterialStateProperty | Create MaterialStateProperty using a map |
| FastMediaQuery            | MediaQuery.of(context)                   |
| FastTheme                 | Theme.of(context)                        |


## Usage
<!-- embedme readme/usage.dart -->
```dart
import 'package:fast_extensions/fast_extensions.dart';
import 'package:flutter/material.dart';

void example(BuildContext context) {
  // FastNavigation
  context.push(const Text('page'));
  context.pop(false);

  // FastLocale
  context.countryCode;
  context.languageCode;

  // FastMaterialColor
  final primarySwatch = FastMaterialColor.fromColor(const Color(0xFFBC52CC));
  ThemeData(primarySwatch: primarySwatch);

  // FastMaterialLocalizations
  context.backButtonTooltip;

  // FastMaterialStateProperty
  final msp = FastMaterialStateProperty(
    {MaterialState.selected: Colors.white},
    defaultValue: Colors.black,
  );
  ThemeData(
    segmentedButtonTheme:
        SegmentedButtonThemeData(style: ButtonStyle(foregroundColor: msp)),
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

```

## Additional information
See [fast_ui](https://pub.dev/packages/fast_ui) for more information
