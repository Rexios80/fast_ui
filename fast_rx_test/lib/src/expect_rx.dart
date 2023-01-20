// ignore_for_file: implementation_imports, invalid_use_of_visible_for_testing_member

import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:test/test.dart';

/// Expect that every test in [shouldNotify] notifies exactly once, and that
/// every test in [shouldNotNotify] does not notify.
void expectRx<T extends Rx>({
  List<RxTest<T>> shouldRegister = const [],
  List<RxTest<T>> shouldNotRegister = const [],
  List<RxTest<T>> shouldNotify = const [],
  List<RxTest<T>> shouldNotNotify = const [],
}) {
  void testRegistration(RxTest<T> test, int count) {
    var registrations = 0;
    final rx = test.generate();
    runRxZoned(
      () => test.transform(rx),
      registrar: (stream) => registrations++,
    );
    expect(registrations, count);
  }

  for (final test in shouldRegister) {
    testRegistration(test, test.count);
  }

  for (final test in shouldNotRegister) {
    testRegistration(test, 0);
  }

  void testNotifications(RxTest<T> test, int count) {
    var notifications = 0;
    final rx = test.generate();
    runRxZoned(
      () => test.transform(rx),
      notifier: (id) {
        if (id == identityHashCode(rx) ||
            (rx is RxCompositeMixin && rx.hasStream(id))) {
          notifications++;
        }
      },
    );
    expect(notifications, count);
  }

  for (final test in shouldNotify) {
    testNotifications(test, test.count);
  }
  for (final test in shouldNotNotify) {
    testNotifications(test, 0);
  }
}
