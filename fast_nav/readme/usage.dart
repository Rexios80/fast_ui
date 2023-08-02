import 'package:fast_nav/fast_nav.dart';
import 'package:flutter/material.dart';

void example(BuildContext context) {
  context.push(const Text('Navigate with context'));
  FastNav.push(const Text('or without'));
}
