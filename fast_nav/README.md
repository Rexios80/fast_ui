Navigate without context

[![pub package](https://img.shields.io/pub/v/fast_nav.svg?label=fast_nav)](https://pub.dev/packages/fast_nav)
[![codecov](https://codecov.io/gh/Rexios80/fast_ui/branch/master/graph/badge.svg?flag=project-fast_nav)](https://codecov.io/gh/Rexios80/fast_ui)
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
```dart
MaterialApp(
  navigatorKey: FastNav.init(GlobalKey<NavigatorState>()),
);
```

## Usage
```dart
import 'package:fast_nav/fast_nav.dart';

FastNav.push(const NewPage());
```

```dart
import 'package:fast_nav/fast_nav.dart';

...

NestedNavigator(
  navigatorKey: GlobalKey<NavigatorState>(),
  name: 'nested',
  home: const Text('home'),
);

...

FastNav.push(const NewPage(), navigatorName: 'nested');
```

## Additional information
See [fast_ui](https://pub.dev/packages/fast_ui) for more information