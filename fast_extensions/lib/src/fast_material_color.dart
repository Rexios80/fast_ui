import 'package:flutter/material.dart';

/// Extension on [MaterialColor]
extension FastMaterialColor on MaterialColor {
  /// Create a [MaterialColor] from a [Color]
  ///
  /// Credit: https://medium.com/@filipvk/creating-a-custom-color-swatch-in-flutter-554bcdcb27f3
  static MaterialColor fromColor(Color color) {
    final strengths = [0.05];
    final swatch = <int, Color>{};
    final r = (color.r * 255).round();
    final g = (color.g * 255).round();
    final b = (color.b * 255).round();

    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (final strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(_valueForColor(color), swatch);
  }

  /// Copied from [Color] class
  static int _floatToInt8(double x) {
    return (x * 255.0).round() & 0xff;
  }

  /// Copied from [Color] class
  static int _valueForColor(Color color) {
    return _floatToInt8(color.a) << 24 |
        _floatToInt8(color.r) << 16 |
        _floatToInt8(color.g) << 8 |
        _floatToInt8(color.b) << 0;
  }
}
