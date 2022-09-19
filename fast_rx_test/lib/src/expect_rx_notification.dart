// ignore_for_file: implementation_imports, invalid_use_of_visible_for_testing_member

import 'package:fast_rx/src/rx/rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:test/test.dart';

/// Expect that every test in [shouldNotify] notifies exactly once, and that
/// every test in [shouldNotNotify] does not notify. Set [verbose] to true for
/// more debug information.
expectRxNotification<T extends Rx>({
  List<RxTest<T>> shouldNotify = const [],
  List<RxTest<T>> shouldNotNotify = const [],
}) {
  runTest(RxTest<T> test, int count) {
    final rx = test.generate();
    expect(
      rx.stream,
      emitsInOrder([
        ...List.generate(count, (_) => anything),
        emitsDone,
      ]),
    );
    test.transform(rx);
    rx.close();
  }

  for (final test in shouldNotify) {
    runTest(test, 1);
  }

  for (final test in shouldNotNotify) {
    runTest(test, 0);
  }
}
