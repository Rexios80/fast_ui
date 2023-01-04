import 'package:fast_overlays/fast_overlays.dart';
import 'package:flutter/material.dart';

void showSnackbar() {
  FastScaffold.showBottomSheet(
    (context) => const Text('I am a bottom sheet'),
  );
}
