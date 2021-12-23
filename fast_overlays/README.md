Show overlays without context

## Features
fast_overlays supports the following overlays:
- Snackbar
- Material banner
- Modal bottom sheet
- Date picker
- Date range picker
- Time picker
- License page
- Search
- Menu
- Dialog
- About dialog
- General dialog

## Getting started
```dart
import 'package:fast_overlays/fast_overlays.dart';

...

MaterialApp(
  navigatorKey: FastOverlays.init(GlobalKey<NavigatorState>()),
);
```

## Usage
```dart
FastOverlays.showSnackBar(
  const SnackBar(content: Text('I am a snackbar')),
);
```

## Additional information
See [fast_ui](https://pub.dev/packages/fast_ui) for more information