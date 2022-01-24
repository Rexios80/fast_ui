Convenience extensions to make common Flutter tasks less annoying

[![pub package](https://img.shields.io/pub/v/fast_extensions.svg?label=fast_extensions)](https://pub.dev/packages/fast_extensions)
[![codecov](https://codecov.io/gh/Rexios80/fast_ui/branch/master/graph/badge.svg?flag=fast_extensions)](https://codecov.io/gh/Rexios80/fast_ui)
![checks](https://img.shields.io/github/checks-status/Rexios80/fast_ui/master)
[![popularity](https://badges.bar/fast_extensions/popularity)](https://pub.dev/packages/fast_extensions/score)
[![likes](https://badges.bar/fast_extensions/likes)](https://pub.dev/packages/fast_extensions/score)
[![pub points](https://badges.bar/fast_extensions/pub%20points)](https://pub.dev/packages/fast_extensions/score)

## Features
| Extension                 | Use-case                           |
| ------------------------- | ---------------------------------- |
| FastLocale                | Localizations.localeOf(context)    |
| FastMaterialColor         | FastMaterialColor.fromColor(color) |
| FastMaterialLocalizations | MaterialLocalizations.of(context)  |
| FastMediaQuery            | MediaQuery.of(context)             |
| FastTheme                 | Theme.of(context)                  |


## Usage
<!-- embedme readme/usage.dart -->
```dart
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
