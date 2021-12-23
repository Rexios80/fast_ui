Navigate without context

## Features
fast_nav supports the following navigation methods:
- pop
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
FastNav.push(const NewPage());
```
