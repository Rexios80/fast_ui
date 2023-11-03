Navigate without context

[![pub package](https://img.shields.io/pub/v/fast_nav)](https://pub.dev/packages/fast_nav)
[![codecov](https://img.shields.io/codecov/c/github/Rexios80/fast_ui/master?flag=fast_nav)](https://codecov.io/gh/Rexios80/fast_ui)
![checks](https://img.shields.io/github/checks-status/Rexios80/fast_ui/master)
[![popularity](https://img.shields.io/pub/popularity/fast_nav)](https://pub.dev/packages/fast_nav/score)
[![likes](https://img.shields.io/pub/likes/fast_nav)](https://pub.dev/packages/fast_nav/score)
[![pub points](https://img.shields.io/pub/points/fast_nav)](https://pub.dev/packages/fast_nav/score)

## Features
fast_nav supports the following navigation methods:
- pop
- canPop
- push
- pushReplacement
- pushAndRemoveUntil
- pushAndRemoveAll
- pushNamed
- pushReplacementNamed
- pushNamedAndRemoveUntil
- pushNamedAndRemoveAll

Convenience features:
- Nested navigation with a NestedNavigator class for simple setup

## Getting started
Register a GlobalKey with FastNav and your MaterialApp

<!-- embedme readme/getting_started.dart -->
```dart
import 'package:fast_nav/fast_nav.dart';
import 'package:flutter/material.dart';

void example() {
  MaterialApp(
    navigatorKey: FastNav.init(),
  );
}

```

## Usage
<!-- embedme readme/usage.dart -->
```dart
import 'package:fast_nav/fast_nav.dart';
import 'package:flutter/material.dart';

void example(BuildContext context) {
  context.push(const Text('Navigate with context'));
  FastNav.push(const Text('or without'));
}

```

<!-- embedme readme/nested_navigator.dart -->
```dart
import 'package:fast_nav/fast_nav.dart';
import 'package:flutter/material.dart';

void example() {
  // ...

  NestedNavigator(
    name: 'nestedNavigator',
    home: const Text('home'),
  );

  // ...

  FastNav.push(const Text('New page'), navigator: 'nestedNavigator');
}

```

## Additional information
See [fast_ui](https://pub.dev/packages/fast_ui) for more information