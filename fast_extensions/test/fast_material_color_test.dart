import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fast_extensions/src/fast_material_color.dart';

void main() {
  test('FastMaterialColor', () {
    final swatch = FastMaterialColor.fromColor(Colors.red);
    // Expect that the primary shade matches the color we passed in
    expect(swatch.shade500, Colors.red.shade500);
  });
}
