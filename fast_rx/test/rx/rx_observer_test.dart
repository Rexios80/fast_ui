import 'package:fast_rx/fast_rx.dart';
import 'package:test/test.dart';

void main() {
  test('RxObserver should not throw', () {
    final observer = RxObserver();
    final rx = ''.rx;
    builder() => rx.value;

    observer.setup(builder);
  });

  test('RxObserver should throw', () {
    final observer = RxObserver();
    builder() => '';

    expect(
      () => observer.setup(builder),
      throwsA(isA<RxObserverIsNotListenable>()),
    );
  });
}
