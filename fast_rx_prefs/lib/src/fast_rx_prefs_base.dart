import 'package:fast_rx_prefs/src/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A fast_rx implementation of shared preferences
class FastRxPrefs {
  FastRxPrefs._(); // coverage:ignore-line

  static SharedPreferences? _prefs;

  /// The [SharedPreferences] instance
  static SharedPreferences get prefs {
    _checkInit();
    return _prefs!;
  }

  /// Initialize the internal [SharedPreferences] instance. Must be called
  /// before using any other features. Subsequent calls will have no effect.
  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static void _checkInit() {
    try {
      _prefs!;
    } catch (e) {
      throw FastRxPrefsNotInitialized();
    }
  }
}
