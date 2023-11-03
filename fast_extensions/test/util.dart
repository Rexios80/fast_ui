import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> testContextExtensions(
  WidgetTester tester,
  void Function(BuildContext context) builder,
) =>
    tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            builder(context);
            return const SizedBox.shrink();
          },
        ),
      ),
    );
