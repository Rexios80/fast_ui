import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_prefs/src/fast_rx_prefs_base.dart';

/// A reactive Shared Preferences value
///
/// [T] is the type of the value
///
/// [I] is the internal type of the value stored in Shared Preferences
class RxPref<T, I> extends RxValue<T> {
  /// The key of the preference
  final String key;

  /// The default value of the preference
  final T defaultValue;

  /// Function to transform the internal preference value from type
  /// [I] to type [T]
  final T Function(I value)? fromPref;

  /// Function to transform the value from type [T] to type [I] for storage in
  /// Shared Preferences
  final I Function(T value)? toPref;

  /// Create a new [RxPref]
  RxPref(
    this.key, {
    required this.defaultValue,
    this.fromPref,
    this.toPref,
  })  : assert(
          (fromPref == null && toPref == null) ||
              (fromPref != null && toPref != null),
        ),
        super(
          () {
            final value = FastRxPrefs.prefs.get(key);
            if (value == null) {
              return defaultValue;
            } else {
              return fromPref?.call(value as I) ?? value as T;
            }
          }(),
        );

  /// Saves the value in Shared Preferences and notifies all observers if the
  /// value has changed.
  ///
  /// Setting the value to null will remove it from Shared Preferences.
  @override
  set value(T value) {
    final prefValue = toPref?.call(value) ?? value as I;

    if (prefValue is int) {
      FastRxPrefs.prefs.setInt(key, prefValue);
    } else if (prefValue is double) {
      FastRxPrefs.prefs.setDouble(key, prefValue);
    } else if (prefValue is bool) {
      FastRxPrefs.prefs.setBool(key, prefValue);
    } else if (prefValue is String) {
      FastRxPrefs.prefs.setString(key, prefValue);
    } else if (prefValue is List) {
      try {
        FastRxPrefs.prefs.setStringList(key, prefValue.cast<String>());
      } catch (e) {
        throw UnsupportedError(
          'List must be of type String for storage in Shared Preferences',
        );
      }
    } else if (prefValue == null) {
      FastRxPrefs.prefs.remove(key);
    } else {
      throw UnsupportedError(
        'Unsupported type for Shared Preferences: ${prefValue.runtimeType}',
      );
    }

    super.value = value;
  }

  /// Removes the value from Shared Preferences and sets the value to
  /// [defaultValue]
  void remove() {
    FastRxPrefs.prefs.remove(key);
    super.value = defaultValue;
  }
}
