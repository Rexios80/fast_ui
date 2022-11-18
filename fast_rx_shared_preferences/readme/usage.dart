import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_persistence/fast_rx_persistence.dart';
import 'package:fast_rx_shared_preferences/fast_rx_shared_preferences.dart';

void example() async {
  await FastRxSharedPreferences.init();

  // Will read the value of the key from Shared Preferences
  final rx = 0.rx..persist('key');

  // Will write the value to Shared Preferences
  rx.value = 1;
}
