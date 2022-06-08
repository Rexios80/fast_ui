import 'package:fast_rx_persistence/fast_rx_persistence.dart';
import 'package:test/test.dart';
import 'package:fast_rx/fast_rx.dart';

void main() {
  test('Check init', () {
    expect(
      () => FastRxPersistence.interface,
      throwsA(isA<FastRxPersistenceNotInitialized>()),
    );
  });

  test('Saving', () async {
    FastRxPersistence.reset();
    FastRxPersistence.init(Store());

    final rx = 0.rx..persist('key');
    expect(rx.value, 0);

    rx.value = 12;
    expect(rx.value, 12);

    // Wait for the stream to emit the update
    await Future.delayed(Duration.zero);
    expect(FastRxPersistence.interface.get('key'), 12);
  });

  test('Reading', () {
    FastRxPersistence.reset();
    FastRxPersistence.init(Store(values: {'key': 17}));

    final rx = 0.rx..persist('key');
    expect(rx.value, 17);
  });

  test('Transforming', () async {
    FastRxPersistence.reset();
    FastRxPersistence.init(Store(values: {'key': '17'}));

    final rx = 0.rx
      ..persist<String>(
        'key',
        decode: (value) => int.parse(value),
        encode: (value) => value.toString(),
      );
    
    expect(rx.value, 17);

    rx.value = 12;
    // Wait for the stream to emit the update
    await Future.delayed(Duration.zero);
    expect(FastRxPersistence.interface.get('key'), '12');
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
