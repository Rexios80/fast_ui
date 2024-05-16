import 'package:flutter/material.dart';

/// Create a [WidgetStateProperty] using only a map of [WidgetState]s
class FastWidgetStateProperty<T> extends WidgetStateProperty<T?> {
  /// The map used to resolve the property
  final Map<WidgetState, T> resolution;

  /// The value to use if no match is found in [resolution]
  final T? defaultValue;

  /// Constructor
  FastWidgetStateProperty(this.resolution, {this.defaultValue});

  @override
  T? resolve(Set<WidgetState> states) {
    for (final state in states) {
      if (resolution.containsKey(state)) {
        return resolution[state];
      }
    }

    return defaultValue;
  }
}
