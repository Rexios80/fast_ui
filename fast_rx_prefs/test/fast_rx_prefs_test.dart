import 'dart:async';

import 'package:fast_rx_prefs/fast_rx_prefs.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

void main() {
  SharedPreferences.setMockInitialValues({});

  test('Check init', () async {
    expect(
      () => FastRxPrefs.prefs,
      throwsA(isA<FastRxPrefsNotInitialized>()),
    );

    await FastRxPrefs.init();
    expect(FastRxPrefs.prefs, isA<SharedPreferences>());
  });

  test('Integer preference', () async {
    await FastRxPrefs.init();
    unawaited(FastRxPrefs.prefs.clear());

    final pref = RxPref('key', defaultValue: 0);
    // The default value isn't stored in Shared Preferences
    expect(FastRxPrefs.prefs.get('key'), null);
    expect(pref.value, 0);

    pref.value = 1;
    // Ensure that the value is stored in Shared Preferences
    expect(FastRxPrefs.prefs.get('key'), 1);
    expect(pref.value, 1);
  });

  test('Double preference', () async {
    await FastRxPrefs.init();
    unawaited(FastRxPrefs.prefs.clear());

    final pref = RxPref('key', defaultValue: 0.0);
    // The default value isn't stored in Shared Preferences
    expect(FastRxPrefs.prefs.get('key'), null);
    expect(pref.value, 0.0);

    pref.value = 1.0;
    // Ensure that the value is stored in Shared Preferences
    expect(FastRxPrefs.prefs.get('key'), 1.0);
    expect(pref.value, 1.0);
  });

  test('Boolean preference', () async {
    await FastRxPrefs.init();
    unawaited(FastRxPrefs.prefs.clear());

    final pref = RxPref('key', defaultValue: false);
    // The default value isn't stored in Shared Preferences
    expect(FastRxPrefs.prefs.get('key'), null);
    expect(pref.value, false);

    pref.value = true;
    // Ensure that the value is stored in Shared Preferences
    expect(FastRxPrefs.prefs.get('key'), true);
    expect(pref.value, true);
  });

  test('String preference', () async {
    await FastRxPrefs.init();
    unawaited(FastRxPrefs.prefs.clear());

    final pref = RxPref('key', defaultValue: 'defaultValue');
    // The default value isn't stored in Shared Preferences
    expect(FastRxPrefs.prefs.get('key'), null);
    expect(pref.value, 'defaultValue');

    pref.value = 'newValue';
    // Ensure that the value is stored in Shared Preferences
    expect(FastRxPrefs.prefs.get('key'), 'newValue');
    expect(pref.value, 'newValue');
  });

  test('String list preference', () async {
    await FastRxPrefs.init();
    unawaited(FastRxPrefs.prefs.clear());

    // Since we aren't transforming the value, [I] can be whatever
    final pref = RxPref<List<String>, dynamic>('key', defaultValue: []);
    // The default value isn't stored in Shared Preferences
    expect(FastRxPrefs.prefs.get('key'), null);
    expect(listEquals(pref.value, []), isTrue);

    pref.value = ['a', 'b', 'c'];
    // Ensure that the value is stored in Shared Preferences
    expect(
      listEquals(FastRxPrefs.prefs.getStringList('key'), ['a', 'b', 'c']),
      isTrue,
    );
    expect(listEquals(pref.value, ['a', 'b', 'c']), isTrue);
  });

  test('Preference removal', () async {
    await FastRxPrefs.init();
    unawaited(FastRxPrefs.prefs.clear());

    final pref = RxPref('key', defaultValue: false);
    // The default value isn't stored in Shared Preferences
    expect(FastRxPrefs.prefs.get('key'), null);
    expect(pref.value, false);

    
  });

  test('Tranformation test', () async {
    await FastRxPrefs.init();
    unawaited(FastRxPrefs.prefs.clear());

    // Both [fromPref] and [toPref] must be defined
    expect(
      () => RxPref('key', defaultValue: null, fromPref: (_) => null),
      throwsA(isA<AssertionError>()),
    );

    // Both [fromPref] and [toPref] must be defined
    expect(
      () => RxPref('key', defaultValue: null, toPref: (_) => null),
      throwsA(isA<AssertionError>()),
    );

    final pref = RxPref<List<int>, List<String>>(
      'key',
      defaultValue: [],
      fromPref: (value) => value.map((e) => int.parse(e)).toList(),
      toPref: (value) => value.map((e) => e.toString()).toList(),
    );

    // The default value isn't stored in Shared Preferences
    expect(FastRxPrefs.prefs.get('key'), null);
    expect(listEquals(pref.value, []), isTrue);

    pref.value = [1, 2, 3];
    // Ensure that the value is stored in Shared Preferences
    expect(
      listEquals(FastRxPrefs.prefs.getStringList('key'), ['1', '2', '3']),
      isTrue,
    );
    expect(listEquals(pref.value, [1, 2, 3]), isTrue);

    final pref2 = RxPref<List<int>, List<String>>(
      'key',
      defaultValue: [],
      fromPref: (value) => value.map((e) => int.parse(e)).toList(),
      toPref: (value) => value.map((e) => e.toString()).toList(),
    );
    // Ensure the value is transformed properly on first read
    expect(listEquals(pref2.value, [1, 2, 3]), isTrue);
  });
}
