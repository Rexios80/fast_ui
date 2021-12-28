import 'package:flutter/material.dart';

/// Extension on [BuildContext] to read [Locale] information
extension FastLocale on BuildContext {
  /// The [Locale] of the current [BuildContext]
  Locale get locale => Localizations.localeOf(this);

  /// The [Locale.countryCode] of the current [BuildContext]
  String? get countryCode => locale.countryCode;

  /// The [Locale.languageCode] of the current [BuildContext]
  String get languageCode => locale.languageCode;

  /// The [Locale.scriptCode] of the current [BuildContext]
  String? get scriptCode => locale.scriptCode;

  /// The [Locale.toLanguageTag] of the current [BuildContext]
  String get languageTag => locale.toLanguageTag();
}
