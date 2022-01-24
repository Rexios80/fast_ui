import 'package:fast_overlays/fast_overlays.dart';
import 'package:flutter/material.dart';

void example() {
  // ...

  MaterialApp(
    navigatorKey: FastOverlays.init(GlobalKey<NavigatorState>()),
  );
}
