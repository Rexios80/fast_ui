Convenience extensions to make common Flutter tasks less annoying

## Features
| Extension                 | Use-case                          |
| ------------------------- | --------------------------------- |
| FastThemeExtension        | Theme.of(context)                 |
| FastLocaleExtension       | Localizations.localeOf(context)   |
| FastLocalizationExtension | MaterialLocalizations.of(context) |
| FastMediaExtension        | MediaQuery.of(context)            |


## Usage

```dart
import 'package:fast_extensions/fast_extensions.dart';

// FastThemeExtension
context.theme;
context.textTheme;
context.isDarkMode;

// FastLocaleExtension
context.countryCode;
context.languageCode;

// FastLocalizationExtension
context.backButtonTooltip;

// FastMediaExtension
context.screenWidth;
context.screenHeight;
context.windowViewInsets;
...
```

## Additional information
See [fast_ui](https://pub.dev/packages/fast_ui) for more information
