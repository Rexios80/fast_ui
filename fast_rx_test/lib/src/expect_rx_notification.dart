// ignore_for_file: implementation_imports, invalid_use_of_visible_for_testing_member

import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:test/test.dart';
import 'package:fast_rx/src/rx/rx_zone_keys.dart';

/// Expect that every test in [shouldNotify] notifies exactly once, and that
/// every test in [shouldNotNotify] does not notify.
expectRxNotification<T extends Rx>({
  List<RxTest<T>> shouldNotify = const [],
  List<RxTest<T>> shouldNotNotify = const [],
}) {
  void runTest(RxTest<T> test, int count) {
    var notifications = 0;
    final rx = test.generate();
    runRxZoned(
      () => test.transform(rx),
      notifier: (int id) {
        if (id == identityHashCode(rx) ||
            (rx is RxCompositeMixin && rx.hasStream(id))) {
          notifications++;
        }
      },
    );
    expect(notifications, count);
  }

  for (final test in shouldNotify) {
    runTest(test, test.count);
  }
  for (final test in shouldNotNotify) {
    runTest(test, 0);
  }
}
