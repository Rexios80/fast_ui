import 'package:fast_rx_persistence/fast_rx_persistence.dart';
import 'package:flutter/foundation.dart';
import 'package:test/test.dart';
import 'package:fast_rx/fast_rx.dart';

void main() {
  setUp(() {
    FastRxPersistence.reset();
  });

  test('Check init', () {
    expect(
      () => FastRxPersistence.store,
      throwsA(isA<FastRxPersistenceNotInitialized>()),
    );
  });

  test('Saving', () async {
    FastRxPersistence.init(Store());

    final rx = 0.rx..persist('key');
    expect(rx.value, 0);

    rx.value = 12;
    expect(rx.value, 12);

    // Wait for the stream to emit the update
    await Future.delayed(Duration.zero);
    expect(FastRxPersistence.store.get('key'), 12);
  });

  test('Reading', () {
    FastRxPersistence.init(Store(values: {'key': 17}));

    final rx = 0.rx..persist('key');
    expect(rx.value, 17);
  });

  test('Transformation', () async {
    FastRxPersistence.init(
      Store(
        values: {
          'key': ['17'],
        },
      ),
    );

    final rx = <int>[].rx
      ..persist<List<String>>(
        'key',
        converter: InlineConverter(
          fromStore: (value) => value.map(int.parse).toList(),
          toStore: (value) => value.map((e) => e.toString()).toList(),
        ),
      );

    expect(listEquals(rx, [17]), isTrue);

    rx.add(12);
    // Wait for the stream to emit the update
    await Future.delayed(Duration.zero);
    expect(
      listEquals(FastRxPersistence.store.get('key') as List, ['17', '12']),
      isTrue,
    );
  });

  test('Enum transformation', () async {
    FastRxPersistence.init(Store(values: {'key0': 'zero', 'key1': 0}));

    final rx0 = TestEnum.one.rx
      ..persist('key0', converter: const EnumStringConverter(TestEnum.values));
    final rx1 = TestEnum.one.rx
      ..persist('key1', converter: const EnumIntConverter(TestEnum.values));

    expect(rx0.value, TestEnum.zero);
    expect(rx1.value, TestEnum.zero);

    rx0.value = TestEnum.one;
    rx1.value = TestEnum.one;

    // Wait for the stream to emit the update
    await Future.delayed(Duration.zero);

    expect(FastRxPersistence.store.get('key0'), 'one');
    expect(FastRxPersistence.store.get('key1'), 1);
  });
}

class Store extends FastRxPersistenceInterface {
  final Map<String, dynamic> _store;

  Store({Map<String, dynamic>? values}) : _store = values ?? {};

  @override
  Object? get(String key) {
    return _store[key];
  }

  @override
  void set(String key, Object? value) {
    _store[key] = value;
  }
}

enum TestEnum {
  zero,
  one,
}
