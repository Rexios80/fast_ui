import 'package:fast_nav/fast_nav.dart';
import 'package:flutter/material.dart';

void example() {
  // ...

  NestedNavigator(
    navigatorKey: GlobalKey<NavigatorState>(),
    name: 'nestedNavigator',
    home: const Text('home'),
  );

  // ...

  FastNav.push(const Text('New page'), navigatorName: 'nestedNavigator');
}
