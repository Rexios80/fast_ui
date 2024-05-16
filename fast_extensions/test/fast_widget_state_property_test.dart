import 'package:fast_extensions/src/fast_material_state_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('FastWidgetStateProperty', () {
    final wsp = FastWidgetStateProperty(
      {WidgetState.selected: Colors.white},
      defaultValue: Colors.black,
    );
    // Expect that the primary shade matches the color we passed in
    expect(
      wsp.resolve({WidgetState.disabled, WidgetState.selected}),
      Colors.white,
    );

    expect(
      wsp.resolve({WidgetState.disabled}),
      Colors.black,
    );
  });
}
