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
