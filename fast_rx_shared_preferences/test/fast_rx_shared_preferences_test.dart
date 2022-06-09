import 'dart:async';

import 'package:fast_rx_persistence/fast_rx_persistence.dart';
import 'package:fast_rx_shared_preferences/src/fast_rx_shared_preferences_base.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';
import 'package:fast_rx/fast_rx.dart';

void main() async {
  SharedPreferences.setMockInitialValues({});
  await FastRxSharedPreferences.init();

  setUp(() async {
    final prefs = await SharedPreferences.getInstance();
    unawaited(prefs.clear());
  });

  test('Integer preference', () async {
    final pref = 0.rx..persist('key');
    // The default value isn't stored in Shared Preferences
    expect(FastRxPersistence.store.get('key'), null);
    expect(pref.value, 0);

    pref.value = 1;
    // Wait for the stream to emit the update
    await Future.delayed(Duration.zero);
    // Ensure that the value is stored in Shared Preferences
    expect(FastRxPersistence.store.get('key'), 1);
    expect(pref.value, 1);
  });

  test('Double preference', () async {
    final pref = 0.0.rx..persist('key');
    // The default value isn't stored in Shared Preferences
    expect(FastRxPersistence.store.get('key'), null);
    expect(pref.value, 0.0);

    pref.value = 1.0;
    // Wait for the stream to emit the update
    await Future.delayed(Duration.zero);
    // Ensure that the value is stored in Shared Preferences
    expect(FastRxPersistence.store.get('key'), 1.0);
    expect(pref.value, 1.0);
  });

  test('Boolean preference', () async {
    final pref = false.rx..persist('key');
    // The default value isn't stored in Shared Preferences
    expect(FastRxPersistence.store.get('key'), null);
    expect(pref.value, false);

    pref.value = true;
    // Wait for the stream to emit the update
    await Future.delayed(Duration.zero);
    // Ensure that the value is stored in Shared Preferences
    expect(FastRxPersistence.store.get('key'), true);
    expect(pref.value, true);
  });

  test('String preference', () async {
    final pref = 'value'.rx..persist('key');
    // The default value isn't stored in Shared Preferences
    expect(FastRxPersistence.store.get('key'), null);
    expect(pref.value, 'value');

    pref.value = 'newValue';
    // Wait for the stream to emit the update
    await Future.delayed(Duration.zero);
    // Ensure that the value is stored in Shared Preferences
    expect(FastRxPersistence.store.get('key'), 'newValue');
    expect(pref.value, 'newValue');
  });

  test('String list preference', () async {
    // Since we aren't transforming the value, [I] can be whatever
    final pref = [].rx..persist('key');
    // The default value isn't stored in Shared Preferences
    expect(FastRxPersistence.store.get('key'), null);
    expect(listEquals(pref, []), isTrue);

    pref.replaceAll(['a', 'b', 'c']);
    // Wait for the stream to emit the update
    await Future.delayed(Duration.zero);
    // Ensure that the value is stored in Shared Preferences
    expect(
      listEquals(FastRxPersistence.store.get('key') as List, ['a', 'b', 'c']),
      isTrue,
    );
    expect(listEquals(pref, ['a', 'b', 'c']), isTrue);
  });

  test('Nullable preference removal', () async {
    final pref = RxValue<String?>('value')..persist('key');
    pref.value = 'newValue';
    // Wait for the stream to emit the update
    await Future.delayed(Duration.zero);
    expect(FastRxPersistence.store.get('key'), 'newValue');

    pref.value = null;
    // Wait for the stream to emit the update
    await Future.delayed(Duration.zero);
    // Ensure that the value is removed from Shared Preferences
    expect(FastRxPersistence.store.get('key'), null);
    expect(pref.value, null);
  });

  test('List of unsupported type', () {
    // Lists of types besides string are not supported
    expect(
      () => FastRxPersistence.store.set('key', [1, 2, 3]),
      throwsA(isA<UnsupportedError>()),
    );
  });

  test('Object of unsupported type', () {
    // Sets are not supported
    expect(
      () => FastRxPersistence.store.set('key', {}),
      throwsA(isA<UnsupportedError>()),
    );
  });
}
