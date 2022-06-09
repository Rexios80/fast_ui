import 'package:fast_rx_persistence/fast_rx_persistence.dart';
import 'package:fast_rx_shared_preferences/src/shared_preferences_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Convenience class for initializing [FastRxPersistence] with a
/// [SharedPreferencesStore]
class FastRxSharedPreferences {
  FastRxSharedPreferences._(); // coverage:ignore-line

  /// Initializes [FastRxPersistence] with a [SharedPreferencesStore]
  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    FastRxPersistence.init(SharedPreferencesStore(prefs));
  }
}
