import 'dart:async';

import 'package:fast_rx_persistence/fast_rx_persistence.dart';
import 'package:fast_rx_shared_preferences/fast_rx_shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';
import 'package:fast_rx/fast_rx.dart';

void main() async {
  Future<void> setup([Map<String, Object>? values]) async {
    FastRxSharedPreferences.reset();
    SharedPreferences.setMockInitialValues(values ?? {});
    await FastRxSharedPreferences.init();
  }

  test('Integer preference', () async {
    await setup({'key': 1});

    final pref = 0.rx..persist('key');
    expect(pref.value, 1);

    pref.value = 2;
    // Wait for the stream to emit the update
    await Future.delayed(Duration.zero);
    expect(FastRxPersistence.store.get('key'), 2);
    expect(pref.value, 2);
  });

  test('Double preference', () async {
    await setup({'key': 1.0});

    final pref = 0.0.rx..persist('key');
    expect(pref.value, 1.0);

    pref.value = 2.0;
    // Wait for the stream to emit the update
    await Future.delayed(Duration.zero);
    expect(FastRxPersistence.store.get('key'), 2.0);
    expect(pref.value, 2.0);
  });

  test('Boolean preference', () async {
    await setup({'key': true});

    final pref = false.rx..persist('key');
    expect(pref.value, true);

    pref.value = false;
    // Wait for the stream to emit the update
    await Future.delayed(Duration.zero);
    expect(FastRxPersistence.store.get('key'), false);
    expect(pref.value, false);
  });

  test('String preference', () async {
    await setup({'key': 'value2'});

    final pref = 'value'.rx..persist('key');
    expect(pref.value, 'value2');

    pref.value = 'value3';
    // Wait for the stream to emit the update
    await Future.delayed(Duration.zero);
    expect(FastRxPersistence.store.get('key'), 'value3');
    expect(pref.value, 'value3');
  });

  test('String list preference', () async {
    await setup({
      'key': <dynamic>['']
    });

    final pref = <String>[].rx..persist('key');
    expect(listEquals(pref, ['']), isTrue);

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
    await setup();

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

  test('List of unsupported type', () async {
    await setup();

    // Lists of types besides string are not supported
    expect(
      () => FastRxPersistence.store.set('key', [1, 2, 3]),
      throwsA(isA<UnsupportedError>()),
    );
  });

  test('Object of unsupported type', () async {
    await setup();

    // Sets are not supported
    expect(
      () => FastRxPersistence.store.set('key', {}),
      throwsA(isA<UnsupportedError>()),
    );
  });
}
