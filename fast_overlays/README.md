Show overlays without context

[![pub package](https://img.shields.io/pub/v/fast_overlays.svg?label=fast_overlays)](https://pub.dev/packages/fast_overlays)
[![codecov](https://codecov.io/gh/Rexios80/fast_ui/branch/master/graph/badge.svg?flag=fast_overlays)](https://codecov.io/gh/Rexios80/fast_ui)
![checks](https://img.shields.io/github/checks-status/Rexios80/fast_ui/master)
[![popularity](https://badges.bar/fast_overlays/popularity)](https://pub.dev/packages/fast_overlays/score)
[![likes](https://badges.bar/fast_overlays/likes)](https://pub.dev/packages/fast_overlays/score)
[![pub points](https://badges.bar/fast_overlays/pub%20points)](https://pub.dev/packages/fast_overlays/score)

## Features
Unlike other contextless overlay solutions, fast_overlays uses Flutter's built-in overlay implementations

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

### Convenience classes
| Class            | Use-case                    |
| ---------------- | --------------------------- |
| SnackBarDuration | SnackBar duration constants |

## Getting started
Register a GlobalKey with FastOverlays and your MaterialApp

<!-- embedme readme/getting_started.dart -->
```dart
import 'package:fast_overlays/fast_overlays.dart';
import 'package:flutter/material.dart';

void example() {
  // ...

  MaterialApp(
    navigatorKey: FastOverlays.init(GlobalKey<NavigatorState>()),
  );
}

```

## Usage
<!-- embedme readme/usage.dart -->
```dart
import 'package:fast_overlays/fast_overlays.dart';
import 'package:flutter/material.dart';

void showSnackbar() {
  FastOverlays.showSnackBar(
    const SnackBar(
      content: Text('I am a snackbar'),
      duration: SnackBarDuration.indefinite,
    ),
  );
}

```

## Additional information
See [fast_ui](https://pub.dev/packages/fast_ui) for more information