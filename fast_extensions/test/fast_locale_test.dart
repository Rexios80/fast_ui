import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fast_extensions/src/fast_locale.dart';

void main() {
  testWidgets('FastLocale', (tester) async {
    final widget = MaterialApp(
      home: Builder(
        builder: (context) {
          final locale = Localizations.localeOf(context);
          expect(context.locale, locale);
          expect(context.countryCode, locale.countryCode);
          expect(context.languageCode, locale.languageCode);
          expect(context.scriptCode, locale.scriptCode);
          expect(context.languageTag, locale.toLanguageTag());
          return const SizedBox.shrink();
        },
      ),
    );
    await tester.pumpWidget(widget);
  });
}
