import 'package:flutter/material.dart';

/// Extension on [BuildContext] to read [WidgetsLocalizations] information
extension FastWidgetsLocalizations on BuildContext {
  /// The [WidgetsLocalizations] of the current [BuildContext]
  WidgetsLocalizations get widgetsLocalizations =>
      WidgetsLocalizations.of(this);

  /// The [WidgetsLocalizations.textDirection] of the current [BuildContext]
  TextDirection get textDirection => widgetsLocalizations.textDirection;

  /// The [WidgetsLocalizations.reorderItemDown] of the current [BuildContext]
  String get reorderItemDown => widgetsLocalizations.reorderItemDown;

  /// The [WidgetsLocalizations.reorderItemLeft] of the current [BuildContext]
  String get reorderItemLeft => widgetsLocalizations.reorderItemLeft;

  /// The [WidgetsLocalizations.reorderItemRight] of the current [BuildContext]
  String get reorderItemRight => widgetsLocalizations.reorderItemRight;

  /// The [WidgetsLocalizations.reorderItemToEnd] of the current [BuildContext]
  String get reorderItemToEnd => widgetsLocalizations.reorderItemToEnd;

  /// The [WidgetsLocalizations.reorderItemToStart] of the current [BuildContext]
  String get reorderItemToStart => widgetsLocalizations.reorderItemToStart;

  /// The [WidgetsLocalizations.reorderItemUp] of the current [BuildContext]
  String get reorderItemUp => widgetsLocalizations.reorderItemUp;
}
