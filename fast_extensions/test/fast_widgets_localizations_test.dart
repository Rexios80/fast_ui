import 'package:fast_extensions/fast_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'util.dart';

void main() {
  testWidgets(
    'FastWidgetsLocalizations',
    (tester) => testContextExtensions(
      tester,
      (context) {
        final widgetsLocalizations = WidgetsLocalizations.of(context);
        expect(context.textDirection, widgetsLocalizations.textDirection);
        expect(context.reorderItemDown, widgetsLocalizations.reorderItemDown);
        expect(context.reorderItemLeft, widgetsLocalizations.reorderItemLeft);
        expect(context.reorderItemRight, widgetsLocalizations.reorderItemRight);
        expect(context.reorderItemToEnd, widgetsLocalizations.reorderItemToEnd);
        expect(
          context.reorderItemToStart,
          widgetsLocalizations.reorderItemToStart,
        );
        expect(context.reorderItemUp, widgetsLocalizations.reorderItemUp);
      },
    ),
  );
}
