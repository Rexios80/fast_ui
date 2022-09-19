// ignore_for_file: implementation_imports, invalid_use_of_visible_for_testing_member

import 'package:fast_rx/src/rx/rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:flutter/foundation.dart';
import 'package:test/test.dart';

/// Expect that every test in [shouldNotify] notifies exactly once, and that
/// every test in [shouldNotNotify] does not notify
expectRxNotification<T extends Rx>({
  List<RxTest<T>> shouldNotify = const [],
  List<RxTest<T>> shouldNotNotify = const [],
}) {
  runTest(RxTest<T> test, int count) {
    final rx = test.rx;
    rx.stream.map((value) {
      // The callback in [expectAsync1] does not get called after [test.count]
      // number of calls, so we need to print debug information before that
      if (test.verbose) {
        debugPrint('${test.id}: $value');
      }
      return value;
    }).listen(
      expectAsync1(
        (value) {},
        count: count,
        id: test.id,
      ),
    );
    test.transform(rx);
  }

  for (final test in shouldNotify) {
    runTest(test, 1);
  }

  for (final test in shouldNotNotify) {
    runTest(test, 0);
  }
}
