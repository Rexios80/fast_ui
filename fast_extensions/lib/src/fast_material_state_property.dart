import 'package:flutter/material.dart';

/// Create a [MaterialStateProperty] using only a map of [MaterialState]s
class FastMaterialStateProperty<T> extends MaterialStateProperty<T?> {
  /// The map used to resolve the property
  final Map<MaterialState, T> resolution;

  /// The value to use if no match is found in [resolution]
  final T? defaultValue;

  /// Constructor
  FastMaterialStateProperty(this.resolution, {this.defaultValue});

  @override
  T? resolve(Set<MaterialState> states) {
    for (final state in states) {
      if (resolution.containsKey(state)) {
        return resolution[state];
      }
    }

    return defaultValue;
  }
}
