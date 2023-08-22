import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fast_extensions/src/fast_locale.dart';

import 'util.dart';

void main() {
  testWidgets(
    'FastLocale',
    (tester) => testContextExtensions(
      tester,
      (context) {
        final locale = Localizations.localeOf(context);
        expect(context.locale, locale);
        expect(context.countryCode, locale.countryCode);
        expect(context.languageCode, locale.languageCode);
        expect(context.scriptCode, locale.scriptCode);
        expect(context.languageTag, locale.toLanguageTag());
      },
    ),
  );
}
