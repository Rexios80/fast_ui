Convenience extensions to make common Flutter tasks less annoying

## Features
| Extension                 | Use-case                           |
| ------------------------- | ---------------------------------- |
| FastLocale                | Localizations.localeOf(context)    |
| FastMaterialColor         | FastMaterialColor.fromColor(color) |
| FastMaterialLocalizations | MaterialLocalizations.of(context)  |
| FastMediaQuery            | MediaQuery.of(context)             |
| FastTheme                 | Theme.of(context)                  |


## Usage

```dart
import 'package:fast_extensions/fast_extensions.dart';

// FastLocale
context.countryCode;
context.languageCode;

// FastMaterialColor
final primarySwatch = FastMaterialColor.fromColor(Color(0xFFBC52CC));

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
...
```

## Additional information
See [fast_ui](https://pub.dev/packages/fast_ui) for more information
