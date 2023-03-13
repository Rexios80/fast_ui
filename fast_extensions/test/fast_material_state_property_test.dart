import 'package:fast_extensions/src/fast_material_state_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fast_extensions/src/fast_material_color.dart';

void main() {
  test('FastMaterialStateProperty', () {
    final msp = FastMaterialStateProperty(
      {MaterialState.selected: Colors.white},
      defaultValue: Colors.black,
    );
    // Expect that the primary shade matches the color we passed in
    expect(
      msp.resolve({MaterialState.disabled, MaterialState.selected}),
      Colors.white,
    );

    expect(
      msp.resolve({MaterialState.disabled}),
      Colors.black,
    );
  });
}
