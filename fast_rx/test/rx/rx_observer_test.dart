import 'package:fast_rx/fast_rx.dart';
import 'package:test/test.dart';

void main() {
  test('RxObserver should not throw', () {
    final observer = RxObserver();
    final rx = ''.rx;
    void builder() => rx.value;

    observer.setup(builder);

    // These get tested by UI implementations
    observer.listen(() {});
    observer.dispose();
  });

  test('RxObserver should throw', () {
    final observer = RxObserver();
    void builder() => '';

    expect(
      () => observer.setup(builder),
      throwsA(isA<RxObserverIsNotListenable>()),
    );
  });
}
