import 'package:fast_rx_persistence/fast_rx_persistence.dart';
import 'package:fast_rx_shared_preferences/src/exceptions.dart';
import 'package:fast_rx_shared_preferences/src/shared_preferences_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Convenience class for initializing [FastRxPersistence] with a
/// [SharedPreferencesStore]
class FastRxSharedPreferences {
  FastRxSharedPreferences._(); // coverage:ignore-line

  static SharedPreferences? _prefs;

  /// The [SharedPreferences] instance
  ///
  /// Must call [init] before accessing
  static SharedPreferences get prefs {
    _checkInit();
    return _prefs!;
  }

  /// Initializes [FastRxPersistence] with a [SharedPreferencesStore]
  ///
  /// Subsequent calls will have no effect
  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
    FastRxPersistence.init(SharedPreferencesStore(prefs));
  }

  static void _checkInit() {
    try {
      _prefs!;
    } catch (e) {
      throw FastRxSharedPreferencesNotInitialized();
    }
  }
}
