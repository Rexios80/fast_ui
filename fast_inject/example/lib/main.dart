import 'package:fast_inject_example/deps.dart';
import 'package:fast_inject_example/nested.dart';
import 'package:fast_inject_example/stateful.dart';
import 'package:fast_inject_example/stateless.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        // body: Stateless()
        // body: Stateful()
        body: Nested()
          ..inject(Dep1())
          ..inject(Dep2())
          ..inject(Dep3()),
      ),
    ),
  );
}
