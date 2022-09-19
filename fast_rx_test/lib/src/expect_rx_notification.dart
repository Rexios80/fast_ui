// ignore_for_file: implementation_imports, invalid_use_of_visible_for_testing_member

import 'package:fast_rx/src/rx/rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:test/test.dart';

/// Expect that every test in [shouldNotify] notifies exactly once, and that
/// every test in [shouldNotNotify] does not notify
expectRxNotification<T extends Rx>({
  List<RxTest<T>> shouldNotify = const [],
  List<RxTest<T>> shouldNotNotify = const [],
}) {
  for (final test in shouldNotify) {
    final rx = test.rx;
    rx.stream.listen(expectAsync1((value) {}));
    test.transform(rx);
  }

  for (final test in shouldNotNotify) {
    final rx = test.rx;
    rx.stream.listen(expectAsync1((value) {}, count: 0));
    test.transform(rx);
  }
}
