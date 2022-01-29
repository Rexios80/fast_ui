import 'package:fast_nav/fast_nav.dart';
import 'package:flutter/material.dart';

void example() {
  MaterialApp(
    navigatorKey: FastNav.init(),
    // Required for duplicate prevention
    navigatorObservers: [FastNavObserver()],
  );
}
