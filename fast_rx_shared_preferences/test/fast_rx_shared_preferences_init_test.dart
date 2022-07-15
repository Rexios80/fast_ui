import 'package:fast_rx_shared_preferences/fast_rx_shared_preferences.dart';
import 'package:test/test.dart';

void main() {
  test('Check init', () {
    expect(
      () => FastRxSharedPreferences.prefs,
      throwsA(isA<FastRxSharedPreferencesNotInitialized>()),
    );
  });
}
