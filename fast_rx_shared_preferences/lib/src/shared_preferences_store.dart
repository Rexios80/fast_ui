import 'package:fast_rx_persistence/fast_rx_persistence.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A [SharedPreferences] implementation of [FastRxPersistenceInterface]
class SharedPreferencesStore extends FastRxPersistenceInterface {
  final SharedPreferences _prefs;

  /// Constructor
  SharedPreferencesStore(this._prefs);

  @override
  Object? get(String key) {
    final value = _prefs.get(key);
    // String lists from Shared Preferences need casted
    if (value is List && value is! List<String>) return value.cast<String>();
    return value;
  }

  @override
  void set(String key, Object? value) {
    if (value is int) {
      _prefs.setInt(key, value);
    } else if (value is double) {
      _prefs.setDouble(key, value);
    } else if (value is bool) {
      _prefs.setBool(key, value);
    } else if (value is String) {
      _prefs.setString(key, value);
    } else if (value is List) {
      try {
        _prefs.setStringList(key, value.cast<String>());
      } catch (e) {
        throw UnsupportedError(
          'List must be of type String for storage in Shared Preferences',
        );
      }
    } else if (value == null) {
      _prefs.remove(key);
    } else {
      throw UnsupportedError(
        'Unsupported type for Shared Preferences: ${value.runtimeType}',
      );
    }
  }
}
