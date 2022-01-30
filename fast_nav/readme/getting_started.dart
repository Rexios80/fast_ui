import 'package:fast_nav/fast_nav.dart';
import 'package:flutter/material.dart';

void example() {
  MaterialApp(
    navigatorKey: FastNav.init(),
    // Required for duplicate prevention
    navigatorObservers: [FastNavObserver()],
    // Required for anonymous page route duplicate prevention to work on root page
    onGenerateRoute: (settings) => FastNav.generateAnonymousRoute(
      settings: settings,
      page: const Text('home'),
    ),
  );
}
