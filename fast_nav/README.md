Navigate without context

[![pub package](https://img.shields.io/pub/v/fast_nav.svg?label=fast_nav)](https://pub.dev/packages/fast_nav)
[![codecov](https://codecov.io/gh/Rexios80/fast_ui/branch/master/graph/badge.svg?flag=fast_nav)](https://codecov.io/gh/Rexios80/fast_ui)
![checks](https://img.shields.io/github/checks-status/Rexios80/fast_ui/master)
[![popularity](https://badges.bar/fast_nav/popularity)](https://pub.dev/packages/fast_nav/score)
[![likes](https://badges.bar/fast_nav/likes)](https://pub.dev/packages/fast_nav/score)
[![pub points](https://badges.bar/fast_nav/pub%20points)](https://pub.dev/packages/fast_nav/score)

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

fast_nav supports nested navigation and provides a NestedNavigator class for simple setup

## Getting started
Register a GlobalKey with FastNav and your MaterialApp

<!-- embedme readme/getting_started.dart -->
```dart
import 'package:fast_nav/fast_nav.dart';
import 'package:flutter/material.dart';

void example() {
  MaterialApp(
    navigatorKey: FastNav.init(GlobalKey<NavigatorState>()),
  );
}

```

## Usage
<!-- embedme readme/usage.dart -->
```dart
import 'package:fast_nav/fast_nav.dart';
import 'package:flutter/material.dart';

void example() {
  FastNav.push(const Text('New page'));
}

```

<!-- embedme readme/nested_navigator.dart -->
```dart
import 'package:fast_nav/fast_nav.dart';
import 'package:flutter/material.dart';

void example() {
  // ...

  NestedNavigator(
    navigatorKey: GlobalKey<NavigatorState>(),
    name: 'nested',
    home: const Text('home'),
  );

  // ...

  FastNav.push(const Text('New page'), navigatorName: 'nested');
}

```

## Additional information
See [fast_ui](https://pub.dev/packages/fast_ui) for more information